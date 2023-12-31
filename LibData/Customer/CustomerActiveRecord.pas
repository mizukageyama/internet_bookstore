unit CustomerActiveRecord;

interface

uses
  MVCFramework.ActiveRecord, MVCFramework, MVCFramework.Serializer.Commons,
  MVCFramework.SQLGenerators.MySQL, CustomerContextIntf, Customer,
  MVCFramework.Nullables;

type
  [MVCNameCase(ncCamelCase)]
  [MVCTable('customer')]
  TCustomerActiveRecord = class(TMVCActiveRecord, ICustomerContext)
  private
    [MVCTableField('ID', [foPrimaryKey, foAutoGenerated])]
    FId: NullableInt64;
    [MVCTableField('FIRST_NAME')]
    FFirstName: NullableString;
    [MVCTableField('LAST_NAME')]
    FLastName: NullableString;
    [MVCTableField('EMAIL')]
    FEmail: NullableString;
    [MVCTableField('PASSWORD')]
    FPassword: NullableString;

    function GetCustomerId: Integer;
    procedure SetCustomerId(const CustomerId: Integer);

    function GetFirstName: string;
    procedure SetFirstName(const CustomerFirstName: string);

    function GetLastName: string;
    procedure SetLastName(const CustomerLastName: string);

    function GetEmail: string;
    procedure SetEmail(const CustomerEmail: string);

    function GetPassword: string;
    procedure SetPassword(const CustomerPassword: string);
  public
    constructor Create; overload; override;
    constructor Create(const ACustomer: TCustomer); overload;

    function QueryInterface(const IID: TGUID; out Obj): HRESULT; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;

    property Id: Integer read GetCustomerId write SetCustomerId;
    property FirstName: string read GetFirstName write SetFirstName;
    property LastName: string read GetLastName write SetLastName;
    property Email: string read GetEmail write SetEmail;
    [MVCDoNotSerialize]
    property Password: string read GetPassword;
  end;

implementation

{ TCustomer }

constructor TCustomerActiveRecord.Create(const ACustomer: TCustomer);
begin
  inherited Create(True);

  FId := ACustomer.Id;
  FFirstName := ACustomer.FirstName;
  FLastName := ACustomer.LastName;
  FEmail := ACustomer.Email;
  FPassword := ACustomer.Password;
end;

constructor TCustomerActiveRecord.Create;
begin
  inherited Create(True);
end;

function TCustomerActiveRecord.GetCustomerId: Integer;
begin
  Result := FId;
end;

procedure TCustomerActiveRecord.SetCustomerId(const CustomerId: Integer);
begin
  FId := CustomerId;
end;

function TCustomerActiveRecord.GetEmail: string;
begin
  Result := FEmail;
end;

procedure TCustomerActiveRecord.SetEmail(const CustomerEmail: string);
begin
  FEmail := CustomerEmail;
end;

function TCustomerActiveRecord.GetFirstName: string;
begin
  Result := FFirstName;
end;

procedure TCustomerActiveRecord.SetFirstName(const CustomerFirstName: string);
begin
  FFirstName := CustomerFirstName;
end;

function TCustomerActiveRecord.GetLastName: string;
begin
  Result := FLastName;
end;

procedure TCustomerActiveRecord.SetLastName(const CustomerLastName: string);
begin
  FLastName := CustomerLastName;
end;

function TCustomerActiveRecord.GetPassword: string;
begin
  Result := FPassword;
end;

procedure TCustomerActiveRecord.SetPassword(const CustomerPassword: string);
begin
  FPassword:= CustomerPassword;
end;

function TCustomerActiveRecord.QueryInterface(const IID: TGUID;
  out Obj): HRESULT;
begin
  Result := -1;
end;

function TCustomerActiveRecord._AddRef: Integer;
begin
  Result := -1;
end;

function TCustomerActiveRecord._Release: Integer;
begin
  Result := -1;
end;


end.
