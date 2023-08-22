unit CustomerSession;

interface

type
  TCustomerSession = class
  private
    class var FInstance: TCustomerSession;
    FCustomerID: Integer;
    FCustomerName: string;
    FToken: string;
    FExpiration: TDateTime;
    FIsLoggedIn: Boolean;
    constructor Create;
  public
    class function Instance: TCustomerSession;
    procedure SetLoggedIn(CustomerID: Integer; CustomerName, Token: string;
      Expiration: TDateTime);
    function IsLoggedIn: Boolean;
    function GetCustomerID: Integer;
    function GetCustomerName: string;
    function GetToken: string;
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
  FCustomerID := CustomerID;
  FCustomerName := CustomerName;
  FToken := Token;
  FExpiration := Expiration;
end;

procedure TCustomerSession.SetDefaultValue;
begin
  FIsLoggedIn := False;
  FCustomerID := 0;
  FCustomerName := '';
  FToken := '';
  FExpiration := 0;
end;

function TCustomerSession.IsLoggedIn: Boolean;
begin
  Result := FIsLoggedIn;
end;

function TCustomerSession.GetCustomerName: string;
begin
  Result := FCustomerName;
end;

function TCustomerSession.GetCustomerID: Integer;
begin
  Result := FCustomerID;
end;

function TCustomerSession.GetToken: string;
begin
  Result := FToken;
end;

function TCustomerSession.GetTokenExpiration: TDateTime;
begin
  Result := FExpiration;
end;

end.
