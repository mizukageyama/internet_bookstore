unit ViewPresenterFactoryStub;

interface

uses
  WriteReviewFrmIntf, WriteReviewPresenterIntf, CustomerReviewServiceIntf,
  BookDetailsFrmIntf, BookDetailsPresenterIntf, LoginFrmIntf, MainFrmIntf,
  LoginPresenterIntf, ViewPresenterFactoryIntf, Book, MainPresenterIntf,
  BookServiceIntf;

type
  TViewPresenterFactoryStub = class(TInterfacedObject, IViewPresenterFactory)
  public
    function CreateMainView: IMainView;
    function CreateMainPresenter(AMainView: IMainView;
    ABookServiceProxy: IBookService;
      AViewPresenterFactory: IViewPresenterFactory): IMainPresenter;

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
  LoginViewStub, LoginPresenter, MainViewStub, MainPresenter,
  WriteReviewViewStub, WriteReviewPresenter,
  BookDetailsViewStub, BookDetailsPresenter;

{ TViewPresenterFactoryStub }

function TViewPresenterFactoryStub.CreateBookDetailsPresenter(
  ABookDetailsView: IBookDetailsView; ABook: TBook;
  AViewPresenterFactory: IViewPresenterFactory): IBookDetailsPresenter;
begin
  var BookDetailsPresenter := TBookDetailsPresenter
    .Create(ABookDetailsView, ABook, AViewPresenterFactory);
  Result := BookDetailsPresenter;
end;

function TViewPresenterFactoryStub.CreateBookDetailsView: IBookDetailsView;
begin
  Result := TBookDetailsViewStub.Create;
end;

function TViewPresenterFactoryStub.CreateLoginPresenter(
  ALoginViewView: ILoginView): ILoginPresenter;
begin
  var LoginPresenter := TLoginPresenter.Create(ALoginViewView);
  Result := LoginPresenter;
end;

function TViewPresenterFactoryStub.CreateLoginView: ILoginView;
begin
  Result := TLoginViewStub.Create;
end;

function TViewPresenterFactoryStub.CreateMainPresenter(AMainView: IMainView;
  ABookServiceProxy: IBookService;
  AViewPresenterFactory: IViewPresenterFactory): IMainPresenter;
begin
  var MainPresenter := TMainPresenter.Create(AMainView, ABookServiceProxy,
    AViewPresenterFactory);
  Result := MainPresenter;
end;

function TViewPresenterFactoryStub.CreateMainView: IMainView;
begin
  Result := TMainViewStub.Create;
end;

function TViewPresenterFactoryStub.CreateWriteReviewPresenter(
  AWriteReviewView: IWriteReviewView;
  ACustomerReviewServiceProxy: ICustomerReviewService;
  ABook: TBook): IWriteReviewPresenter;
begin
  var WriteReviewPresenter := TWriteReviewPresenter
    .Create(AWriteReviewView, ACustomerReviewServiceProxy, ABook);
  Result := WriteReviewPresenter;
end;

function TViewPresenterFactoryStub.CreateWriteReviewView: IWriteReviewView;
begin
  Result := TWriteReviewViewStub.Create;
end;

end.
