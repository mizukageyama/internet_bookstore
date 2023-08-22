unit BookRepository;

interface

uses
  BookRepositoryIntf, Book, MVCFramework.RESTClient.Intf,
  MVCFramework.RESTClient, MVCFramework.DataSet.Utils,
  System.Generics.Collections, JSON, System.SysUtils;

type
  TBookRepository = class(TInterfacedObject, IBookRepository)
  private
    FRESTClient: IMVCRESTClient;
    const
      ENDPOINT = '/api/books';
  protected
    function CreateBook(const RequestBody: TJSONObject): IMVCRESTResponse;
    function GetBooks: IMVCRESTResponse;
    function GetBookById(const BookId: Integer): IMVCRESTResponse;
    function UpdateBook(const RequestBody: TJSONObject): IMVCRESTResponse;
    function DeleteBook(const BookId: Integer): IMVCRESTResponse;
  public
    constructor Create;
    destructor OnDestroy;
  end;

implementation

{ TBookRepository }

constructor TBookRepository.Create;
begin
  FRESTClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
end;

destructor TBookRepository.OnDestroy;
begin
  FRESTClient := nil;
end;

function TBookRepository.CreateBook(const RequestBody: TJSONObject):
  IMVCRESTResponse;
var
  Response: IMVCRESTResponse;
begin
  FRESTClient.SetBearerAuthorization('token');
  FRESTClient.AddBody(RequestBody.toString, 'application/json');
  Response := FRESTClient.POST(ENDPOINT);
  Result := Response;
end;

function TBookRepository.DeleteBook(const BookId: Integer): IMVCRESTResponse;
var
  Response: IMVCRESTResponse;
begin
  FRESTClient.SetBearerAuthorization('token');
  Response := FRESTClient.DELETE(ENDPOINT + '/'+ BookId.toString);
  Result := Response;
end;

function TBookRepository.GetBookById(const BookId: Integer): IMVCRESTResponse;
var
  Response: IMVCRESTResponse;
begin
  Response := FRESTClient.GET(ENDPOINT + '/'+ BookId.toString);
  Result := Response;
end;

function TBookRepository.UpdateBook(const RequestBody: TJSONObject):
  IMVCRESTResponse;
var
  Response: IMVCRESTResponse;
begin
  FRESTClient.SetBearerAuthorization('token');
  FRESTClient.AddBody(RequestBody.toString, 'application/json');
  Response := FRESTClient.PUT(ENDPOINT);
  Result := Response;
end;

function TBookRepository.GetBooks: IMVCRESTResponse;
var
  Response: IMVCRESTResponse;
begin
  Response := FRESTClient.GET(ENDPOINT);
  FRESTClient.ClearQueryParams;
  Result := Response;
end;

end.