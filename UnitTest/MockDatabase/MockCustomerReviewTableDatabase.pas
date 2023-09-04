unit MockCustomerReviewTableDatabase;

interface

uses
  CustomerReview, System.Generics.Collections;

type
  TMockCustomerReviewTableDatabase = class
  private
    FReviews: TDictionary<Integer, TCustomerReview>;
    FNextReviewId: Integer;
  public
    constructor Create;
    destructor Destroy; override;

    procedure AddCustomerReview(const CustomerReview: TCustomerReview);
    function GetAllReviews: TObjectList<TCustomerReview>;
    function GetReviewsByBookId(const BookId: Integer):
      TObjectList<TCustomerReview>;
    procedure UpdateReview(const CustomerReview: TCustomerReview);
    procedure DeleteReview(const CustomerReviewId: Integer);
    function Contains(const CustomerReviewId: Integer): Boolean;
    function GetCustomerReviewById(const CustomerReviewId: Integer):
      TCustomerReview;
  end;

var
  MockDatabase: TMockCustomerReviewTableDatabase;

implementation

constructor TMockCustomerReviewTableDatabase.Create;
begin
  FReviews := TDictionary<Integer, TCustomerReview>.Create;
  FNextReviewId := 1;
end;

destructor TMockCustomerReviewTableDatabase.Destroy;
begin
  FReviews.Free;
  inherited;
end;

procedure TMockCustomerReviewTableDatabase.AddCustomerReview(const
  CustomerReview: TCustomerReview);
begin
  CustomerReview.Id := FNextReviewId;
  FReviews.Add(FNextReviewId, CustomerReview);
  Inc(FNextReviewId);
end;

function TMockCustomerReviewTableDatabase.GetAllReviews:
  TObjectList<TCustomerReview>;
begin
  Result := TObjectList<TCustomerReview>.Create(True);
  for var Review in FReviews.Values do
    Result.Add(Review);
end;

function TMockCustomerReviewTableDatabase.GetCustomerReviewById(
  const CustomerReviewId: Integer): TCustomerReview;
begin
  if FReviews.TryGetValue(CustomerReviewId, Result) then
    Exit
  else
    Result := nil;
end;

function TMockCustomerReviewTableDatabase.GetReviewsByBookId(
  const BookId: Integer): TObjectList<TCustomerReview>;
begin
  var Reviews := TObjectList<TCustomerReview>.Create;

  for var Review in FReviews.values do
  begin
    if Review.BookId = BookId then
      Reviews.Add(Review);
  end;

  Result := Reviews;
end;

procedure TMockCustomerReviewTableDatabase.UpdateReview(const CustomerReview:
  TCustomerReview);
begin
  FReviews[CustomerReview.Id] := CustomerReview;
end;

procedure TMockCustomerReviewTableDatabase.DeleteReview(const CustomerReviewId:
  Integer);
begin
  FReviews.Remove(CustomerReviewId);
end;

function TMockCustomerReviewTableDatabase.Contains(const CustomerReviewId:
  Integer): Boolean;
begin
  Result := FReviews.ContainsKey(CustomerReviewId);
end;

initialization
  MockDatabase := TMockCustomerReviewTableDatabase.Create;

finalization
  MockDatabase.Free;

end.
