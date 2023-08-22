unit BookServiceClient;

interface

uses
  BookServiceClientIntf, BookApiIntf, Book,
  System.Generics.Collections, System.SysUtils;

type
  TBookServiceClient = class(TInterfacedObject, IBookServiceClient)
  private
    FApi: IBookApi;
  public
    constructor Create(AApi: IBookApi); overload;

    function CreateBook(const Book: TBook): string;
    function GetBooks: string;
    function GetBookById(const BookId: Integer): string;
    function UpdateBook(const Book: TBook): string;
    function DeleteBook(const BookId: Integer): string;
  end;

implementation

{ TBookServiceClient }

constructor TBookServiceClient.Create(AApi: IBookApi);
begin
  FApi := AApi;
end;

function TBookServiceClient.CreateBook(const Book: TBook): string;
begin
  var Response := FApi.CreateBook(Book.ToJSONBody);

  if Response.StatusCode <> 201 then
    raise Exception.Create('Unable to create book');

  Result := Response.Content;
end;

function TBookServiceClient.DeleteBook(const BookId: Integer): string;
begin
  var Response := FApi.DeleteBook(BookId);

  if Response.StatusCode <> 204 then
    raise Exception.Create('Unable to delete book');

  Result := Response.Content;
end;

function TBookServiceClient.GetBookById(const BookId: Integer): string;
begin
  var Response := FApi.DeleteBook(BookId);

  if Response.StatusCode <> 200 then
    raise Exception.Create('Something went wrong');

  Result := Response.Content;
end;

function TBookServiceClient.GetBooks: string;
begin
  var Response := FApi.GetBooks;

  if Response.StatusCode <> 200 then
    raise Exception.Create('Something went wrong');

  Result := Response.Content;
end;

function TBookServiceClient.UpdateBook(const Book: TBook): string;
begin
  var Response := FApi.UpdateBook(Book.ToJSONBody);

  if Response.StatusCode <> 200 then
    raise Exception.Create('Unable to update book');

  Result := Response.Content;
end;

end.
