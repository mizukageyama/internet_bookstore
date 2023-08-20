unit WriteReviewFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TWriteReviewForm = class(TForm)
    lblBookTitle: TLabel;
    pnlBottom: TPanel;
    btnSaveReview: TButton;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
