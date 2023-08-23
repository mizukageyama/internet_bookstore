unit BookServiceTest;

interface

uses
  DUnitX.TestFramework;

type
  [TestFixture]
  TBookServiceTest = class
  public
    [Test]
    procedure GetBooks_BookListIsEmpty_IsTrue;
    [Test]
    procedure GetBooks_BookListIsNotEmpty_IsTrue;
    [Test]
    [TestCase('TestFields','1,This is a title1,This is a synopsis1')]
    procedure CreateBook_BookFieldsNotEmpty_IsValidTrue(const AId : Integer;
      const ATitle, ASynopsis : string);
    [Test]
    [TestCase('TestEmptyFields','1,,This is a synopsis1')]
    procedure CreateBook_BookFieldsIsEmpty_IsValidFalse(const AId : Integer;
      const ATitle, ASynopsis : string);
  end;

implementation

uses
  Book, System.Generics.Collections, BookServiceStub;

procedure TBookServiceTest.CreateBook_BookFieldsNotEmpty_IsValidTrue(
  const AId: Integer; const ATitle, ASynopsis: string);
begin
  var Book := TBook.Create(AId, ATitle, ASynopsis);
  Assert.IsTrue(Book.IsValid);
end;


procedure TBookServiceTest.CreateBook_BookFieldsIsEmpty_IsValidFalse(
  const AId: Integer; const ATitle, ASynopsis: string);
begin
  var Book := TBook.Create(AId, ATitle, ASynopsis);
  Assert.IsFalse(Book.IsValid);
end;

procedure TBookServiceTest.GetBooks_BookListIsEmpty_IsTrue;
begin
  var BookList := TObjectList<TBook>.Create;
  var BookServiceStub := TBookServiceStub.Create(BookList);

  var BookListFromStub := BookServiceStub.GetBooks;

  Assert.IsTrue(BookListFromStub.Count = 0);
end;

procedure TBookServiceTest.GetBooks_BookListIsNotEmpty_IsTrue;
begin
  var BookList := TObjectList<TBook>.Create;
  BookList.Add(TBook.Create(1, 'This is a title1', 'This is a synopsis1'));
  BookList.Add(TBook.Create(2, 'This is a title2', 'This is a synopsis2'));
  BookList.Add(TBook.Create(3, 'This is a title3', 'This is a synopsis3'));
  var BookServiceStub := TBookServiceStub.Create(BookList);

  var BookListFromStub := BookServiceStub.GetBooks;

  Assert.IsTrue(BookListFromStub.Count > 0);
end;

initialization
  TDUnitX.RegisterTestFixture(TBookServiceTest);

end.
