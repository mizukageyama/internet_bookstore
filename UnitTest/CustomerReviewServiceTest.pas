unit CustomerReviewServiceTest;

interface

uses
  DUnitX.TestFramework;

type
  [TestFixture]
  TCustomerReviewServiceTest = class
  public
    [Test]
    [TestCase('RatingInRange','1,2,3,Hello world. This is my review,4')]
    procedure CreateCustomerReview_RatingInRange_PassValidation(const AId,
      ABookId, ACustomerId : Integer; const AReview : string;
      const ARating: Integer);
    [Test]
    [TestCase('ZeroRating','1,2,3,Hello world. This is my review,0')]
    [TestCase('NegativeRating','1,2,3,Hello world. This is my review,-100')]
    procedure CreateCustomerReview_RatingNotInRange_FailValidation(const AId,
      ABookId, ACustomerId : Integer; const AReview : string;
      const ARating: Integer);
    [Test]
    [TestCase('EmptyReview','1,2,3,,4')]
    [TestCase('Review4CharactersOnly','1,2,3,Hello,4')]
    procedure CreateCustomerReview_IsTooShort_FailValidation(const AId, ABookId,
      ACustomerId : Integer; const AReview : string; const ARating: Integer);
  end;

implementation

uses
  CustomerReview;

{ TCustomerReviewServiceTest }

procedure TCustomerReviewServiceTest
  .CreateCustomerReview_IsTooShort_FailValidation(
  const AId, ABookId, ACustomerId: Integer; const AReview: string;
  const ARating: Integer);
begin
  var CustomerReview := TCustomerReview.Create(AId, ACustomerId, ABookId,
    ARating, AReview, False);
  Assert.IsTrue(CustomerReview.IsTooShort);
end;

procedure TCustomerReviewServiceTest
  .CreateCustomerReview_RatingInRange_PassValidation(
  const AId, ABookId, ACustomerId: Integer; const AReview: string;
  const ARating: Integer);
begin
  var CustomerReview := TCustomerReview.Create(AId, ACustomerId, ABookId,
    ARating, AReview, False);
  Assert.IsTrue(CustomerReview.IsRatingInRange);
end;

procedure TCustomerReviewServiceTest
  .CreateCustomerReview_RatingNotInRange_FailValidation(
  const AId, ABookId, ACustomerId: Integer; const AReview: string;
  const ARating: Integer);
begin
  var CustomerReview := TCustomerReview.Create(AId, ACustomerId, ABookId,
    ARating, AReview, False);
  Assert.IsFalse(CustomerReview.IsRatingInRange);
end;

initialization
  TDUnitX.RegisterTestFixture(TCustomerReviewServiceTest);

end.
