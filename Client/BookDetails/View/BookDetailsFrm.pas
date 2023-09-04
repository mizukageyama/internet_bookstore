unit BookDetailsFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Book, BookDetailsFrmIntf,
  BookDetailsPresenterIntf;

type
  TBookDetailsView = class(TForm, IBookDetailsView)
    TitleLabel: TLabel;
    BookTitleLabel: TLabel;
    SynopsisLabel: TLabel;
    WriteReviewButton: TButton;
    HeaderPanel: TPanel;
    procedure WriteReviewButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FBookDetailsPresenter: IBookDetailsPresenter;
  public
    procedure SetPresenter(APresenter: IBookDetailsPresenter);
    procedure SetBookDetails(const Book: TBook);
  end;

implementation

{$R *.dfm}

uses
  LoginFrm, WriteReviewFrm;

procedure TBookDetailsView.WriteReviewButtonClick(Sender: TObject);
begin
  FBookDetailsPresenter.WriteReview;
end;

procedure TBookDetailsView.FormShow(Sender: TObject);
begin
  FBookDetailsPresenter.DisplayBookDetails;
end;

procedure TBookDetailsView.SetBookDetails(const Book: TBook);
begin
  BookTitleLabel.Caption := Book.Title;
  SynopsisLabel.Caption := Book.Synopsis;
end;

procedure TBookDetailsView.SetPresenter(APresenter: IBookDetailsPresenter);
begin
  FBookDetailsPresenter := APresenter;
end;

end.
