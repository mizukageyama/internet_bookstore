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

end;

procedure TCustomerDAO.DeleteCustomer(const CustomerId: Integer);
begin

end;

function TCustomerDAO.GetCustomerById(const CustomerId: Integer): TCustomer;
begin

end;

function TCustomerDAO.GetCustomers: TObjectList<TCustomer>;
begin

end;

procedure TCustomerDAO.UpdateCustomer(const CustomerId: Integer;
  const Customer: TCustomer);
begin

end;

end.
