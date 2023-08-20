unit CustomerReviewServiceClient;

interface

uses
  CustomerReviewServiceClientIntf, CustomerReviewRepositoryIntf,
  CustomerReviewDTO, System.Generics.Collections, System.SysUtils;

type
  TCustomerReviewServiceClient = class(TInterfacedObject,
    ICustomerReviewServiceClient)
  private
    FRepository: ICustomerReviewRepository;
  protected
    function CreateCustomerReview(const CustomerReview:
      TCustomerReview): string;
    function GetCustomerReviewsByBookId(const BookId: Integer): string;
    function GetCustomerReviewById(const CustomerReviewId: Integer): string;
    function UpdateCustomerReview(const CustomerReview:
      TCustomerReview): string;
    function DeleteCustomerReview(const CustomerReviewId: Integer): string;
  public
    constructor Create(ARepository: ICustomerReviewRepository); overload;
  end;

implementation

{ TCustomerReviewServiceClient }

constructor TCustomerReviewServiceClient.Create(
  ARepository: ICustomerReviewRepository);
begin
  FRepository := ARepository;
end;

function TCustomerReviewServiceClient.CreateCustomerReview(
  const CustomerReview: TCustomerReview): string;
begin
  var Response := FRepository.CreateReview(CustomerReview.ToJSONBody);

  if Response.StatusCode <> 201 then
    raise Exception.Create('Unable to create review');

  Result := Response.Content;
end;

function TCustomerReviewServiceClient.DeleteCustomerReview(
  const CustomerReviewId: Integer): string;
begin
  var Response := FRepository.DeleteReview(CustomerReviewId);

  if Response.StatusCode <> 204 then
    raise Exception.Create('Unable to delete review');

  Result := Response.Content;
end;

function TCustomerReviewServiceClient.GetCustomerReviewById(
  const CustomerReviewId: Integer): string;
begin
  var Response := FRepository.GetReviewById(CustomerReviewId);

  if Response.StatusCode <> 200 then
    raise Exception.Create('Something went wrong');

  Result := Response.Content;
end;

function TCustomerReviewServiceClient.GetCustomerReviewsByBookId(
  const BookId: Integer): string;
begin
  var Response := FRepository.GetReviewsByBookId(BookId);

  if Response.StatusCode <> 200 then
    raise Exception.Create('Something went wrong');

  Result := Response.Content;
end;

function TCustomerReviewServiceClient.UpdateCustomerReview(
  const CustomerReview: TCustomerReview): string;
begin
  var Response := FRepository.UpdateReview(CustomerReview.ToJSONBody);

  if Response.StatusCode <> 200 then
    raise Exception.Create('Unable to update review');

  Result := Response.Content;
end;

end.
