program InternetBookstore;

uses
  Vcl.Forms,
  BookServiceIntf,
  BookDetailsPresenter in 'BookDetails\Presenter\BookDetailsPresenter.pas',
  BookDetailsPresenterIntf in 'BookDetails\Presenter\BookDetailsPresenterIntf.pas',
  BookDetailsFrm in 'BookDetails\View\BookDetailsFrm.pas' {BookDetailsView},
  BookDetailsFrmIntf in 'BookDetails\View\BookDetailsFrmIntf.pas',
  LoginPresenter in 'Login\Presenter\LoginPresenter.pas',
  LoginPresenterIntf in 'Login\Presenter\LoginPresenterIntf.pas',
  LoginFrm in 'Login\View\LoginFrm.pas' {LoginView},
  LoginFrmIntf in 'Login\View\LoginFrmIntf.pas',
  MainPresenter in 'Main\Presenter\MainPresenter.pas',
  MainPresenterIntf in 'Main\Presenter\MainPresenterIntf.pas',
  MainFrm in 'Main\View\MainFrm.pas' {MainView},
  MainFrmIntf in 'Main\View\MainFrmIntf.pas',
  WriteReviewPresenter in 'WriteReview\Presenter\WriteReviewPresenter.pas',
  WriteReviewPresenterIntf in 'WriteReview\Presenter\WriteReviewPresenterIntf.pas',
  WriteReviewFrm in 'WriteReview\View\WriteReviewFrm.pas' {WriteReviewView},
  WriteReviewFrmIntf in 'WriteReview\View\WriteReviewFrmIntf.pas',
  CustomerSession in 'CustomerSession.pas',
  BookServiceProxy in 'ProxyServices\BookServiceProxy.pas',
  CustomerReviewServiceProxy in 'ProxyServices\CustomerReviewServiceProxy.pas',
  ResponseStatusMapper in 'ResponseStatusMapper.pas',
  StatusCodeException in 'StatusCodeException.pas',
  SYSCONST in 'SYSCONST.pas';

{$R *.res}

var
  BookServiceProxy: IBookService;
  MainPresenter: IMainPresenter;
  MainView: TForm;
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Application.CreateForm(TMainView, MainView);
  BookServiceProxy := TBookServiceProxy.Create;
  MainPresenter := TMainPresenter.Create(MainView as TMainView,
    BookServiceProxy);

  Application.Run;
end.
