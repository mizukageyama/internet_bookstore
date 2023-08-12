unit CustomerDAOIntf;

interface

uses
  System.Generics.Collections, Customer;

type
  ICustomerDAO = interface
    procedure CreateCustomer(const Customer: TCustomer);
    function GetCustomers: TObjectList<TCustomer>;
    function GetCustomerById(const CustomerId: Integer): TCustomer;
    procedure UpdateCustomer(const CustomerId: Integer;
      const Customer: TCustomer);
    procedure DeleteCustomer(const CustomerId: Integer);
  end;

implementation

end.
