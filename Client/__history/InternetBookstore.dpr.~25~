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
  CustomerReviewRepository in 'Repositories\CustomerReviewRepository.pas';

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
