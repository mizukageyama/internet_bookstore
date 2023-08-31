unit CustomerSession;

interface

uses
  Customer;

type
  TCustomerSession = class
  private
    class var FInstance: TCustomerSession;
    FCustomer: TCustomer;
    FJwtToken: string;
    FExpiration: TDateTime;
    FIsLoggedIn: Boolean;
    constructor Create;
  public
    class function Instance: TCustomerSession;
    procedure SetLoggedIn(CustomerID: Integer; CustomerName, Token: string;
      Expiration: TDateTime);
    function IsLoggedIn: Boolean;
    function GetLoggedInCustomer: TCustomer;
    function GetJwtToken: string;
    function GetTokenExpiration: TDateTime;
    procedure SetDefaultValue;
  end;

implementation

constructor TCustomerSession.Create;
begin
  SetDefaultValue;
end;

class function TCustomerSession.Instance: TCustomerSession;
begin
  if FInstance = nil then
    FInstance := TCustomerSession.Create;
  Result := FInstance;
end;

procedure TCustomerSession.SetLoggedIn(CustomerID: Integer; CustomerName,
  Token: string; Expiration: TDateTime);
begin
  FIsLoggedIn := True;
  FCustomer := TCustomer.Create;
  FCustomer.Id := CustomerID;
  FCustomer.FirstName := CustomerName;
  FJwtToken := Token;
  FExpiration := Expiration;
end;

procedure TCustomerSession.SetDefaultValue;
begin
  FIsLoggedIn := False;
  FCustomer := nil;
  FJwtToken := '';
  FExpiration := 0;
end;

function TCustomerSession.IsLoggedIn: Boolean;
begin
  Result := FIsLoggedIn;
end;

function TCustomerSession.GetLoggedInCustomer: TCustomer;
begin
  Result := FCustomer;
end;

function TCustomerSession.GetJWTToken: string;
begin
  Result := FJwtToken;
end;

function TCustomerSession.GetTokenExpiration: TDateTime;
begin
  Result := FExpiration;
end;

end.
