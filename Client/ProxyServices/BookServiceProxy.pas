unit BookServiceProxy;

interface

uses
  BookServiceIntf, Book, System.Generics.Collections, System.SysUtils,
  MVCFramework.RESTClient.Intf, MVCFramework.RESTClient;

type
  TBookServiceProxy = class(TInterfacedObject, IBookService)
  private
    FRESTClient: IMVCRESTClient;
    const
      ENDPOINT = '/api/books';
  public
    constructor Create;
    destructor Destroy;

    procedure CreateBook(const Book: TBook);
    function GetBooks: TObjectList<TBook>;
    function GetBookById(const BookId: Integer): TBook;
    procedure UpdateBook(const Book: TBook);
    procedure DeleteBook(const BookId: Integer);
  end;

implementation

uses
  REST.JSON, JSON, CustomerSession, ResponseStatusMapper, SYSCONST,
  StatusCodeException;

{ TBookServiceProxy }

constructor TBookServiceProxy.Create;
begin
  FRESTClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
end;

destructor TBookServiceProxy.Destroy;
begin
  FRESTClient := nil;
end;

procedure TBookServiceProxy.CreateBook(const Book: TBook);
var
  Response: IMVCRESTResponse;
  CustomerSession: TCustomerSession;
begin
  CustomerSession := TCustomerSession.Instance;
  FRESTClient.SetBearerAuthorization(CustomerSession.GetJWTToken);
  FRESTClient.AddBody(Book.ToJSONBody, 'application/json');
  Response := FRESTClient.POST(ENDPOINT);

  var ResponseStatus := TResponseStatusMapper.Map(Response.StatusCode);
  if ResponseStatus <> OK then
    raise TStatusCodeException.Create(ResponseStatus, 'Unable to create book');
end;

procedure TBookServiceProxy.DeleteBook(const BookId: Integer);
var
  Response: IMVCRESTResponse;
  CustomerSession: TCustomerSession;
begin
  CustomerSession := TCustomerSession.Instance;
  FRESTClient.SetBearerAuthorization(CustomerSession.GetJWTToken);
  Response := FRESTClient.DELETE(ENDPOINT + '/'+ BookId.toString);

  var ResponseStatus := TResponseStatusMapper.Map(Response.StatusCode);
  if ResponseStatus <> OK then
    raise TStatusCodeException.Create(ResponseStatus, 'Unable to delete book');
end;

function TBookServiceProxy.GetBookById(const BookId: Integer): TBook;
var
  Response: IMVCRESTResponse;
begin
  Response := FRESTClient.GET(ENDPOINT + '/'+ BookId.toString);

  var ResponseStatus := TResponseStatusMapper.Map(Response.StatusCode);
  if ResponseStatus <> OK then
    raise TStatusCodeException.Create(ResponseStatus, 'Something went wrong');

  var JSONValue := TJSONObject.ParseJSONValue(Response.Content);
  var Data := JSONValue.GetValue<TJSONObject>('data');
  var Book := TJSON.JsonToObject<TBook>(Data);

  Result := Book;
end;

function TBookServiceProxy.GetBooks: TObjectList<TBook>;
var
  Response: IMVCRESTResponse;
begin
  Response := FRESTClient.GET(ENDPOINT);
  FRESTClient.ClearQueryParams;

  var ResponseStatus := TResponseStatusMapper.Map(Response.StatusCode);
  if ResponseStatus <> OK then
    raise TStatusCodeException.Create(ResponseStatus, 'Something went wrong');

  var JSONValue := TJSONObject.ParseJSONValue(Response.Content);
  var BookArray := JSONValue.GetValue<TJSONArray>('data');
  var BookList := TObjectList<TBook>.Create;

  for var I := 0 to BookArray.Count - 1 do
  begin
    var BookJSON := BookArray.Items[I].ToString;
    var Book := TJSON.JsonToObject<TBook>(BookJSON);
    BookList.Add(Book);
  end;

  Result := BookList;
end;

procedure TBookServiceProxy.UpdateBook(const Book: TBook);
var
  Response: IMVCRESTResponse;
  CustomerSession: TCustomerSession;
begin
  CustomerSession := TCustomerSession.Instance;
  FRESTClient.SetBearerAuthorization(CustomerSession.GetJWTToken);
  FRESTClient.AddBody(Book.ToJSONBody, 'application/json');
  Response := FRESTClient.PUT(ENDPOINT);

  var ResponseStatus := TResponseStatusMapper.Map(Response.StatusCode);
  if ResponseStatus <> OK then
    raise TStatusCodeException.Create(ResponseStatus, 'Unable to update book');
end;

end.
