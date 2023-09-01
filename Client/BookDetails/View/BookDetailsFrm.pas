unit BookDetailsFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Book, Data.DB, Vcl.Grids, Vcl.DBGrids,
  BookDetailsFrmIntf, BookDetailsPresenterIntf;

type
  TBookDetailsView = class(TForm, IBookDetailsView)
    lblTitle: TLabel;
    lblBookTitle: TLabel;
    lblSynopsis: TLabel;
    btnWriteReview: TButton;
    pnlBottom: TPanel;
    procedure btnWriteReviewClick(Sender: TObject);
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

procedure TBookDetailsView.btnWriteReviewClick(Sender: TObject);
begin
  FBookDetailsPresenter.WriteReview;
end;

procedure TBookDetailsView.FormShow(Sender: TObject);
begin
  FBookDetailsPresenter.DisplayBookDetails;
end;

procedure TBookDetailsView.SetBookDetails(const Book: TBook);
begin
  lblBookTitle.Caption := Book.Title;
  lblSynopsis.Caption := Book.Synopsis;
end;

procedure TBookDetailsView.SetPresenter(APresenter: IBookDetailsPresenter);
begin
  FBookDetailsPresenter := APresenter;
end;

end.
