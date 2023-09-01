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
    FBookDetailsView: IBookDetailsView;
    FCustomerReviewServiceProxy: ICustomerReviewService;
    FBook: TBook;
  public
    constructor Create(ABookDetailsView: IBookDetailsView;
      ABookDetailsService: ICustomerReviewService; ABook: TBook);

    procedure DisplayBookDetails;
    procedure WriteReview;
    procedure ShowWriteReviewview;
    procedure ShowLoginView;
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

constructor TBookDetailsPresenter.Create(ABookDetailsView: IBookDetailsView;
  ABookDetailsService: ICustomerReviewService; ABook: TBook);
begin
  FBookDetailsView := ABookDetailsView;
  FCustomerReviewServiceProxy := ABookDetailsService;
  FBookDetailsView.SetPresenter(Self);
  FBook := ABook;
end;

procedure TBookDetailsPresenter.WriteReview;
begin
  var CustomerSession := TCustomerSession.Instance;
  if CustomerSession.IsLoggedIn then
    ShowWriteReviewForm
  else
  begin
    ShowLoginForm;
  end;
end;

procedure TBookDetailsPresenter.ShowWriteReviewView;
begin
  var WriteReviewView := TWriteReviewView.Create(nil);
  var CustomerReviewServiceProxy := TCustomerReviewServiceProxy.Create;
  var WriteReviewPresenter := TWriteReviewPresenter
    .Create(WriteReviewView as TWriteReviewView,
    CustomerReviewServiceProxy, FBook);

  WriteReviewView.Show;
end;

procedure TBookDetailsPresenter.ShowLoginView;
begin
  var LoginView := TLoginView.Create(nil);
  var LoginPresenter := TLoginPresenter.Create(LoginView as TLoginView);

  LoginPresenter.OnLoginSuccess := procedure
  begin
    ShowWriteReviewView;
  end;

  LoginView.Show;
end;

end.

