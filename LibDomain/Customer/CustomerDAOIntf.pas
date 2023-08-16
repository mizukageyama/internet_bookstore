unit CustomerDAOIntf;

interface

uses
  System.Generics.Collections, Customer;

type
  ICustomerDAO = interface
    ['{A5A1B3F1-7D62-4F1C-915F-B541A15E9BE1}']
    procedure Insert(const Customer: TCustomer);
    function Select: TObjectList<TCustomer>;
    function SelectWhereId(const CustomerId: Integer): TCustomer;
    procedure Update(const Customer: TCustomer);
    procedure Delete(const CustomerId: Integer);
  end;

implementation

end.
