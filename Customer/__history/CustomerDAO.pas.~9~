unit CustomerDAO;

interface

uses
  Customer, CustomerDAOIntf, MVCFramework, MVCFramework.Commons,
  MVCFramework.Serializer.Commons, MVCFramework.ActiveRecord, BaseController,
  System.Generics.Collections, system.SysUtils;

type
  TCustomerDAO = class(TInterfacedObject, ICustomerDAO)
  public
    procedure CreateCustomer(const Customer: TCustomer);
    function GetCustomers: TObjectList<TCustomer>;
    function GetCustomerById(const CustomerId: Integer): TCustomer;
    procedure UpdateCustomer(const CustomerId: Integer;
      const Customer: TCustomer);
    procedure DeleteCustomer(const CustomerId: Integer);
  end;

implementation

{ TCustomerDAO }

procedure TCustomerDAO.CreateCustomer(const Customer: TCustomer);
begin
  try
    Customer.Insert;
  except
    on E: Exception do
      raise Exception.Create(Classname + ', Failed to create customer: ' +
        E.Message);
  end;
end;

procedure TCustomerDAO.DeleteCustomer(const CustomerId: Integer);
begin
  var Customer := TMVCActiveRecord.GetByPK<TCustomer>(CustomerId, True);

  if Customer = nil then
    raise EMVCActiveRecordNotFound.Create(Classname + ', Customer not found');

  try
    Customer.Delete;
  except
    on E: Exception do
      raise Exception.Create(Classname + ', Failed to delete customer: ' +
        E.Message);
  end;
end;

function TCustomerDAO.GetCustomerById(const CustomerId: Integer): TCustomer;
begin
  Result := TMVCActiveRecord.GetOneByWhere<TCustomer>('ID = ?', [CustomerId]);
  if Result = nil then
    raise EMVCActiveRecordNotFound.Create(Classname + ', Customer not found');
end;

function TCustomerDAO.GetCustomers: TObjectList<TCustomer>;
begin
  Result := TMVCActiveRecord.All<TCustomer>;
end;

procedure TCustomerDAO.UpdateCustomer(const CustomerId: Integer;
  const Customer: TCustomer);
begin
  var CustomerById := TMVCActiveRecord.GetByPK<TCustomer>(CustomerId, True);

  if CustomerById = nil then
    raise EMVCActiveRecordNotFound.Create(Classname + ', Customer not found');

  try
    Customer.Update;
  except
    on E: Exception do
      raise Exception.Create(Classname + ', Failed to update customer: ' +
        E.Message);
  end;
end;

end.
