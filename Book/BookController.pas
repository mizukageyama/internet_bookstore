unit BookController;

interface

uses
  MVCFramework, MVCFramework.Commons, MVCFramework.Serializer.Commons,
  MVCFramework.ActiveRecord, BaseController, System.Generics.Collections,
  BookDAOIntf, Book, System.SysUtils, MVCFramework.Logger;

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

end.
