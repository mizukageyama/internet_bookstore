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
  public
    constructor Create(const ACustomerReview: ICustomerReviewContext); overload;
    constructor Create(const AId, ACustomerId, ABookId, ARating: Integer;
      const AReview: string); overload;

    function IsValid: Boolean;
    function IsMoreThan1MB: Boolean;
    function IsTooShort: Boolean;
    function IsRatingInRange: Boolean;

    property Id: Integer read FId write FId;
    property BookId: Integer read FBookId write FBookId;
    property CustomerId: Integer read FCustomerId write FCustomerId;
    property Review: string read FReview write FReview;
    property Rating: Integer read FRating write FRating;
  end;

implementation

uses
  System.SysUtils;

{ TCustomerReview }

constructor TCustomerReview.Create(const ACustomerReview: ICustomerReviewContext);
begin
  if not Assigned(ACustomerReview) then
    raise EArgumentNilException.Create('ACustomer');

  inherited Create;

  FId := ACustomerReview.Id;
  FCustomerId := ACustomerReview.CustomerId;
  FBookId := ACustomerReview.BookId;
  FReview := ACustomerReview.Review;
  FRating := ACustomerReview.Rating;
end;

constructor TCustomerReview.Create(const AId, ACustomerId, ABookId,
  ARating: Integer; const AReview: string);
begin
  inherited Create;

  FId := AId;
  FCustomerId := ACustomerId;
  FBookId := ABookId;
  FReview := AReview;
  FRating := ARating;
end;

function TCustomerReview.IsMoreThan1MB: Boolean;
begin
  var MaxSizeBytes: Integer := 1 * 1024 * 1024;

  if (Length(Review) * SizeOf(Char)) <= MaxSizeBytes then
    Result := False
  else
    Result := True;
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

end.
