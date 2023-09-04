unit LoginPresenter;

interface

uses
  LoginPresenterIntf, LoginFrmIntf, System.SysUtils,
  MVCFramework.RESTClient.Intf, MVCFramework.RESTClient;

type
  TLoginPresenter = class(TInterfacedObject, ILoginPResenter)
  private
    FLoginView: ILoginView;
    FOnLoginSuccess: TProc;
    FRESTClient: IMVCRESTClient;
    const
      ENDPOINT = '/api/auth';

    procedure ValidateInput(out Username, Password: string;
      out IsSuccess: Boolean);
    procedure UpdateCustomerSession(const ResponseContent: string);
  protected
    procedure Login;
  public
    constructor Create(ALoginView: ILoginView);
    procedure SetLoginSuccess(OnLoginSuccess: TProc);
    function GetLoginSuccess: TProc;
    property OnLoginSuccess: TProc read GetLoginSuccess write SetLoginSuccess;
  end;

implementation

uses
  JSON, CustomerSession, MVCFramework.JWT, SYSCONST, StatusCodeException,
  ResponseStatusMapper;

{ TLoginPresenter }

constructor TLoginPresenter.Create(ALoginView: ILoginView);
begin
  FLoginView := ALoginView;
  FLoginView.SetPresenter(Self);
  FRESTClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
end;

function TLoginPresenter.GetLoginSuccess: TProc;
begin
  Result := FOnLoginSuccess;
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

      var ResponseStatus := TResponseStatusMapper.Map(Response.StatusCode);
      if ResponseStatus <> OK then
        raise EUnauthorizedStatusCodeException.Create(
          'Invalid password');

      UpdateCustomerSession(Response.Content);
      FLoginView.CloseForm;

      if Assigned(FOnLoginSuccess) then
        FOnLoginSuccess;
    except
      on E: EUnauthorizedStatusCodeException do
        FLoginView.ShowMessageDialog(E.ToString);
      else
        FLoginView.ShowMessageDialog('Something went wrong');
     end;
  end
  else
    FLoginView.ShowMessageDialog('Please enter email and password');
end;

procedure TLoginPresenter.SetLoginSuccess(OnLoginSuccess: TProc);
begin
  FOnLoginSuccess := OnLoginSuccess;
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
        FLoginView.ShowMessageDialog(E.toString);
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
