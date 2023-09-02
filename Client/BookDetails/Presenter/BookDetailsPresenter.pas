unit BookDetailsPresenter;

interface

uses
  MainPresenterIntf, BookServiceIntf, MainFrmIntf, Book,
  CustomerReviewServiceIntf, BookDetailsFrmIntf, CustomerReview,
  BookDetailsPresenterIntf;

type
  TBookDetailsPresenter = class(TInterfacedObject, IBookDetailsPresenter)
  private
    FBookDetailsView: IBookDetailsView;
    FBook: TBook;
  public
    constructor Create(ABookDetailsView: IBookDetailsView; ABook: TBook);

    procedure DisplayBookDetails;
    procedure WriteReview;
    procedure ShowWriteReviewview;
    procedure ShowLoginView;
  end;

implementation

{ TBookDetailsPresenter }

uses
  WriteReviewFrm, CustomerReviewServiceProxy, WriteReviewPresenter, LoginFrm,
  LoginPresenter, CustomerSession, BookDetailsFrm;

procedure TBookDetailsPresenter.DisplayBookDetails;
begin
  FBookDetailsView.SetBookDetails(FBook);
end;

constructor TBookDetailsPresenter.Create(ABookDetailsView: IBookDetailsView;
  ABook: TBook);
begin
  FBookDetailsView := ABookDetailsView;
  FBookDetailsView.SetPresenter(Self);
  FBook := ABook;
end;

procedure TBookDetailsPresenter.WriteReview;
begin
  var CustomerSession := TCustomerSession.Instance;
  if CustomerSession.IsLoggedIn then
    ShowWriteReviewView
  else
  begin
    ShowLoginView;
  end;
end;

procedure TBookDetailsPresenter.ShowWriteReviewView;
begin
  //Factory Method for form creations (for testing)
  var WriteReviewView := TWriteReviewView.Create(
    FBookDetailsView as TBookDetailsView);
  var CustomerReviewServiceProxy := TCustomerReviewServiceProxy.Create;
  var WriteReviewPresenter := TWriteReviewPresenter
    .Create(WriteReviewView as TWriteReviewView,
    CustomerReviewServiceProxy, FBook);

  WriteReviewView.Show;
end;

procedure TBookDetailsPresenter.ShowLoginView;
begin
  var LoginView := TLoginView.Create(FBookDetailsView as TBookDetailsView);
  var LoginPresenter := TLoginPresenter.Create(LoginView as TLoginView);

  LoginPresenter.OnLoginSuccess := procedure
  begin
    ShowWriteReviewView;
  end;

  LoginView.Show;
end;

end.

