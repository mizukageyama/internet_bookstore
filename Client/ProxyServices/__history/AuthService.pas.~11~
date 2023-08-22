unit AuthService;

interface

uses
  AuthServiceIntf, AuthRepositoryIntf, System.SysUtils;

type
  TAuthService = class(TInterfacedObject, IAuthService)
  private
    FRepository: IAuthRepository;
  protected
    function LoginCustomer(const Username, Password: string): string;
  public
    constructor Create(ARepository: IAuthRepository); overload;
  end;

implementation

{ TAuthService }

constructor TAuthService.Create(ARepository: IAuthRepository);
begin
  FRepository := ARepository;
end;

function TAuthService.LoginCustomer(const Username, Password: string): string;
begin
  var Response := FRepository.LoginUser(Username, Password);

  if Response.StatusCode <> 200 then
    raise Exception.Create('Please check your credentials');

  Result := Response.Content;
end;

end.
