unit BookDetailsPresenterTest;

interface

uses
  DUnitX.TestFramework, BookDetailsPresenterIntf, BookDetailsFrmIntf,
  CustomerReviewServiceIntf, Book, WriteReviewFrmIntf;

type
  [TestFixture]
  TBookDetailsPresenterTest = class
  private
    FBookDetailsPresenter: IBookDetailsPresenter;
    FMockBookDetailsView: IBookDetailsView;
    FMockCustomerReviewService: ICustomerReviewService;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure TestDisplayBookDetails;
    [Test]
    procedure TestWriteReview;
    [Test]
    procedure TestShowWriteReviewView;
    [Test]
    procedure TestShowLoginView;
  end;

implementation

uses
  MockBookDetailsPresenter, Vcl.Forms;

procedure TBookDetailsPresenterTest.Setup;
begin
  var Book := TBook.Create(1, 'Harry Potter', 'Once upon a time, there was..');
  FBookDetailsPresenter := TMockBookDetailsPresenter.Create(
    FMockBookDetailsView, Book);
end;

procedure TBookDetailsPresenterTest.TearDown;
begin
  FBookDetailsPresenter := nil;
  FMockBookDetailsView := nil;
  FMockCustomerReviewService := nil;
end;

procedure TBookDetailsPresenterTest.TestDisplayBookDetails;
begin

end;

procedure TBookDetailsPresenterTest.TestShowLoginView;
begin

end;

procedure TBookDetailsPresenterTest.TestShowWriteReviewView;
begin
  var WriteReviewView: IWriteReviewView;
  FBookDetailsPresenter.ShowWriteReviewView;

//  Assert.IsNotNull(WriteReviewView, 'WriteReviewView should not be nil.');
end;

procedure TBookDetailsPresenterTest.TestWriteReview;
begin

end;

initialization
  TDUnitX.RegisterTestFixture(TBookDetailsPresenterTest);

end.
