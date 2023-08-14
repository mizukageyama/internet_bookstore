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

uses
  CustomerDAO;

constructor TCustomerController.Create;
begin
  inherited;
  FCustomerDAO := TCustomerDAO.Create;
end;

procedure TCustomerController.CreateCustomer;
begin
  try
    var Customer := Context.Request.BodyAs<TCustomer>;

    if not Customer.IsValid then
    begin
      Render(HTTP_STATUS.BadRequest, 'Invalid request data');
      Exit;
    end;

    FCustomerDAO.CreateCustomer(Customer);
    Render201Created('/api/customers/' + Customer.ID.ToString);
  except
    on E: Exception do
     Render(HTTP_STATUS.InternalServerError, 'An error occured: ' + E.ToString);
  end;
end;

procedure TCustomerController.DeleteCustomer(const CustomerId: Integer);
begin
  try
    FCustomerDAO.DeleteCustomer(CustomerId);
    Render(204, '');
  except
    on E: EMVCActiveRecordNotFound  do
      Render(HTTP_STATUS.NotFound, 'Customer not found');
    on E: Exception do
      Render(HTTP_STATUS.InternalServerError, 'Failed to delete customer');
  end;
end;

procedure TCustomerController.GetCustomerById(const CustomerId: Integer);
begin
  try
    var Customer := FCustomerDAO.GetCustomerById(CustomerId);
    Render(ObjectDict().Add('data', Customer));
  except
    on E: EMVCActiveRecordNotFound  do
      Render(HTTP_STATUS.NotFound, 'Customer not found');
    on E: Exception do
      Render(HTTP_STATUS.InternalServerError, 'An error occured: ' + E.ToString);
  end;
end;

procedure TCustomerController.GetCustomers;
begin
   try
    var Customers := FCustomerDAO.GetCustomers;
    Render(ObjectDict().Add('data', Customers));
 except
    on E: Exception do
      Render(HTTP_STATUS.InternalServerError, 'An error occured: ' + E.ToString);
  end;
end;

procedure TCustomerController.UpdateCustomer(const CustomerId: Integer);
begin
  try
    var Customer := Context.Request.BodyAs<TCustomer>;

    if not Customer.IsValid then
    begin
      Render(HTTP_STATUS.BadRequest, 'Invalid request data');
      Exit;
    end;

    FCustomerDAO.UpdateCustomer(CustomerId, Customer);
    Render(HTTP_STATUS.OK, '');
  except
    on E: EMVCActiveRecordNotFound  do
      Render(HTTP_STATUS.NotFound, 'Customer not found');
    on E: Exception do
      Render(HTTP_STATUS.InternalServerError, 'Failed to update customer');
  end;
end;

end.
