unit BookDetailsFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Book;

type
  TBookDetailsForm = class(TForm)
    lblTitle: TLabel;
    pnlWelcomeText: TPanel;
    lblWelcome: TLabel;
    pnlSearch: TPanel;
    lblSearch: TLabel;
    edtSearchKey: TEdit;
    Search: TButton;
    pnlSpace: TPanel;
    lblBookTitle: TLabel;
    lblSynopsis: TLabel;
    Button1: TButton;
    pnlBottom: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FBook: TBook;
  public
    constructor Create(const Book: TBook; Owner: TComponent); overload;
  end;

implementation

{$R *.dfm}

uses
  LoginFrm, WriteReviewFrm;

procedure TBookDetailsForm.Button1Click(Sender: TObject);
begin
  //if if logged in
  //else
  //var LoginForm:=  TLoginForm.Create();
  WriteReviewForm.Show;
end;

constructor TBookDetailsForm.Create(const Book: TBook; Owner: TComponent);
begin
  inherited Create(Owner);
  FBook := Book;
end;

procedure TBookDetailsForm.FormShow(Sender: TObject);
begin
  lblBookTitle.Caption := FBook.Title;
  lblSynopsis.Caption := FBook.Synopsis;
end;

end.
