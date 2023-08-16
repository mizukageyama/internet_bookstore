unit CustomerServiceIntf;

interface

uses
  Customer, System.Generics.Collections;

type
  ICustomerService = interface
    ['{7C0CF3E4-6B1D-4738-96DC-BA40DC67B34B}']
    procedure CreateCustomer(const Customer: TCustomer);
    function GetCustomers: TObjectList<TCustomer>;
    function GetCustomerById(const CustomerId: Integer): TCustomer;
    procedure UpdateCustomer(const Customer: TCustomer);
    procedure DeleteCustomer(const CustomerId: Integer);
  end;

implementation

end.
