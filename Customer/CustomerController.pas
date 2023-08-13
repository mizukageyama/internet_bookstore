unit CustomerController;

interface

uses
  MVCFramework, MVCFramework.Commons, MVCFramework.Serializer.Commons,
  MVCFramework.ActiveRecord, BaseController, System.Generics.Collections,
  CustomerDAOIntf, Customer, System.SysUtils, MVCFramework.Logger;

type
  [MVCPath('/api/customers')]
  TCustomerController = class(TBaseController)
  private
    FCustomerDAO: ICustomerDAO;
  public
    [MVCPath()]
    [MVCHTTPMethod([httpGET])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON)]
    procedure GetCustomers;

    [MVCPath('/($CustomerId)')]
    [MVCHTTPMethod([httpGET])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON)]
    procedure GetCustomerById(const CustomerId: Integer);

    [MVCPath()]
    [MVCHTTPMethod([httpPOST])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON)]
    [MVCConsumes(TMVCMediaType.APPLICATION_JSON)]
    procedure CreateCustomer;

    [MVCPath('/($CustomerId)')]
    [MVCHTTPMethod([httpDELETE])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON)]
    procedure DeleteCustomer(const CustomerId: Integer);

    [MVCPath('/($CustomerId)')]
    [MVCHTTPMethod([httpPUT])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON)]
    [MVCConsumes(TMVCMediaType.APPLICATION_JSON)]
    procedure UpdateCustomer(const CustomerId: Integer);

    constructor Create; override;
  end;

implementation

{ TCustomerController }

constructor TCustomerController.Create;
begin
  inherited;

end;

procedure TCustomerController.CreateCustomer;
begin

end;

procedure TCustomerController.DeleteCustomer(const CustomerId: Integer);
begin

end;

procedure TCustomerController.GetCustomerById(const CustomerId: Integer);
begin

end;

procedure TCustomerController.GetCustomers;
begin

end;

procedure TCustomerController.UpdateCustomer(const CustomerId: Integer);
begin

end;

end.
