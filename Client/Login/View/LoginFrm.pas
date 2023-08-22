unit LoginFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, System.JSON, MVCFramework.RESTClient.Intf,
  MVCFramework.RESTClient, LoginFrmIntf, LoginPresenterIntf;

type
  TLoginForm = class(TForm, ILoginForm)
    pnlEmail: TPanel;
    lblEmail: TLabel;
    edtEmail: TEdit;
    pnlPassword: TPanel;
    lblPassword: TLabel;
    edtPassword: TEdit;
    btnLogin: TButton;
    procedure btnLoginClick(Sender: TObject);
  private
    FPresenter: ILoginPresenter;
  protected
    function GetUsername: string;
    function Getpassword: string;
    procedure HideForm;
    procedure ShowForm;
    procedure CloseForm;
    function Self: TForm;
  public
    procedure SetPresenter(APresenter: ILoginPresenter);
  end;

implementation

{$R *.dfm}

uses WriteReviewFrm;

procedure TLoginForm.btnLoginClick(Sender: TObject);
begin
  FPresenter.Login;
end;

procedure TLoginForm.CloseForm;
begin
  Self.Close;
end;

function TLoginForm.Getpassword: string;
begin
  Result := edtPassword.Text;
end;

function TLoginForm.GetUsername: string;
begin
  Result := edtEmail.Text;
end;

procedure TLoginForm.HideForm;
begin
  Self.Hide;
end;

function TLoginForm.Self: TForm;
begin
  Result := Self;
end;

procedure TLoginForm.SetPresenter(APresenter: ILoginPresenter);
begin
  FPresenter := APresenter;
end;

procedure TLoginForm.ShowForm;
begin
  Self.Show;
end;

end.
