unit BookDetailsPresenter;

interface

uses
  MainPresenterIntf, BookServiceIntf, MainFrmIntf, Book,
  CustomerReviewServiceIntf, BookDetailsFrmIntf, CustomerReview,
  BookDetailsPresenterIntf, LoginVPFactoryIntf, ViewPresenterFactoryIntf;

type
  TBookDetailsPresenter = class(TInterfacedObject, IBookDetailsPresenter)
  private
    FBookDetailsView: IBookDetailsView;
    FBook: TBook;
    FViewPresenterFactory: IViewPresenterFactory;

    procedure ShowWriteReviewview;
    procedure ShowLoginView;
  public
    constructor Create(ABookDetailsView: IBookDetailsView;
      ABook: TBook; AViewPresenterFactory: IViewPresenterFactory);
    procedure DisplayBookDetails;
    procedure WriteReview;
  end;

implementation

{ TBookDetailsPresenter }

uses
  CustomerReviewServiceProxy, CustomerSession, WriteReviewPresenterIntf;

procedure TBookDetailsPresenter.DisplayBookDetails;
begin
  FBookDetailsView.SetBookDetails(FBook);
end;

constructor TBookDetailsPresenter.Create(ABookDetailsView: IBookDetailsView;
  ABook: TBook; AViewPresenterFactory: IViewPresenterFactory);
begin
  FBookDetailsView := ABookDetailsView;
  FBookDetailsView.SetPresenter(Self);
  FViewPresenterFactory := AViewPresenterFactory;
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
  var WriteReviewView := FViewPresenterFactory.CreateWriteReviewView;
  var CustomerReviewServiceProxy := TCustomerReviewServiceProxy.Create;
  var WriteReviewPresenter: IWriteReviewPresenter;
  WriteReviewPresenter := FViewPresenterFactory.CreateWriteReviewPresenter(
    WriteReviewView, CustomerReviewServiceProxy, FBook);

  WriteReviewView.Show;
end;

procedure TBookDetailsPresenter.ShowLoginView;
begin
  var LoginView := FViewPresenterFactory.CreateLoginView;
  var LoginPresenter := FViewPresenterFactory.CreateLoginPresenter(LoginView);

  LoginPresenter.OnLoginSuccess := procedure
  begin
    ShowWriteReviewView;
  end;

  LoginView.Show;
end;

end.

