program InternetBookstore;

uses
  Vcl.Forms,
  BookServiceIntf,
  BookstoreDM in 'BookstoreDM.pas' {BookstoreDataModule: TDataModule},
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
  BookServiceProxy in 'ProxyServices\BookServiceProxy.pas',
  CustomerReviewServiceProxy in 'ProxyServices\CustomerReviewServiceProxy.pas';

{$R *.res}

var
  BookService: IBookService;
  MainPresenter: IMainPresenter;
  MainForm: TForm;
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Application.CreateForm(TBookstoreDataModule, BookstoreDataModule);
  Application.CreateForm(TMainForm, MainForm);
  BookService := TBookServiceProxy.Create;
  MainPresenter := TMainPresenter.Create(MainForm as TMainForm, BookService);

  Application.Run;
end.
