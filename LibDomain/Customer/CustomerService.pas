unit CustomerService;

interface

uses
  CustomerServiceIntf, Customer, CustomerDaoIntf, System.Generics.Collections;

type
  TCustomerService = class(TInterfacedObject, ICustomerService)
  private
    FCustomerDao: ICustomerDao;
  public
    constructor Create(const ACustomerDao: ICustomerDao);

    procedure CreateCustomer(const Customer: TCustomer);
    function GetCustomers: TObjectList<TCustomer>;
    function GetCustomerById(const CustomerId: Integer): TCustomer;
    procedure UpdateCustomer(const Customer: TCustomer);
    procedure DeleteCustomer(const CustomerId: Integer);
  end;

implementation

uses
  System.SysUtils;
{ TCustomerService }

constructor TCustomerService.Create(const ACustomerDao: ICustomerDao);
begin
  FCustomerDao := ACustomerDao;
end;

procedure TCustomerService.CreateCustomer(const Customer: TCustomer);
begin
  FCustomerDao.Insert(Customer);
end;

procedure TCustomerService.DeleteCustomer(const CustomerId: Integer);
begin
  FCustomerDao.Delete(CustomerId);
end;

function TCustomerService.GetCustomerById(const CustomerId: Integer): TCustomer;
begin
  Result := FCustomerDao.SelectWhereId(CustomerId);
end;

function TCustomerService.GetCustomers: TObjectList<TCustomer>;
begin
  Result := FCustomerDao.Select;
end;

procedure TCustomerService.UpdateCustomer(const Customer: TCustomer);
begin
  FCustomerDao.Update(Customer);
end;

end.
