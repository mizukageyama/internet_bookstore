unit ViewPresenterFactory;

interface

uses
  WriteReviewFrmIntf, WriteReviewPresenterIntf, CustomerReviewServiceIntf,
  BookDetailsFrmIntf, BookDetailsPresenterIntf, LoginFrmIntf,
  LoginPresenterIntf, ViewPresenterFactoryIntf, Book;

type
  TViewPresenterFactory = class(TInterfacedObject, IViewPresenterFactory)
  public
    function CreateLoginView: ILoginView;
    function CreateLoginPresenter(ALoginViewView: ILoginView): ILoginPresenter;

    function CreateBookDetailsView: IBookDetailsView;
    function CreateBookDetailsPresenter(ABookDetailsView: IBookDetailsView;
      ABook: TBook; AViewPresenterFactory: IViewPresenterFactory):
      IBookDetailsPresenter;

    function CreateWriteReviewView: IWriteReviewView;
    function CreateWriteReviewPresenter(AWriteReviewView: IWriteReviewView;
      ACustomerReviewServiceProxy: ICustomerReviewService; ABook: TBook):
      IWriteReviewPresenter;
  end;

implementation

uses
  LoginFrm, LoginPresenter,
  WriteReviewFrm, WriteReviewPresenter,
  BookDetailsFrm, BookDetailsPresenter;

{ TViewPresenterFactory }

function TViewPresenterFactory.CreateBookDetailsPresenter(
  ABookDetailsView: IBookDetailsView; ABook: TBook;
  AViewPresenterFactory: IViewPresenterFactory): IBookDetailsPresenter;
begin
  var BookDetailsPresenter := TBookDetailsPresenter
    .Create(ABookDetailsView, ABook, AViewPresenterFactory);
  Result := BookDetailsPresenter;
end;

function TViewPresenterFactory.CreateBookDetailsView: IBookDetailsView;
begin
  Result := TBookDetailsView.Create(nil);
end;

function TViewPresenterFactory.CreateLoginPresenter(
  ALoginViewView: ILoginView): ILoginPresenter;
begin
  var LoginPresenter := TLoginPresenter.Create(ALoginViewView);
  Result := LoginPresenter;
end;

function TViewPresenterFactory.CreateLoginView: ILoginView;
begin
  Result := TLoginView.Create(nil);
end;

function TViewPresenterFactory.CreateWriteReviewPresenter(
  AWriteReviewView: IWriteReviewView;
  ACustomerReviewServiceProxy: ICustomerReviewService;
  ABook: TBook): IWriteReviewPresenter;
begin
  var WriteReviewPresenter := TWriteReviewPresenter
    .Create(AWriteReviewView, ACustomerReviewServiceProxy, ABook);
  Result := WriteReviewPresenter;
end;

function TViewPresenterFactory.CreateWriteReviewView: IWriteReviewView;
begin
  Result := TWriteReviewView.Create(nil);
end;

end.
