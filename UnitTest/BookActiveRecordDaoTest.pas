unit BookActiveRecordDaoTest;

interface

uses
  DUnitX.TestFramework, Book, BookActiveRecordDaoStub,
  System.Generics.Collections, MockBookTableDatabase, BookDAOIntf;

type
  [TestFixture]
  TBookDAOUnitTests = class
  private
    FBookDAO: IBookDAO;
    FMockDatabase: TMockBookTableDatabase;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure Test_Insert_NewBook_Success;
    [Test]
    procedure Test_Select_Books_NotNull;
    [Test]
    procedure Test_SelectWhereId_BookWithId_NotNull;
    [Test]
    procedure Test_Update_NewBookDetails_EqualToNewDetails;
    [Test]
    procedure Test_Delete_BookId_NotInDatabase;
  end;

implementation

procedure TBookDAOUnitTests.Setup;
begin
  FMockDatabase := TMockBookTableDatabase.Create;
  FBookDAO := TBookActiveRecordDaoStub.Create(FMockDatabase);
end;

procedure TBookDAOUnitTests.TearDown;
begin
  FBookDAO := nil;
end;

procedure TBookDAOUnitTests.Test_Insert_NewBook_Success;
begin
  var Book := TBook.Create;
  Book.Title := 'Sample Book';
  Book.Synopsis := 'A sample book synopsis.';

  FBookDAO.Insert(Book);

  Assert.IsTrue(FMockDatabase.Contains(Book.Id));
end;

procedure TBookDAOUnitTests.Test_Select_Books_NotNull;
begin
  var Books := FBookDAO.Select;
  Assert.IsNotNull(Books);
end;

procedure TBookDAOUnitTests.Test_SelectWhereId_BookWithId_NotNull;
begin
  var NewBook := TBook.Create;
  NewBook.Title := '';
  NewBook.Synopsis := '';

  FBookDAO.Insert(NewBook);

  var BookId := 1;
  var SelectedBook := FBookDAO.SelectWhereId(BookId);

  Assert.IsNotNull(SelectedBook);
end;

procedure TBookDAOUnitTests.Test_Update_NewBookDetails_EqualToNewDetails;
begin
  var Book := FBookDAO.SelectWhereId(1);
  if Assigned(Book) then
  begin
    Book.Title := 'Updated Title';
    Book.Synopsis := 'Updated Synopsis';

    FBookDAO.Update(Book);

    Assert.AreEqual(Book.Title, FMockDatabase.GetBookById(1).Title);
    Assert.AreEqual(Book.Synopsis, FMockDatabase.GetBookById(1).Synopsis);
  end;
end;

procedure TBookDAOUnitTests.Test_Delete_BookId_NotInDatabase;
begin
  var BookId := 1;

  FBookDAO.Delete(BookId);

  Assert.IsFalse(FMockDatabase.Contains(BookId));
end;

initialization
  TDUnitX.RegisterTestFixture(TBookDAOUnitTests);

end.
