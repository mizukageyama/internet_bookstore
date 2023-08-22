unit BookApi;

interface

uses
  BookApiIntf, Book, MVCFramework.RESTClient.Intf,
  MVCFramework.RESTClient, MVCFramework.DataSet.Utils,
  System.Generics.Collections, JSON, System.SysUtils;

type
  TBookApi = class(TInterfacedObject, IBookApi)
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

constructor TBookApi.Create;
begin
  FRESTClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
end;

destructor TBookApi.OnDestroy;
begin
  FRESTClient := nil;
end;

function TBookApi.CreateBook(const RequestBody: TJSONObject):
  IMVCRESTResponse;
var
  Response: IMVCRESTResponse;
begin
  FRESTClient.SetBearerAuthorization('token');
  FRESTClient.AddBody(RequestBody.toString, 'application/json');
  Response := FRESTClient.POST(ENDPOINT);
  Result := Response;
end;

function TBookApi.DeleteBook(const BookId: Integer): IMVCRESTResponse;
var
  Response: IMVCRESTResponse;
begin
  FRESTClient.SetBearerAuthorization('token');
  Response := FRESTClient.DELETE(ENDPOINT + '/'+ BookId.toString);
  Result := Response;
end;

function TBookApi.GetBookById(const BookId: Integer): IMVCRESTResponse;
var
  Response: IMVCRESTResponse;
begin
  Response := FRESTClient.GET(ENDPOINT + '/'+ BookId.toString);
  Result := Response;
end;

function TBookApi.UpdateBook(const RequestBody: TJSONObject):
  IMVCRESTResponse;
var
  Response: IMVCRESTResponse;
begin
  FRESTClient.SetBearerAuthorization('token');
  FRESTClient.AddBody(RequestBody.toString, 'application/json');
  Response := FRESTClient.PUT(ENDPOINT);
  Result := Response;
end;

function TBookApi.GetBooks: IMVCRESTResponse;
var
  Response: IMVCRESTResponse;
begin
  Response := FRESTClient.GET(ENDPOINT);
  FRESTClient.ClearQueryParams;
  Result := Response;
end;

end.