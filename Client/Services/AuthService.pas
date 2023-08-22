unit AuthService;

interface

uses
  AuthServiceIntf, AuthApiIntf, System.SysUtils;

type
  TAuthService = class(TInterfacedObject, IAuthService)
  private
    FApi: IAuthApi;
  protected
    function LoginCustomer(const Username, Password: string): string;
  public
    constructor Create(AApi: IAuthApi); overload;
  end;

implementation

{ TAuthService }

constructor TAuthService.Create(AApi: IAuthApi);
begin
  FApi := AApi;
end;

function TAuthService.LoginCustomer(const Username, Password: string): string;
begin
  var Response := FApi.LoginUser(Username, Password);

  if Response.StatusCode <> 200 then
    raise Exception.Create('Please check your credentials');

  Result := Response.Content;
end;

end.
