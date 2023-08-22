unit BookDetailsPresenter;

interface

uses
  MainPresenterIntf, BookServiceClientIntf, MainFrmIntf, System.SysUtils,
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
  protected
    procedure LoadReviews(const BookId: Integer);
    procedure WriteReview(const Book: TBook);
    function IsCustomerLoggedIn: Boolean;
    procedure PopulateReviewsTable(const CustomerReviews: TObjectList<TCustomerReview>);
    procedure ShowWriteReviewForm(const Book: TBook);
    procedure ShowLoginForm(const Book: TBook);
  public
    constructor Create(ABookDetailsView: IBookDetailsForm;
      ABookDetailsService: ICustomerReviewService);
  end;

implementation

{ TBookDetailsPresenter }

uses
  WriteReviewFrm, CustomerReviewApi, CustomerReviewServiceClient,
  WriteReviewPresenter, LoginFrm, AuthService, AuthApi, LoginPresenter,
  CustomerSession;

function TBookDetailsPresenter.IsCustomerLoggedIn;
begin
  var CustomerSession := TCustomerSession.Instance;
  Result := CustomerSession.IsLoggedIn;
end;

constructor TBookDetailsPresenter.Create(ABookDetailsView: IBookDetailsForm;
  ABookDetailsService: ICustomerReviewService);
begin
  FBookDetailsView := ABookDetailsView;
  FBookDetailsService := ABookDetailsService;
  FBookDetailsView.SetPresenter(Self);
end;

procedure TBookDetailsPresenter.LoadReviews(const BookId: Integer);
begin
  var CustomerReviews := FBookDetailsService.GetCustomerReviewsByBookId(BookId);
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
    BookstoreDM.fdmemCustomerReview.FieldByName('CustomerId').AsInteger := Review.CustomerId;
    BookstoreDM.fdmemCustomerReview.FieldByName('Review').AsString := Review.Review;
    BookstoreDM.fdmemCustomerReview.FieldByName('Rating').AsInteger := Review.Rating;
    BookstoreDM.fdmemCustomerReview.Post;
  end;

  BookstoreDM.fdmemCustomerReview.First;
end;

procedure TBookDetailsPresenter.ShowLoginForm(const Book: TBook);
begin
  var LoginForm := TLoginForm.Create(FBookDetailsView.Self);
  var AuthApi := TAuthApi.Create;
  var AuthService := TAuthService.Create(AuthApi);
  var LoginPresenter := TLoginPresenter .Create(LoginForm as TLoginForm,
    AuthService);

  LoginPresenter.OnLoginSuccess := procedure
  begin
    ShowWriteReviewForm(Book);
  end;

  LoginForm.Show;
end;

procedure TBookDetailsPresenter.ShowWriteReviewForm(const Book: TBook);
begin
  var ReviewForm := TWriteReviewForm.Create(Book, FBookDetailsView.Self);
  var CustomerReviewApi := TCustomerReviewApi.Create;
  var CustomerReviewService := TCustomerReviewServiceClient
    .Create(CustomerReviewApi);
  var WriteReviewPresenter := TWriteReviewPresenter
    .Create(ReviewForm as TWriteReviewForm, CustomerReviewService);

  ReviewForm.Show;
end;

procedure TBookDetailsPresenter.WriteReview(const Book: TBook);
begin
  if IsCustomerLoggedIn then
    ShowWriteReviewForm(Book)
  else
  begin
    ShowLoginForm(Book);
  end;
end;

end.
