unit CustomerReviewServiceClient;

interface

uses
  CustomerReviewServiceIntf, CustomerReviewApiIntf,
  CustomerReview, System.Generics.Collections, System.SysUtils;

type
  TCustomerReviewServiceClient = class(TInterfacedObject,
    ICustomerReviewService)
  private
    FApi: ICustomerReviewApi;
  protected
    procedure CreateCustomerReview(const CustomerReview:
      TCustomerReview);
    function GetCustomerReviewsByBookId(const BookId: Integer):
      TObjectList<TCustomerReview>;
    function GetCustomerReviewById(const CustomerReviewId: Integer):
      TCustomerReview;
    procedure UpdateCustomerReview(const CustomerReview: TCustomerReview);
    procedure DeleteCustomerReview(const CustomerReviewId: Integer);
  public
    constructor Create(AApi: ICustomerReviewApi); overload;
  end;

implementation

uses
  REST.JSON, JSON;

{ TCustomerReviewServiceClient }

constructor TCustomerReviewServiceClient.Create(AApi: ICustomerReviewApi);
begin
  FApi := AApi;
end;

procedure TCustomerReviewServiceClient.CreateCustomerReview(
  const CustomerReview: TCustomerReview);
begin
  var Response := FApi.CreateReview(CustomerReview.ToJSONBody);

  if Response.StatusCode <> 201 then
    raise Exception.Create('Unable to create review');
end;

procedure TCustomerReviewServiceClient.DeleteCustomerReview(
  const CustomerReviewId: Integer);
begin
  var Response := FApi.DeleteReview(CustomerReviewId);

  if Response.StatusCode <> 204 then
    raise Exception.Create('Unable to delete review');
end;

function TCustomerReviewServiceClient.GetCustomerReviewById(
  const CustomerReviewId: Integer): TCustomerReview;
begin
  var Response := FApi.GetReviewById(CustomerReviewId);

  if Response.StatusCode <> 200 then
    raise Exception.Create('Something went wrong');

  var JSONValue := TJSONObject.ParseJSONValue(Response.Content);
  var Data := JSONValue.GetValue<string>('data');
  var CustomerReview := TJSON.JsonToObject<TCustomerReview>(Data);

  Result := CustomerReview;
end;

function TCustomerReviewServiceClient.GetCustomerReviewsByBookId(
  const BookId: Integer): TObjectList<TCustomerReview>;
begin
  var Response := FApi.GetReviewsByBookId(BookId);

  if Response.StatusCode <> 200 then
    raise Exception.Create('Something went wrong');

  var JSONValue := TJSONObject.ParseJSONValue(Response.Content);
  var CustomerArray := JSONValue.GetValue<TJSONArray>('data');
  var CustomerList := TObjectList<TCustomerReview>.Create;

  for var I := 0 to CustomerArray.Count - 1 do
  begin
    var CustomerJSON := CustomerArray.Items[I].ToString;
    var CustomerReview := TJSON.JsonToObject<TCustomerReview>(CustomerJSON);
    CustomerList.Add(CustomerReview);
  end;

  Result := CustomerList;
end;

procedure TCustomerReviewServiceClient.UpdateCustomerReview(
  const CustomerReview: TCustomerReview);
begin
  var Response := FApi.UpdateReview(CustomerReview.ToJSONBody);

  if Response.StatusCode <> 200 then
    raise Exception.Create('Unable to update review');
end;

end.
