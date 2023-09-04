unit LoginViewStub;

interface

uses
  LoginFrmIntf, LoginPresenterIntf;

type
  TLoginViewStub = class(TInterfacedObject, ILoginView)
  private
    FUsernameInput: string;
    FPasswordInput: string;
    FFormClosed: Boolean;
    FPresenter: ILoginPresenter;
    FMessageDialogShown: Boolean;
    FMessageDialogText: string;
    FFormShown: Boolean;
  public
    procedure MockTypingInputInTextEditField(const Username, Password: string);
    function GetUsername: string;
    function GetPassword: string;
    procedure CloseForm;
    procedure SetPresenter(APresenter: ILoginPresenter);
    procedure ShowMessageDialog(const Msg: string);
    procedure Show;

    property UsernameInput: string read FUsernameInput;
    property PasswordInput: string read FPasswordInput;
    property IsFormClosed: Boolean read FFormClosed;
    property Presenter: ILoginPresenter read FPresenter;
    property IsMessageDialogShown: Boolean read FMessageDialogShown;
    property MessageDialogText: string read FMessageDialogText;
    property IsFormShown: Boolean read FFormShown;
  end;

implementation

{ TLoginViewStub }

procedure TLoginViewStub.CloseForm;
begin
  FFormClosed := True;
end;

function TLoginViewStub.GetPassword: string;
begin
  Result := FPasswordInput;
end;

function TLoginViewStub.GetUsername: string;
begin
  Result := FUsernameInput;
end;

procedure TLoginViewStub.MockTypingInputInTextEditField(const Username,
  Password: string);
begin
  FUsernameInput := Username;
  FPasswordInput := Password;
end;

procedure TLoginViewStub.SetPresenter(APresenter: ILoginPresenter);
begin
  FPresenter := APresenter;
end;

procedure TLoginViewStub.Show;
begin
  FFormShown := True;
end;

procedure TLoginViewStub.ShowMessageDialog(const Msg: string);
begin
  FMessageDialogText := Msg;
  FFormShown := True;
end;

end.
