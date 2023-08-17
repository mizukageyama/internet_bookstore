unit LoginFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, System.JSON, MVCFramework.RESTClient.Intf,
  MVCFramework.RESTClient;

type
  TLoginForm = class(TForm)
    btnLogin: TButton;
    pnlEmail: TPanel;
    lblEmail: TLabel;
    pnlEmailInput: TPanel;
    lblEmailValidationMessage: TLabel;
    edtEmail: TEdit;
    Panel1: TPanel;
    lblPassword: TLabel;
    pnlPasswordInput: TPanel;
    lblPasswordValidationMessage: TLabel;
    edtPassword: TEdit;
    procedure btnLoginClick(Sender: TObject);
  private
    RESTClient: IMVCRESTClient;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses WriteReviewFrm;

procedure TLoginForm.btnLoginClick(Sender: TObject);
var
  Username: string;
  Password: string;
  Token: string;
  JSONValue: TJSONValue;
  //TokenMgr: TTokenManager;
begin
  Username := edtEmail.Text;
  Password := edtPassword.Text;

  if Username.IsEmpty	or Password.IsEmpty then
  begin
    ShowMessage('Please fill all the fields');
    Exit;
  end;
  try
    RESTClient.SetBasicAuthorization(Username, Password).Async(
    procedure (Resp: IMVCRESTResponse)
    begin
      if Resp.StatusCode = 200 then
      begin
        JSONValue := TJSONObject.ParseJSONValue(Resp.Content);
        Token := JSONValue.GetValue<string>('token');
        //TokenManager.SaveToken(Token);
        WriteReviewForm.Show;
      end
      else
        ShowMessage('Username or password does not match');
    end, nil, True).GET('/api/login');
  except
    on E: Exception do
      ShowMessage(e.ToString);
  end;
end;

end.
