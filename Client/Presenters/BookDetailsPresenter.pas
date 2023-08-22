unit BookDetailsPresenter;

interface

uses
  MainPresenterIntf, BookServiceClientIntf, MainFrmIntf, System.SysUtils,
  Vcl.Dialogs, MVCFramework.DataSet.Utils, MVCFramework.Serializer.Commons,
  BookstoreDM, Book, BookDetailsFrm, System.Variants, BookDetailsFrmIntf,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  CustomerReviewServiceClientIntf, BookDetailsPresenterIntf;

type
  TBookDetailsPresenter = class(TInterfacedObject, IBookDetailsPresenter)
  private
    FBookDetailsView: IBookDetailsForm;
    FBookDetailsService: ICustomerReviewServiceClient;
  protected
    procedure LoadReviews(const BookId: Integer);
    procedure WriteReview(const Book: TBook);
    function IsCustomerLoggedIn: Boolean;
    procedure PopulateReviewsTable(JSONData: string);
    procedure ShowWriteReviewForm(const Book: TBook);
    procedure ShowLoginForm(const Book: TBook);
  public
    constructor Create(ABookDetailsView: IBookDetailsForm;
      ABookDetailsService: ICustomerReviewServiceClient);
  end;

implementation

{ TBookDetailsPresenter }

uses
  WriteReviewFrm, CustomerReviewRepository, CustomerReviewServiceClient,
  WriteReviewPresenter, LoginFrm, AuthService, AuthRepository, LoginPresenter,
  CustomerSession;

function TBookDetailsPresenter.IsCustomerLoggedIn;
begin
  var CustomerSession := TCustomerSession.Instance;
  Result := CustomerSession.IsLoggedIn;
end;

constructor TBookDetailsPresenter.Create(ABookDetailsView: IBookDetailsForm;
  ABookDetailsService: ICustomerReviewServiceClient);
begin
  FBookDetailsView := ABookDetailsView;
  FBookDetailsService := ABookDetailsService;
  FBookDetailsView.SetPresenter(Self);
end;

procedure TBookDetailsPresenter.LoadReviews(const BookId: Integer);
begin
  var ResponseContent := FBookDetailsService.GetCustomerReviewsByBookId(BookId);
  PopulateReviewsTable(ResponseContent);
end;

procedure TBookDetailsPresenter.PopulateReviewsTable(JSONData: string);
begin
  var BookstoreDM := BookstoreDataModule;
  BookstoreDM.fdmemCustomerReview.Close;
  BookstoreDM.fdmemCustomerReview.Open;
  BookstoreDM.fdmemCustomerReview.LoadJSONArrayFromJSONObjectProperty('data',
    JSONData, TMVCNameCase.ncPascalCase);
  BookstoreDM.fdmemCustomerReview.First;
end;

procedure TBookDetailsPresenter.ShowLoginForm(const Book: TBook);
begin
  var LoginForm := TLoginForm.Create(FBookDetailsView.Self);
  var AuthRepository := TAuthRepository.Create;
  var AuthService := TAuthService.Create(AuthRepository);
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
  var CustomerReviewRepository := TCustomerReviewRepository.Create;
  var CustomerReviewService := TCustomerReviewServiceClient
    .Create(CustomerReviewRepository);
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

