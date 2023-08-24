unit BookDetailsFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Book, Data.DB, Vcl.Grids, Vcl.DBGrids,
  BookDetailsFrmIntf, BookDetailsPresenterIntf;

type
  TBookDetailsForm = class(TForm, IBookDetailsForm)
    lblTitle: TLabel;
    lblBookTitle: TLabel;
    lblSynopsis: TLabel;
    btnWriteReview: TButton;
    pnlBottom: TPanel;
    pnlReviews: TPanel;
    dbgReviews: TDBGrid;
    lblBookReviews: TLabel;
    procedure btnWriteReviewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  protected
    FBook: TBook;
    FPresenter: IBookDetailsPresenter;
    procedure SetBookDetails(const Book: TBook);
    function Self: TForm;
  public
    constructor Create(const Book: TBook; Owner: TComponent); overload;
    procedure LoadCustomerReviews;
    procedure SetPresenter(APresenter: IBookDetailsPresenter);
  end;

implementation

{$R *.dfm}

uses
  LoginFrm, WriteReviewFrm;

procedure TBookDetailsForm.btnWriteReviewClick(Sender: TObject);
begin
  FPresenter.WriteReview(FBook);
end;

constructor TBookDetailsForm.Create(const Book: TBook; Owner: TComponent);
begin
  inherited Create(Owner);
  FBook := Book;
end;

procedure TBookDetailsForm.FormShow(Sender: TObject);
begin
  FPresenter.DisplayBookDetails(FBook);
  LoadCustomerReviews;
end;

procedure TBookDetailsForm.LoadCustomerReviews;
begin
  FPresenter.LoadReviews(FBook.Id);
end;

function TBookDetailsForm.Self: TForm;
begin
  Result := Self;
end;

procedure TBookDetailsForm.SetBookDetails(const Book: TBook);
begin
  lblBookTitle.Caption := Book.Title;
  lblSynopsis.Caption := Book.Synopsis;
end;

procedure TBookDetailsForm.SetPresenter(APresenter: IBookDetailsPresenter);
begin
  FPresenter := APresenter;
end;

end.
