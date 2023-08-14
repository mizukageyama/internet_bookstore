unit CustomerReviewController;

interface

uses
  MVCFramework, MVCFramework.Commons, MVCFramework.Serializer.Commons,
  MVCFramework.ActiveRecord, BaseController, System.Generics.Collections,
  CustomerReviewDAOIntf, CustomerReview, System.SysUtils, MVCFramework.Logger;

type
  [MVCPath('/api/reviews')]
  TCustomerReviewController = class(TBaseController)
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

{ TCustomerReviewController }

uses
  CustomerReviewDAO;

constructor TCustomerReviewController.Create;
begin
  inherited;
  FCustomerReviewDAO := TCustomerReviewDAO.Create;
end;

procedure TCustomerReviewController.CreateCustomerReview;
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

procedure TCustomerReviewController.DeleteCustomerReview(
  const CustomerReviewId: Integer);
begin
  try
    FCustomerReviewDAO.DeleteCustomerReview(CustomerReviewId);
    Render(204, '');
  except
    on E: EMVCActiveRecordNotFound  do
      Render(HTTP_STATUS.NotFound, 'Customer review not found');
    on E: Exception do
      Render(HTTP_STATUS.InternalServerError, 'Failed to delete review');
  end;
end;

procedure TCustomerReviewController.GetCustomerReviewsByBookId(const BookId: Integer);
begin
  try
    var BookReviews := FCustomerReviewDAO.GetCustomerReviewsByBookId(BookId);
    Render(ObjectDict().Add('data', BookReviews));
  except
    on E: EMVCActiveRecordNotFound  do
      Render(HTTP_STATUS.NotFound, 'Customer Reviews not found');
    on E: Exception do
      Render(HTTP_STATUS.InternalServerError, 'An error occured: ' + E.ToString);
  end;
end;

procedure TCustomerReviewController.UpdateCustomerReview(
  const CustomerReviewId: Integer);
begin
  try
    var CustomerReview := Context.Request.BodyAs<TCustomerReview>;

    if not CustomerReview.IsValid then
    begin
      Render(HTTP_STATUS.BadRequest, 'Invalid request data');
      Exit;
    end;

    FCustomerReviewDAO.UpdateCustomerReview(CustomerReviewId, CustomerReview);
    Render(HTTP_STATUS.OK, '');
  except
    on E: EMVCActiveRecordNotFound  do
      Render(HTTP_STATUS.NotFound, 'Review not found');
    on E: Exception do
      Render(HTTP_STATUS.InternalServerError, 'Failed to update review');
  end;
end;

end.

