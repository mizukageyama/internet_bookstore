unit WriteReviewFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Book, WriteReviewFrmIntf,
  WriteReviewPresenterIntf;

type
  TWriteReviewForm = class(TForm, IWriteReviewForm)
    lblBookTitle: TLabel;
    pnlBottom: TPanel;
    btnSubmitReview: TButton;
    pnlGreeting: TPanel;
    lblGreeting: TLabel;
    pnlRating: TPanel;
    lblRating: TLabel;
    edtRating: TEdit;
    pnlReview: TPanel;
    blbReview: TLabel;
    memReview: TMemo;
    pnlReviewInput: TPanel;
    pnlRatingInput: TPanel;
    lblRatingValidationMessage: TLabel;
    lblReviewValidationMessage: TLabel;
    pnlValidation: TPanel;
    procedure FormShow(Sender: TObject);
    procedure btnSubmitReviewClick(Sender: TObject);
  protected
    FPresenter: IWriteReviewPresenter;

    procedure DisplayBookTitle(const BookTitle: string);
    procedure DisplayCustomerGreeting(const Customer: string);
    function GetReviewText: string;
    function GetReviewRating: string;
    procedure HideForm;
    procedure ShowForm;
    procedure CloseForm;
    function Self: TForm;
    function GetParentForm: TForm;
    procedure ShowReviewValidationMessage(const ValidationMessage: string);
    procedure HideReviewValidationMessage;
    procedure ShowRatingValidationMessage(const ValidationMessage: string);
    procedure HideRatingValidationMessage;
  public
    procedure SetPresenter(Presenter: IWriteReviewPresenter);
  end;

implementation

{$R *.dfm}

{ TWriteReviewForm }

procedure TWriteReviewForm.btnSubmitReviewClick(Sender: TObject);
begin
  FPresenter.SubmitReview;
end;

procedure TWriteReviewForm.CloseForm;
begin
  Self.Close;
end;

procedure TWriteReviewForm.SetPresenter(Presenter: IWriteReviewPresenter);
begin
  FPresenter := Presenter;
end;

procedure TWriteReviewForm.DisplayBookTitle(const BookTitle: string);
begin
  lblBookTitle.Caption := BookTitle;
end;

procedure TWriteReviewForm.DisplayCustomerGreeting(const Customer: string);
begin
  lblGreeting.Caption := 'Hello ' + Customer +
    ', please enter your review for this book.';
end;

procedure TWriteReviewForm.FormShow(Sender: TObject);
begin
  FPresenter.InitializeView;
end;

function TWriteReviewForm.GetParentForm: TForm;
begin
  Result := TForm(Self.Owner);
end;

function TWriteReviewForm.GetReviewRating: string;
begin
  Result := edtRating.Text;
end;

function TWriteReviewForm.GetReviewText: string;
begin
  Result := memReview.Text;
end;

procedure TWriteReviewForm.ShowRatingValidationMessage(
  const ValidationMessage: string);
begin
  lblRatingValidationMessage.Caption := ValidationMessage;
  lblRatingValidationMessage.Show;
end;

procedure TWriteReviewForm.ShowReviewValidationMessage(
  const ValidationMessage: string);
begin
  lblReviewValidationMessage.Caption := ValidationMessage;
  lblReviewValidationMessage.Show;
end;

procedure TWriteReviewForm.HideRatingValidationMessage;
begin
  lblRatingValidationMessage.Hide;
end;

procedure TWriteReviewForm.HideReviewValidationMessage;
begin
  lblReviewValidationMessage.Hide;
end;

procedure TWriteReviewForm.HideForm;
begin
  Self.HideForm;
end;

function TWriteReviewForm.Self: TForm;
begin
  Result := Self;
end;

procedure TWriteReviewForm.ShowForm;
begin
  Self.Show;
end;

end.
