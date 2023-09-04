unit BookActiveRecordDaoStub;

interface

uses
  BookDAOIntf, Book, System.Generics.Collections, System.SysUtils,
  MockBookTableDatabase;

type
  TBookActiveRecordDaoStub = class(TInterfacedObject, IBookDAO)
  private
    FMockDatabase: TMockBookTableDatabase;
  public
    constructor Create(AMockDatabase: TMockBookTableDatabase);
    procedure Insert(const Book: TBook);
    function Select: TObjectList<TBook>;
    function SelectWhereId(const BookId: Integer): TBook;
    procedure Update(const Book: TBook);
    procedure Delete(const BookId: Integer);
  end;

implementation

procedure TBookActiveRecordDaoStub.Insert(const Book: TBook);
begin
  FMockDatabase.AddBook(Book);
end;

function TBookActiveRecordDaoStub.Select: TObjectList<TBook>;
begin
  Result := FMockDatabase.GetAllBooks;
end;

function TBookActiveRecordDaoStub.SelectWhereId(const BookId: Integer): TBook;
begin
  Result := FMockDatabase.GetBookById(BookId);
end;

procedure TBookActiveRecordDaoStub.Update(const Book: TBook);
begin
  FMockDatabase.UpdateBook(Book);
end;

constructor TBookActiveRecordDaoStub.Create(
  AMockDatabase: TMockBookTableDatabase);
begin
  FMockDatabase := AMockDatabase;
end;

procedure TBookActiveRecordDaoStub.Delete(const BookId: Integer);
begin
  FMockDatabase.DeleteBook(BookId);
end;

end.

