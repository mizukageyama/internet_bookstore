unit CustomerReviewRepository;

interface

uses
  CustomerReviewRepositoryIntf, CustomerReview, MVCFramework.RESTClient.Intf,
  MVCFramework.RESTClient, MVCFramework.DataSet.Utils,
  System.Generics.Collections, JSON, System.SysUtils;

type
  TCustomerReviewRepository = class(TInterfacedObject,
    ICustomerReviewRepository)
  private
    FRESTClient: IMVCRESTClient;
    const
      ENDPOINT = '/api/reviews';
  protected
    function CreateReview(const RequestBody: TJSONObject): IMVCRESTResponse;
    function GetReviewsByBookId(const BookId: Integer): IMVCRESTResponse;
    function GetReviewById(const ReviewId: Integer): IMVCRESTResponse;
    function UpdateReview(const RequestBody: TJSONObject): IMVCRESTResponse;
    function DeleteReview(const ReviewId: Integer): IMVCRESTResponse;
  public
    constructor Create;
    destructor OnDestroy;
  end;

implementation

{ TCustomerReviewRepository }

constructor TCustomerReviewRepository.Create;
begin
  FRESTClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
end;

function TCustomerReviewRepository.CreateReview(
  const RequestBody: TJSONObject): IMVCRESTResponse;
var
  Response: IMVCRESTResponse;
begin
  FRESTClient.SetBearerAuthorization('token');
  FRESTClient.AddBody(RequestBody.toString, 'application/json');
  Response := FRESTClient.POST(ENDPOINT);
  Result := Response;
end;

function TCustomerReviewRepository.DeleteReview(
  const ReviewId: Integer): IMVCRESTResponse;
var
  Response: IMVCRESTResponse;
begin
  FRESTClient.SetBearerAuthorization('token');
  Response := FRESTClient.DELETE(ENDPOINT + '/'+ ReviewId.toString);
  Result := Response;
end;

function TCustomerReviewRepository.GetReviewById(
  const ReviewId: Integer): IMVCRESTResponse;
var
  Response: IMVCRESTResponse;
begin
  Response := FRESTClient.GET(ENDPOINT + '/'+ ReviewId.toString);
  Result := Response;
end;

function TCustomerReviewRepository.GetReviewsByBookId(
  const BookId: Integer): IMVCRESTResponse;
var
  Response: IMVCRESTResponse;
begin
  Response := FRESTClient.GET(ENDPOINT + '/'+ BookId.toString);
  Result := Response;
end;

destructor TCustomerReviewRepository.OnDestroy;
begin
  FRESTClient := nil;
end;

function TCustomerReviewRepository.UpdateReview(
  const RequestBody: TJSONObject): IMVCRESTResponse;
var
  Response: IMVCRESTResponse;
begin
  FRESTClient.SetBearerAuthorization('token');
  FRESTClient.AddBody(RequestBody.toString, 'application/json');
  Response := FRESTClient.PUT(ENDPOINT);
  Result := Response;
end;

end.
