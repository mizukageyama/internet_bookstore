unit MainPresenterTest;

interface

uses
  DUnitX.TestFramework, MainPresenterIntf, Forms, MockBookTableDatabase;

type
  [TestFixture]
  TMainPresenterTest = class
  private
    FMainPresenter: IMainPresenter;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure Test_LoadBooks_BookList_NotEmpty;
    [Test]
    procedure Test_ShowBookDetails_BookDetailsView_NotNil;
  end;

implementation

uses
  MockMainPresenter, MainFrmIntf, BookServiceIntf,
  BookActiveRecordDaoStub, BookService;

procedure TMainPresenterTest.SetUp;
begin
  inherited;
  var MockMainView := TForm.Create(nil);
  var MockDatabase := TMockBookTableDatabase.Create;
  var MockBookDao := TBookActiveRecordDaoStub.Create(MockDatabase);
  var MockBookService := TBookService.Create(MockBookDao);
  FMainPresenter := TMockMainPresenter.Create(MockMainView, MockBookService);
end;

procedure TMainPresenterTest.TearDown;
begin
  FMainPresenter := nil;
  inherited;
end;

procedure TMainPresenterTest.Test_LoadBooks_BookList_NotEmpty;
begin
//  FMainPresenter.LoadBooks;
//  var BookList := FMainPresenter.GetBookList;
//
//  Assert.IsTrue(BookList.Count > 0);
end;

procedure TMainPresenterTest.Test_ShowBookDetails_BookDetailsView_NotNil;
begin

end;

initialization
  TDUnitX.RegisterTestFixture(TMainPresenterTest);

end.
