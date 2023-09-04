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

    procedure ShowWriteReviewview;
    procedure ShowLoginView;
  public
    constructor Create(ABookDetailsView: IBookDetailsView; ABook: TBook);
    procedure DisplayBookDetails;
    procedure WriteReview;
  end;

implementation

{ TBookDetailsPresenter }

uses
  CustomerReviewServiceProxy, WriteReviewPresenter, LoginPresenter,
  CustomerSession, BookDetailsFrm, WriteReviewPresenterIntf,
  ViewFactory;

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
  var WriteReviewView := TViewFactory.CreateWriteReviewView;
  var CustomerReviewServiceProxy := TCustomerReviewServiceProxy.Create;
  var WriteReviewPresenter: IWriteReviewPresenter;
  WriteReviewPresenter := TWriteReviewPresenter
    .Create(WriteReviewView, CustomerReviewServiceProxy, FBook);

  WriteReviewView.Show;
end;

procedure TBookDetailsPresenter.ShowLoginView;
begin
  var LoginView := TViewFactory.CreateLoginView;
  var LoginPresenter := TLoginPresenter.Create(LoginView);

  LoginPresenter.OnLoginSuccess := procedure
  begin
    ShowWriteReviewView;
  end;

  LoginView.Show;
end;

end.

