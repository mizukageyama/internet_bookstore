unit LoginPresenter;

interface

uses
  LoginPresenterIntf, LoginFrmIntf, System.SysUtils, Vcl.Dialogs,
  MVCFramework.RESTClient.Intf, MVCFramework.RESTClient,
  MVCFramework.DataSet.Utils;

type
  TLoginPresenter = class(TInterfacedObject, ILoginPResenter)
  private
    FLoginView: ILoginForm;
    FOnLoginSuccess: TProc;
    FRESTClient: IMVCRESTClient;
    const
      ENDPOINT = '/api/auth';
  protected
    procedure Login;
    procedure ValidateInput(out Username, Password: string;
      out IsSuccess: Boolean);
    procedure UpdateCustomerSession(const ResponseContent: string);
  public
    constructor Create(ALoginView: ILoginForm);
    property OnLoginSuccess: TProc read FOnLoginSuccess write FOnLoginSuccess;
  end;

implementation

uses
  JSON, CustomerSession, MVCFramework.JWT;

{ TLoginPresenter }

constructor TLoginPresenter.Create(ALoginView: ILoginForm);
begin
  FLoginView := ALoginView;
  FLoginView.SetPresenter(Self);
  FRESTClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
end;

procedure TLoginPresenter.Login;
var
  Response: IMVCRESTResponse;
  Username: string;
  Password: string;
  IsSuccess: Boolean;
begin
  ValidateInput(Username, Password, IsSuccess);

  if IsSuccess then
  begin
    try
      FRESTClient.SetBasicAuthorization(Username, Password);
      Response := FRESTClient.POST(ENDPOINT + '/login');

      if Response.StatusCode <> 200 then
        raise Exception.Create('Please check your credentials');

      UpdateCustomerSession(Response.Content);
      FLoginView.CloseForm;

      if Assigned(FOnLoginSuccess) then
        FOnLoginSuccess;
    except
      on E: Exception do
        ShowMessage(E.toString);
    end;
  end
  else
    ShowMessage('Please enter email and password');
end;

procedure TLoginPresenter.UpdateCustomerSession(const ResponseContent: string);
var
  JWTToken: string;
  JSONValue: TJSONValue;
  JWT: TJWT;
begin
  JSONValue := TJSONObject.ParseJSONValue(ResponseContent);
  JWTToken := JSONValue.GetValue<string>('token');
  JWT := TJWT.Create('this_is_my_secret');

  var Error: string;
  if JWT.LoadToken(JWTToken, Error) then
  begin
    var CustomerID := JWT.CustomClaims['customer_id'].ToInteger;
    var CustomerName: string := JWT.CustomClaims['customer_name'];

    try
      var CustomerSession := TCustomerSession.Instance;
      CustomerSession.SetLoggedIn(
        CustomerID,
        CustomerName,
        JWTToken,
        JWT.Claims.ExpirationTime);
    except
      on E: Exception do
        ShowMessage(E.toString);
    end;
  end
end;

procedure TLoginPresenter.ValidateInput(out Username, Password: string;
  out IsSuccess: Boolean);
begin
  Username := FLoginView.GetUsername;
  Password := FLoginView.GetPassword;

  IsSuccess := (Username <> '') and (Password <> '');
end;

end.
