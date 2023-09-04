unit WriteReviewFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Book, WriteReviewFrmIntf,
  WriteReviewPresenterIntf, Customer;

type
  TWriteReviewView = class(TForm, IWriteReviewView)
    BookTitleLabel: TLabel;
    BottomPanel: TPanel;
    SubmitReviewButton: TButton;
    GreetingPanel: TPanel;
    GreetingLabel: TLabel;
    RatingPanel: TPanel;
    RatingLabel: TLabel;
    RatingEditText: TEdit;
    ReviewPanel: TPanel;
    ReviewLabel: TLabel;
    ReviewMemo: TMemo;
    ReviewInputPanel: TPanel;
    RatingInputPanel: TPanel;
    RatingValidationMessageLabel: TLabel;
    ReviewValidationMessageLabel: TLabel;
    ValidationPanel: TPanel;
    procedure FormShow(Sender: TObject);
    procedure SubmitReviewButtonClick(Sender: TObject);
  private
    FWriteReviewPresenter: IWriteReviewPresenter;
  public
    procedure SetPresenter(Presenter: IWriteReviewPresenter);
    procedure DisplayCustomerGreeting(const Customer: TCustomer);
    procedure DisplayBookTitle(const Book: TBook);
    function GetReviewText: string;
    function GetReviewRating: string;
    procedure CloseForm;
    procedure ShowMessageDialog(const Msg: string);
    procedure ShowReviewValidationMessage(const ValidationMessage: string);
    procedure ShowRatingValidationMessage(const ValidationMessage: string);
    procedure HideValidationMessage;
  end;

implementation

{$R *.dfm}

{ TWriteReviewForm }

procedure TWriteReviewView.FormShow(Sender: TObject);
begin
  FWriteReviewPresenter.InitializeView;
end;

procedure TWriteReviewView.SubmitReviewButtonClick(Sender: TObject);
begin
  FWriteReviewPresenter.SubmitReview;
end;

procedure TWriteReviewView.CloseForm;
begin
  Self.Close;
end;

procedure TWriteReviewView.SetPresenter(Presenter: IWriteReviewPresenter);
begin
  FWriteReviewPresenter := Presenter;
end;

procedure TWriteReviewView.DisplayBookTitle(const Book: TBook);
begin
  BookTitleLabel.Caption := Book.Title;
end;

procedure TWriteReviewView.DisplayCustomerGreeting(const Customer: TCustomer);
begin
  GreetingLabel.Caption := 'Hello ' + Customer.FirstName +
    ', please enter your review for this book.';
end;

function TWriteReviewView.GetReviewRating: string;
begin
  Result := RatingEditText.Text;
end;

function TWriteReviewView.GetReviewText: string;
begin
  Result := ReviewMemo.Text;
end;

procedure TWriteReviewView.ShowMessageDialog(const Msg: string);
begin
  ShowMessage(Msg);
end;

procedure TWriteReviewView.ShowRatingValidationMessage(
  const ValidationMessage: string);
begin
  RatingValidationMessageLabel.Caption := ValidationMessage;
  RatingValidationMessageLabel.Show;
end;

procedure TWriteReviewView.ShowReviewValidationMessage(
  const ValidationMessage: string);
begin
  ReviewValidationMessageLabel.Caption := ValidationMessage;
  ReviewValidationMessageLabel.Show;
end;

procedure TWriteReviewView.HideValidationMessage;
begin
  RatingValidationMessageLabel.Hide;
  ReviewValidationMessageLabel.Hide;
end;

end.
