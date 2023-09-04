unit BookDetailsPresenterTest;

interface

uses
  DUnitX.TestFramework, BookDetailsPresenterIntf, BookDetailsFrmIntf,
  Book, WriteReviewFrmIntf, MockBookDetailsPresenter, Forms;

type
  [TestFixture]
  TBookDetailsPresenterTest = class
  private
    FBookDetailsPresenter: IBookDetailsPresenter;
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

procedure TBookDetailsPresenterTest.Setup;
begin
  var MockBookDetailsView := TForm.Create(nil);
  var Book := TBook.Create(1, 'Harry Potter', 'Once upon a time, there was..');
  FBookDetailsPresenter := TMockBookDetailsPresenter.Create(
    MockBookDetailsView, Book);
end;

procedure TBookDetailsPresenterTest.TearDown;
begin
  FBookDetailsPresenter := nil;
end;

procedure TBookDetailsPresenterTest.TestDisplayBookDetails;
begin

end;

procedure TBookDetailsPresenterTest.TestShowLoginView;
begin

end;

procedure TBookDetailsPresenterTest.TestShowWriteReviewView;
begin
  Assert.WillNotRaise(
    procedure
    begin
      FBookDetailsPresenter.ShowWriteReviewView;
    end
    );
end;

procedure TBookDetailsPresenterTest.TestWriteReview;
begin

end;

initialization
  TDUnitX.RegisterTestFixture(TBookDetailsPresenterTest);

end.
