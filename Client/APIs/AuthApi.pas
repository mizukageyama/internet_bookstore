unit AuthAPI;

interface

uses
  AuthApiIntf, System.Generics.Collections, MVCFramework.RESTClient.Intf,
  MVCFramework.RESTClient, JSON, MVCFramework.DataSet.Utils, System.SysUtils;

type
  TAuthApi = class(TInterfacedObject, IAuthApi)
  private
    FRESTClient: IMVCRESTClient;
    const
      ENDPOINT = '/api/auth';
  protected
    function LoginUser(const Username, Password: string): IMVCRESTResponse;
  public
    constructor Create;
    destructor OnDestroy;
  end;

implementation

{ TAuthRepository }

constructor TAuthApi.Create;
begin
  FRESTClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
end;

function TAuthApi.LoginUser(const Username,
  Password: string): IMVCRESTResponse;
var
  Response: IMVCRESTResponse;
begin
  FRESTClient.SetBasicAuthorization(Username, Password);
  Response := FRESTClient.POST(ENDPOINT + '/login');
  Result := Response;
end;

destructor TAuthApi.OnDestroy;
begin
  FRESTClient := nil;
end;

end.

