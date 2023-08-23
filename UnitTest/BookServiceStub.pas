unit BookServiceStub;

interface

uses
  BookServiceIntf, Book, System.Generics.Collections;

type
  TBookServiceStub = class(TInterfacedObject, IBookService)
  private
    FBookList: TObjectList<TBook>;
  public
    constructor Create(ABookList: TObjectList<TBook>);
    procedure CreateBook(const Book: TBook);
    function GetBooks: TObjectList<TBook>;
    function GetBookById(const BookId: Integer): TBook;
    procedure UpdateBook(const Book: TBook);
    procedure DeleteBook(const BookId: Integer);
  end;

implementation

{ TBookServiceStub }


constructor TBookServiceStub.Create(ABookList: TObjectList<TBook>);
begin
  FBookList := ABookList;
end;

procedure TBookServiceStub.CreateBook(const Book: TBook);
begin
  FBookList.Add(Book);
end;

procedure TBookServiceStub.DeleteBook(const BookId: Integer);
begin
  FBookList.Delete(BookId);
end;

function TBookServiceStub.GetBookById(const BookId: Integer): TBook;
begin
  Result := FBookList[BookId];
end;

function TBookServiceStub.GetBooks: TObjectList<TBook>;
begin
  Result := FBookList;
end;

procedure TBookServiceStub.UpdateBook(const Book: TBook);
begin
  FBookList[Book.Id] := Book;
end;

end.
