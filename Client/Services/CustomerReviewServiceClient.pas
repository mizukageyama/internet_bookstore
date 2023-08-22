unit CustomerReviewServiceClient;

interface

uses
  CustomerReviewServiceClientIntf, CustomerReviewRepositoryIntf,
  CustomerReview, System.Generics.Collections, System.SysUtils;

type
  TCustomerReviewServiceClient = class(TInterfacedObject,
    ICustomerReviewServiceClient)
  private
    FRepository: ICustomerReviewRepository;
  protected
    procedure CreateCustomerReview(const CustomerReview:
      TCustomerReview);
    function GetCustomerReviewsByBookId(const BookId: Integer): string;
    function GetCustomerReviewById(const CustomerReviewId: Integer): string;
    procedure UpdateCustomerReview(const CustomerReview: TCustomerReview);
    procedure DeleteCustomerReview(const CustomerReviewId: Integer);
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

procedure TCustomerReviewServiceClient.CreateCustomerReview(
  const CustomerReview: TCustomerReview);
begin
  var Response := FRepository.CreateReview(CustomerReview.ToJSONBody);

  if Response.StatusCode <> 201 then
    raise Exception.Create('Unable to create review');
end;

procedure TCustomerReviewServiceClient.DeleteCustomerReview(
  const CustomerReviewId: Integer);
begin
  var Response := FRepository.DeleteReview(CustomerReviewId);

  if Response.StatusCode <> 204 then
    raise Exception.Create('Unable to delete review');
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

procedure TCustomerReviewServiceClient.UpdateCustomerReview(
  const CustomerReview: TCustomerReview);
begin
  var Response := FRepository.UpdateReview(CustomerReview.ToJSONBody);

  if Response.StatusCode <> 200 then
    raise Exception.Create('Unable to update review');
end;

end.