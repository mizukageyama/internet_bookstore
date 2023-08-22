unit BookServiceClient;

interface

uses
  BookServiceClientIntf, BookRepositoryIntf, Book,
  System.Generics.Collections, System.SysUtils;

type
  TBookServiceClient = class(TInterfacedObject, IBookServiceClient)
  private
    FRepository: IBookRepository;
  public
    constructor Create(ARepository: IBookRepository); overload;

    function CreateBook(const Book: TBook): string;
    function GetBooks: string;
    function GetBookById(const BookId: Integer): string;
    function UpdateBook(const Book: TBook): string;
    function DeleteBook(const BookId: Integer): string;
  end;

implementation

{ TBookServiceClient }

constructor TBookServiceClient.Create(ARepository: IBookRepository);
begin
  FRepository := ARepository;
end;

function TBookServiceClient.CreateBook(const Book: TBook): string;
begin
  var Response := FRepository.CreateBook(Book.ToJSONBody);

  if Response.StatusCode <> 201 then
    raise Exception.Create('Unable to create book');

  Result := Response.Content;
end;

function TBookServiceClient.DeleteBook(const BookId: Integer): string;
begin
  var Response := FRepository.DeleteBook(BookId);

  if Response.StatusCode <> 204 then
    raise Exception.Create('Unable to delete book');

  Result := Response.Content;
end;

function TBookServiceClient.GetBookById(const BookId: Integer): string;
begin
  var Response := FRepository.DeleteBook(BookId);

  if Response.StatusCode <> 200 then
    raise Exception.Create('Something went wrong');

  Result := Response.Content;
end;

function TBookServiceClient.GetBooks: string;
begin
  var Response := FRepository.GetBooks;

  if Response.StatusCode <> 200 then
    raise Exception.Create('Something went wrong');

  Result := Response.Content;
end;

function TBookServiceClient.UpdateBook(const Book: TBook): string;
begin
  var Response := FRepository.UpdateBook(Book.ToJSONBody);

  if Response.StatusCode <> 200 then
    raise Exception.Create('Unable to update book');

  Result := Response.Content;
end;

end.
