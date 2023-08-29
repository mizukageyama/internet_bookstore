unit BookDetailsPresenter;

interface

uses
  MainPresenterIntf, BookServiceIntf, MainFrmIntf, System.SysUtils,
  Vcl.Dialogs, MVCFramework.DataSet.Utils, MVCFramework.Serializer.Commons,
  BookstoreDM, Book, BookDetailsFrm, System.Variants, BookDetailsFrmIntf,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, CustomerReview,
  CustomerReviewServiceIntf, BookDetailsPresenterIntf,
  System.Generics.Collections;

type
  TBookDetailsPresenter = class(TInterfacedObject, IBookDetailsPresenter)
  private
    FBookDetailsView: IBookDetailsForm;
    FBookDetailsService: ICustomerReviewService;
    FBook: TBook;
  protected
    procedure LoadReviews;
    procedure WriteReview;
    function IsCustomerLoggedIn: Boolean;
    procedure PopulateReviewsTable(const CustomerReviews: TObjectList<TCustomerReview>);
    procedure ShowWriteReviewForm(const Book: TBook);
    procedure ShowLoginForm(const Book: TBook);
    procedure DisplayBookDetails;
  public
    constructor Create(ABookDetailsView: IBookDetailsForm;
      ABookDetailsService: ICustomerReviewService; ABook: TBook);
  end;

implementation

{ TBookDetailsPresenter }

uses
  WriteReviewFrm, CustomerReviewServiceProxy, WriteReviewPresenter, LoginFrm,
  LoginPresenter, CustomerSession;

procedure TBookDetailsPresenter.DisplayBookDetails;
begin
  FBookDetailsView.SetBookDetails(FBook);
end;

function TBookDetailsPresenter.IsCustomerLoggedIn;
begin
  var CustomerSession := TCustomerSession.Instance;
  Result := CustomerSession.IsLoggedIn;
end;

constructor TBookDetailsPresenter.Create(ABookDetailsView: IBookDetailsForm;
  ABookDetailsService: ICustomerReviewService; ABook: TBook);
begin
  FBookDetailsView := ABookDetailsView;
  FBookDetailsService := ABookDetailsService;
  FBookDetailsView.SetPresenter(Self);
  FBook := ABook;
end;

procedure TBookDetailsPresenter.LoadReviews;
begin
  var CustomerReviews := FBookDetailsService
    .GetCustomerReviewsByBookId(FBook.Id);
  PopulateReviewsTable(CustomerReviews);
end;

procedure TBookDetailsPresenter.PopulateReviewsTable(const CustomerReviews:
  TObjectList<TCustomerReview>);
begin
  var BookstoreDM := BookstoreDataModule;
  BookstoreDM.fdmemCustomerReview.Close;
  BookstoreDM.fdmemCustomerReview.Open;

 for var Review in CustomerReviews do
  begin
    BookstoreDM.fdmemCustomerReview.Append;
    BookstoreDM.fdmemCustomerReview.
      FieldByName('CustomerId').AsInteger := Review.CustomerId;
    BookstoreDM.fdmemCustomerReview
      .FieldByName('Review').AsString := Review.Review;
    BookstoreDM.fdmemCustomerReview
      .FieldByName('Rating').AsInteger := Review.Rating;
    BookstoreDM.fdmemCustomerReview.Post;
  end;

  BookstoreDM.fdmemCustomerReview.First;
end;

procedure TBookDetailsPresenter.ShowLoginForm(const Book: TBook);
begin
  var LoginForm := TLoginForm.Create(FBookDetailsView.Self);
  var LoginPresenter := TLoginPresenter.Create(LoginForm as TLoginForm);

  LoginPresenter.OnLoginSuccess := procedure
  begin
    ShowWriteReviewForm(Book);
  end;

  LoginForm.Show;
end;

procedure TBookDetailsPresenter.ShowWriteReviewForm(const Book: TBook);
begin
  var ReviewForm := TWriteReviewForm.Create(FBookDetailsView.Self);
  var CustomerReviewServiceProxy := TCustomerReviewServiceProxy.Create;
  var WriteReviewPresenter := TWriteReviewPresenter
    .Create(ReviewForm as TWriteReviewForm, CustomerReviewServiceProxy, Book);

  ReviewForm.Show;
end;

procedure TBookDetailsPresenter.WriteReview;
begin
  if IsCustomerLoggedIn then
    ShowWriteReviewForm(FBook)
  else
  begin
    ShowLoginForm(FBook);
  end;
end;

end.

