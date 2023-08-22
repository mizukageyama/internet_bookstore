unit CustomerReviewController;

interface

uses
  MVCFramework, MVCFramework.Commons, MVCFramework.Serializer.Commons,
  MVCFramework.ActiveRecord, System.Generics.Collections,
  CustomerReview, System.SysUtils, System.Classes, CustomerReviewServiceIntf;

type
  TCustomerReviewController = class(TMVCController)
  private
    FService: ICustomerReviewService;
  public
    [MVCPath('/($BookId)')]
    [MVCHTTPMethod([httpGET])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON)]
    procedure GetCustomerReviewsByBookId(const BookId: Integer);

    [MVCPath('/single/($ReviewId)')]
    [MVCHTTPMethod([httpGET])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON)]
    procedure GetCustomerReviewById(const ReviewId: Integer);

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

    constructor Create(const AService: ICustomerReviewService); overload;
  end;

implementation

{ TCustomerReviewController }

constructor TCustomerReviewController.Create(const AService: ICustomerReviewService);
begin
 if not Assigned(AService) then
    raise EArgumentNilException.Create('AService');

  inherited Create;
  FService := AService;
end;

procedure TCustomerReviewController.CreateCustomerReview;
begin
  var CustomerReview := Context.Request.BodyAs<TCustomerReview>;

  if not CustomerReview.IsValid then
  begin
    raise EMVCException.Create(400, 'Please check the review, and rating');
  end;

  FService.CreateCustomerReview(CustomerReview);
  Render201Created('/api/customers/' + CustomerReview.ID.ToString);
end;

procedure TCustomerReviewController.DeleteCustomerReview(
  const CustomerReviewId: Integer);
begin
  FService.DeleteCustomerReview(CustomerReviewId);
  Render(204, '');
end;

procedure TCustomerReviewController.GetCustomerReviewsByBookId(const BookId:
  Integer);
begin
  var CustomerReviews := FService.GetCustomerReviewsByBookId(BookId);
  Render(ObjectDict().Add('data', CustomerReviews));
end;

procedure TCustomerReviewController.GetCustomerReviewById(const ReviewId:
  Integer);
begin
  var CustomerReview := FService.GetCustomerReviewById(ReviewId);
  Render(ObjectDict().Add('data', CustomerReview));
end;

procedure TCustomerReviewController.UpdateCustomerReview(
  const CustomerReviewId: Integer);
begin
  var CustomerReview := Context.Request.BodyAs<TCustomerReview>;
  CustomerReview.Id := CustomerReviewId;

  if not CustomerReview.IsValid then
  begin
    raise EMVCException.Create(400, 'Invalid Request');
  end;

  FService.UpdateCustomerReview(CustomerReview);
  Render(HTTP_STATUS.OK, '');
end;

end.
