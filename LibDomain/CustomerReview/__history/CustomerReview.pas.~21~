unit CustomerReview;

interface

uses
  CustomerReviewContextIntf;

type
  TCustomerReview = class
  private
    FId: Integer;
    FCustomerId: Integer;
    FBookId: Integer;
    FReview: string;
    FRating: Integer;
    FIsPending: Boolean;
  public
    constructor Create(const ACustomerReview: ICustomerReviewContext); overload;
    constructor Create(const AId, ACustomerId, ABookId, ARating: Integer;
      const AReview: string; const AIsPending: Boolean); overload;

    function ToJSONBody: string;
    function IsValid: Boolean;
    function IsMoreThan1MB: Boolean;
    function IsTooShort: Boolean;
    function IsRatingInRange: Boolean;

    procedure SetBookId(const BookId: Integer);
    procedure SetCustomerId(const CustomerId: Integer);
    procedure SetId(const Id: Integer);
    procedure SetRating(const Rating: Integer);
    procedure SetReview(const Review: string);
    procedure SetIsPending(const IsPending: Boolean);

    property Id: Integer read FId write SetId;
    property BookId: Integer read FBookId write SetBookId;
    property CustomerId: Integer read FCustomerId write SetCustomerId;
    property Review: string read FReview write SetReview;
    property Rating: Integer read FRating write SetRating;
    property IsPending: Boolean read FIsPending write SetIsPending;
  end;

implementation

uses
  System.SysUtils, JSON;

{ TCustomerReview }

constructor TCustomerReview.Create(const ACustomerReview:
  ICustomerReviewContext);
begin
  if not Assigned(ACustomerReview) then
    raise EArgumentNilException.Create('ACustomer');

  inherited Create;

  FId := ACustomerReview.Id;
  FCustomerId := ACustomerReview.CustomerId;
  FBookId := ACustomerReview.BookId;
  FReview := ACustomerReview.Review;
  FRating := ACustomerReview.Rating;
  FIsPending := ACustomerReview.IsPending;
end;

constructor TCustomerReview.Create(const AId, ACustomerId, ABookId,
  ARating: Integer; const AReview: string; const AIsPending: Boolean);
begin
  inherited Create;

  FId := AId;
  FCustomerId := ACustomerId;
  FBookId := ABookId;
  FReview := AReview;
  FRating := ARating;
  FIsPending := AIsPending;
end;

function TCustomerReview.IsMoreThan1MB: Boolean;
begin
  Result := (Length(Review) >= 10000);
end;

function TCustomerReview.IsRatingInRange: Boolean;
begin
  Result := ((Rating > 0) and (Rating <= 5));
end;

function TCustomerReview.IsTooShort: Boolean;
begin
  Result := (Length(Review) < 10);
end;

function TCustomerReview.IsValid: Boolean;
begin
  Result := IsRatingInRange and (not IsMoreThan1MB) and (not IsTooShort);
end;

procedure TCustomerReview.SetBookId(const BookId: Integer);
begin
  FBookId := BookId;
end;

procedure TCustomerReview.SetCustomerId(const CustomerId: Integer);
begin
  FCustomerId := CustomerId;
end;

procedure TCustomerReview.SetId(const Id: Integer);
begin
  FId := Id;
end;

procedure TCustomerReview.SetIsPending(const IsPending: Boolean);
begin
  FIsPending := IsPending;
end;

procedure TCustomerReview.SetRating(const Rating: Integer);
begin
  FRating := Rating;
end;

procedure TCustomerReview.SetReview(const Review: string);
begin
  FReview := Review;
end;

function TCustomerReview.ToJSONBody: string;
begin
  var JSONBody := TJSONObject.Create;
  try
    JSONBody.AddPair('Id', Id);
    JSONBody.AddPair('BookId', BookId);
    JSONBody.AddPair('CustomerId', CustomerId);
    JSONBody.AddPair('Review', Review);
    JSONBody.AddPair('Rating', Rating);

    Result := JSONBody.ToString;
  finally
    JSONBody.Free;
  end;
end;


end.
