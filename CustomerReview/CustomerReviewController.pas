unit CustomerReviewController;

interface

uses
  MVCFramework, MVCFramework.Commons, MVCFramework.Serializer.Commons,
  MVCFramework.ActiveRecord, BaseController, System.Generics.Collections,
  CustomerReviewDAOIntf, CustomerReview, System.SysUtils, MVCFramework.Logger;

type
  [MVCPath('/api/reviews')]
  TCustomerController = class(TBaseController)
  private
    FCustomerReviewDAO: ICustomerReviewDAO;
  public
    [MVCPath('/($BookId)')]
    [MVCHTTPMethod([httpGET])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON)]
    procedure GetCustomerReviewsByBookId(const BookId: Integer);

    [MVCPath()]
    [MVCHTTPMethod([httpPOST])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON)]
    [MVCConsumes(TMVCMediaType.APPLICATION_JSON)]
    procedure CreateCustomerReview;

    [MVCPath('/($CustomerReviewId)')]
    [MVCHTTPMethod([httpDELETE])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON)]
    procedure DeleteCustomerReview(const CustomerReviewId: Integer);

    [MVCPath('/($CustomerReviewId)')]
    [MVCHTTPMethod([httpPUT])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON)]
    [MVCConsumes(TMVCMediaType.APPLICATION_JSON)]
    procedure UpdateCustomerReview(const CustomerReviewId: Integer);

    constructor Create; override;
  end;

implementation

{ TCustomerController }

uses
  CustomerReviewDAO;

constructor TCustomerController.Create;
begin
  inherited;
  FCustomerReviewDAO := TCustomerReviewDAO.Create;
end;

procedure TCustomerController.CreateCustomerReview;
begin
  try
    var CustomerReview := Context.Request.BodyAs<TCustomerReview>;

    if not CustomerReview.IsValid then
    begin
      Render(HTTP_STATUS.BadRequest, 'Invalid request data');
      Exit;
    end;

    FCustomerReviewDAO.CreateCustomerReview(CustomerReview);
    Render201Created('/api/customers/' + CustomerReview.ID.ToString);
  except
    on E: Exception do
      Render(HTTP_STATUS.InternalServerError, 'An error occured');
  end;
end;

procedure TCustomerController.DeleteCustomerReview(
  const CustomerReviewId: Integer);
begin

end;

procedure TCustomerController.GetCustomerReviewsByBookId(const BookId: Integer);
begin

end;

procedure TCustomerController.UpdateCustomerReview(
  const CustomerReviewId: Integer);
begin

end;

end.

