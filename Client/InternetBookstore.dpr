program InternetBookstore;

uses
  Vcl.Forms,
  BookstoreDM in 'BookstoreDM.pas' {BookstoreDataModule: TDataModule},
  AuthApi in 'APIs\AuthApi.pas',
  AuthApiIntf in 'APIs\AuthApiIntf.pas',
  BookApi in 'APIs\BookApi.pas',
  BookApiIntf in 'APIs\BookApiIntf.pas',
  CustomerReviewApi in 'APIs\CustomerReviewApi.pas',
  CustomerReviewApiIntf in 'APIs\CustomerReviewApiIntf.pas',
  BookDetailsPresenter in 'BookDetails\Presenter\BookDetailsPresenter.pas',
  BookDetailsPresenterIntf in 'BookDetails\Presenter\BookDetailsPresenterIntf.pas',
  BookDetailsFrm in 'BookDetails\View\BookDetailsFrm.pas' {BookDetailsForm},
  BookDetailsFrmIntf in 'BookDetails\View\BookDetailsFrmIntf.pas',
  LoginPresenter in 'Login\Presenter\LoginPresenter.pas',
  LoginPresenterIntf in 'Login\Presenter\LoginPresenterIntf.pas',
  LoginFrm in 'Login\View\LoginFrm.pas' {LoginForm},
  LoginFrmIntf in 'Login\View\LoginFrmIntf.pas',
  MainPresenter in 'Main\Presenter\MainPresenter.pas',
  MainPresenterIntf in 'Main\Presenter\MainPresenterIntf.pas',
  MainFrm in 'Main\View\MainFrm.pas' {MainForm},
  MainFrmIntf in 'Main\View\MainFrmIntf.pas',
  WriteReviewPresenter in 'WriteReview\Presenter\WriteReviewPresenter.pas',
  WriteReviewPresenterIntf in 'WriteReview\Presenter\WriteReviewPresenterIntf.pas',
  WriteReviewFrm in 'WriteReview\View\WriteReviewFrm.pas' {WriteReviewForm},
  WriteReviewFrmIntf in 'WriteReview\View\WriteReviewFrmIntf.pas',
  CustomerSession in 'CustomerSession.pas',
  AuthService in 'Services\AuthService.pas',
  AuthServiceIntf in 'Services\AuthServiceIntf.pas',
  BookServiceClient in 'Services\BookServiceClient.pas',
  BookServiceClientIntf in 'Services\BookServiceClientIntf.pas',
  CustomerReviewServiceClient in 'Services\CustomerReviewServiceClient.pas',
  CustomerReviewServiceClientIntf in 'Services\CustomerReviewServiceClientIntf.pas';

{$R *.res}

var
  BookApi: IBookApi;
  BookService: IBookServiceClient;
  MainPresenter: IMainPresenter;
  MainForm: TForm;
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Application.CreateForm(TBookstoreDataModule, BookstoreDataModule);
  Application.CreateForm(TMainForm, MainForm);
  BookApi := TBookApi.Create;
  BookService := TBookServiceClient.Create(BookApi);
  MainPresenter := TMainPresenter.Create(MainForm as TMainForm, BookService);

  Application.Run;
end.
