program InternetBookstore;

uses
  Vcl.Forms,
  BookstoreDM in 'BookstoreDM.pas' {BookstoreDataModule: TDataModule},
  BookDetailsFrm in 'Views\BookDetailsFrm.pas' {BookDetailsForm},
  LoginFrm in 'Views\LoginFrm.pas' {LoginForm},
  MainFrm in 'Views\MainFrm.pas' {MainForm},
  WriteReviewFrm in 'Views\WriteReviewFrm.pas' {WriteReviewForm},
  MainPresenterIntf in 'Presenters\MainPresenterIntf.pas',
  MainPresenter in 'Presenters\MainPresenter.pas',
  BookRepositoryIntf in 'Repositories\BookRepositoryIntf.pas',
  MainFrmIntf in 'Views\MainFrmIntf.pas',
  BookServiceClient in 'Services\BookServiceClient.pas',
  BookRepository in 'Repositories\BookRepository.pas',
  BookDTO in 'Models\BookDTO.pas',
  BookServiceClientIntf in 'Services\BookServiceClientIntf.pas',
  BookDetailsFrmIntf in 'Views\BookDetailsFrmIntf.pas',
  BookDetailsPresenter in 'Presenters\BookDetailsPresenter.pas',
  CustomerReviewDTO in 'Models\CustomerReviewDTO.pas',
  CustomerReviewServiceClientIntf in 'Services\CustomerReviewServiceClientIntf.pas',
  BookDetailsPresenterIntf in 'Presenters\BookDetailsPresenterIntf.pas',
  CustomerReviewServiceClient in 'Services\CustomerReviewServiceClient.pas',
  CustomerReviewRepositoryIntf in 'Repositories\CustomerReviewRepositoryIntf.pas',
  CustomerReviewRepository in 'Repositories\CustomerReviewRepository.pas',
  WriteReviewFrmIntf in 'Views\WriteReviewFrmIntf.pas',
  WriteReviewPresenterIntf in 'Presenters\WriteReviewPresenterIntf.pas',
  WriteReviewPresenter in 'Presenters\WriteReviewPresenter.pas',
  CustomerSession in 'CustomerSession.pas',
  AuthService in 'Services\AuthService.pas',
  AuthRepositoryIntf in 'Repositories\AuthRepositoryIntf.pas',
  AuthRepository in 'Repositories\AuthRepository.pas',
  AuthServiceIntf in 'Services\AuthServiceIntf.pas',
  LoginPresenterIntf in 'Presenters\LoginPresenterIntf.pas',
  LoginPresenter in 'Presenters\LoginPresenter.pas',
  LoginFrmIntf in 'Views\LoginFrmIntf.pas';

{$R *.res}

var
  BookRepository: IBookRepository;
  BookService: IBookServiceClient;
  MainPresenter: IMainPresenter;
  MainForm: TForm;
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Application.CreateForm(TBookstoreDataModule, BookstoreDataModule);
  Application.CreateForm(TMainForm, MainForm);
  BookRepository := TBookRepository.Create;
  BookService := TBookServiceClient.Create(BookRepository);
  MainPresenter := TMainPresenter.Create(MainForm as TMainForm, BookService);

  Application.Run;
end.
