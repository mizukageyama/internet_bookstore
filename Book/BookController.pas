unit BookController;

interface

uses
  MVCFramework, MVCFramework.Commons, MVCFramework.Serializer.Commons,
  MVCFramework.ActiveRecord, BaseController, System.Generics.Collections,
  BookDAOIntf, Book, System.SysUtils, MVCFramework.Logger, REST.Client,
  System.Classes, System.DateUtils, System.NetEncoding, REST.Types, Web.HTTPApp,
  JSON, System.IOUtils;

type
  [MVCPath('/api/books')]
  TBookController = class(TBaseController)
  private
    FBookDAO: IBookDAO;
  public
    [MVCPath()]
    [MVCHTTPMethod([httpGET])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON)]
    procedure GetBooks;

    [MVCPath('/($BookId)')]
    [MVCHTTPMethod([httpGET])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON)]
    procedure GetBookById(const BookId: Integer);

    [MVCPath()]
    [MVCHTTPMethod([httpPOST])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON)]
    [MVCConsumes(TMVCMediaType.APPLICATION_JSON)]
    procedure CreateBook;

    [MVCPath('/($BookId)')]
    [MVCHTTPMethod([httpDELETE])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON)]
    procedure DeleteBook(const BookId: Integer);

    [MVCPath('/($BookId)')]
    [MVCHTTPMethod([httpPUT])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON)]
    [MVCConsumes(TMVCMediaType.APPLICATION_JSON)]
    procedure UpdateBook(const BookId: Integer);

    [MVCPath('/upload')]
    [MVCHTTPMethod([httpPOST])]
    procedure UploadImage;
    
    constructor Create; override;
  end;

implementation

{ TBookController }
uses
  BookDAO;

constructor TBookController.Create;
begin
  inherited Create;
  FBookDAO := TBookDAO.Create;
end;

procedure TBookController.CreateBook;
begin
  try
    var Book := Context.Request.BodyAs<TBook>;

    if not Book.IsValid then
    begin
      Render(HTTP_STATUS.BadRequest, 'Invalid request data');
      Exit;
    end;
    
    FBookDAO.CreateBook(Book);
    Render201Created('/api/books/' + Book.ID.ToString);
  except
    on E: Exception do
      Render(HTTP_STATUS.InternalServerError, 'An error occured');
  end;
end;

procedure TBookController.DeleteBook(const BookId: Integer);
begin
  try
    FBookDAO.DeleteBook(BookId);
    Render(204, '');
  except
    on E: EMVCActiveRecordNotFound  do
      Render(HTTP_STATUS.NotFound, 'Book not found');
    on E: Exception do
      Render(HTTP_STATUS.InternalServerError, 'Failed to delete book');
  end;
end;

procedure TBookController.GetBookById(const BookId: Integer);
begin
  try
    var Book := FBookDAO.GetBookById(BookId);     
    Render(ObjectDict().Add('data', Book));
  except
    on E: EMVCActiveRecordNotFound  do
      Render(HTTP_STATUS.NotFound, 'Book not found');
    on E: Exception do
      Render(HTTP_STATUS.InternalServerError, 'An error occured');
  end;
end;

procedure TBookController.GetBooks;
begin
   try
    var Books := FBookDAO.GetBooks;
    Render(ObjectDict().Add('data', Books));
 except
    on E: Exception do
      Render(HTTP_STATUS.InternalServerError, 'An error occured');
  end;
end;

procedure TBookController.UpdateBook(const BookId: Integer);
begin
  try
    var Book := Context.Request.BodyAs<TBook>;

    if not Book.IsValid then
    begin
      Render(HTTP_STATUS.BadRequest, 'Invalid request data');
      Exit;
    end;
    
    FBookDAO.UpdateBook(BookId, Book);
    Render(HTTP_STATUS.OK, '');
  except
    on E: EMVCActiveRecordNotFound  do
      Render(HTTP_STATUS.NotFound, 'Book not found');
    on E: Exception do
      Render(HTTP_STATUS.InternalServerError, 'Failed to update book');
  end;
end;

procedure TBookController.UploadImage;
var
  UploadedFile: TAbstractWebRequestFile;
  RESTClient: TRESTClient;
  RESTRequest: TRESTRequest;
  ResponseContent: string;
begin
  if Context.Request.Files.Count <> 1 then
  begin
    Render(HTTP_STATUS.BadRequest, 'Expected exactly 1 file');
    Exit;
  end;

  UploadedFile := Context.Request.Files[0];
   var FullFilePath := TPath.Combine('', UploadedFile.FileName);
  RESTClient := TRESTClient.Create(nil);
  RESTRequest := TRESTRequest.Create(nil);

  try
    RESTClient.BaseURL := 'https://api.cloudinary.com/v1_1/' + 'dcseyuhyn' +
      '/image/upload';
    RESTRequest.Client := RESTClient;
    RESTRequest.Method := rmPOST;
    RESTRequest.AddParameter('api_key', '642271547663687');
    RESTRequest.AddParameter('api_secret', '6nCfopfBWpjYPzwzvieWIrXC0X0');
    RESTRequest.AddParameter('timestamp', IntToStr(DateTimeToUnix(Now)));

   RESTRequest.AddFile('file', UploadedFile.FileName, TRESTContentType.ctIMAGE_JPEG);
    // Execute the Cloudinary upload request
    RESTRequest.AddParameter('upload_preset', 'this_is_the_preset');

    // Specify the folder in the public_id parameter
    var PublicID: string := 'Internet_Bookstore/' + UploadedFile.FileName;
    RESTRequest.AddParameter('public_id', PublicID);

    RESTRequest.Execute;
    ResponseContent := RESTRequest.Response.Content;

    // Handle the Cloudinary response (e.g., log success or error)
    if RESTRequest.Response.StatusCode = 200 then
    begin
      // Parse the JSON response to extract the URL
      var JsonObject: TJSONObject;
      JsonObject := TJSONObject.ParseJSONValue(ResponseContent) as TJSONObject;
      try
        var URL: string := JsonObject.GetValue('url').Value;
        // Render the URL response
        Render('File uploaded to Cloudinary: ' + URL);
      finally
        JsonObject.Free;
      end;
    end
    else
      Render(HTTP_STATUS.InternalServerError,
        'Failed to upload file to Cloudinary: ' + ResponseContent);
  finally
    RESTRequest.Free;
    RESTClient.Free;
  end;
end;


end.
