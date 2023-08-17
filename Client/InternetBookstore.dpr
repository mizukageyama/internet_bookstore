program InternetBookstore;

uses
  Vcl.Forms,
  MainFrm in 'MainFrm.pas' {MainForm},
  BookstoreDM in 'BookstoreDM.pas' {BookstoreDataModule: TDataModule},
  BookDetailsFrm in 'BookDetailsFrm.pas' {BookDetailsForm},
  WriteReviewFrm in 'WriteReviewFrm.pas' {WriteReviewForm},
  LoginFrm in 'LoginFrm.pas' {LoginForm},
  Book in 'Book.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TBookstoreDataModule, BookstoreDataModule);
  //Application.CreateForm(TBookDetailsForm, BookDetailsForm);
  Application.CreateForm(TWriteReviewForm, WriteReviewForm);
  //Application.CreateForm(TLoginForm, LoginForm);
  Application.Run;
end.
