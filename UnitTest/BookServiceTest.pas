unit BookServiceTest;

interface

uses
  DUnitX.TestFramework, BookService, BookActiveRecordDaoStub, BookDaoIntf,
  BookServiceIntf, Book, MockBookTableDatabase;

type
  [TestFixture]
  TBookServiceTest = class
  private
    FBookService: IBookService;
    FMockBookDAO: IBookDAO;
    FMockDatabase: TMockBookTableDatabase;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure Test_CreateBook_NewBook_Inserted;
    [Test]
    procedure Test_GetBooks_BookList_NotNull;
    [Test]
    procedure TestGetBookById;
    [Test]
    procedure Test_UpdateBook_NewBookDetails_EqualToNewDetails;
    [Test]
    procedure Test_DeleteBook_BookId_NotInDatabase;
    [Test]
    [TestCase('Test_Fields_Not_Empty','1,This is a title1,This is a synopsis1')]
    procedure TestInputValidation(const AId : Integer;
      const ATitle, ASynopsis : string);
  end;

implementation

procedure TBookServiceTest.Setup;
begin
  FMockDatabase := TMockBookTableDatabase.Create;
  FMockBookDAO := TBookActiveRecordDaoStub.Create(FMockDatabase);
  FBookService := TBookService.Create(FMockBookDAO);
end;

procedure TBookServiceTest.TearDown;
begin
  FBookService := nil;
  FMockBookDAO := nil;
end;

procedure TBookServiceTest.Test_CreateBook_NewBook_Inserted;
begin
  var Book := TBook.Create;
  Book.Title := '';
  Book.Synopsis := '';

  var ListBeforeInsert := FBookService.GetBooks;
  FBookService.CreateBook(Book);

  var ListAfterInsert := FBookService.GetBooks;

  Assert.AreEqual<Integer>(ListAfterInsert.Count, ListBeforeInsert.Count + 1);
end;

procedure TBookServiceTest.Test_GetBooks_BookList_NotNull;
begin
  var BookList := FBookService.GetBooks;

  Assert.IsNotNull(BookList);
end;

procedure TBookServiceTest.TestGetBookById;
begin
  var NewBook := TBook.Create;
  NewBook.Title := '';
  NewBook.Synopsis := '';

  FBookService.CreateBook(NewBook);

  var BookId := 1;
  var Book := FBookService.GetBookById(BookId);

  Assert.IsNotNull(Book, 'Book should not be nil');
  Assert.AreEqual(BookId, Book.Id, 'Book ID should match');
end;

procedure TBookServiceTest.Test_UpdateBook_NewBookDetails_EqualToNewDetails;
begin
  var Book := TBook.Create;
  Book.Id := 1;
  Book.Title := 'Original Title';
  Book.Synopsis := 'Original Synopsis';

  FMockBookDAO.Insert(Book);

  Book.Title := 'Updated Title';
  Book.Synopsis := 'Updated Synopsis';

  FBookService.UpdateBook(Book);

  var UpdatedBook := FMockBookDAO.SelectWhereId(Book.Id);

  Assert.IsNotNull(UpdatedBook);
  Assert.AreEqual('Updated Title', UpdatedBook.Title);
  Assert.AreEqual('Updated Synopsis', UpdatedBook.Synopsis);
end;

procedure TBookServiceTest.Test_DeleteBook_BookId_NotInDatabase;
begin
  var BookId := 1;

  FBookService.DeleteBook(BookId);

  Assert.IsFalse(FMockDatabase.Contains(BookId), 'Book should be deleted');
end;

procedure TBookServiceTest.TestInputValidation(
  const AId: Integer; const ATitle, ASynopsis: string);
begin
  var Book := TBook.Create(AId, ATitle, ASynopsis);
  Assert.IsTrue(Book.IsValid);
end;

initialization
  TDUnitX.RegisterTestFixture(TBookServiceTest);

end.
