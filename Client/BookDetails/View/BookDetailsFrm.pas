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
    FPresenter: IBookDetailsPresenter;
    procedure SetBookDetails(const Book: TBook);
    function Self: TForm;
    function GetParentForm: TForm;
  public
    constructor Create(Owner: TComponent); overload;
    procedure LoadCustomerReviews;
    procedure SetPresenter(APresenter: IBookDetailsPresenter);
  end;

implementation

{$R *.dfm}

uses
  LoginFrm, WriteReviewFrm;

procedure TBookDetailsForm.btnWriteReviewClick(Sender: TObject);
begin
  FPresenter.WriteReview;
end;

constructor TBookDetailsForm.Create(Owner: TComponent);
begin
  inherited Create(Owner);
end;

procedure TBookDetailsForm.FormShow(Sender: TObject);
begin
  FPresenter.DisplayBookDetails;
  LoadCustomerReviews;
end;

function TBookDetailsForm.GetParentForm: TForm;
begin
  Result := TForm(Self.Owner);
end;

procedure TBookDetailsForm.LoadCustomerReviews;
begin
  FPresenter.LoadReviews;
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
