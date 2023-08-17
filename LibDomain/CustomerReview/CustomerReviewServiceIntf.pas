unit CustomerReviewServiceIntf;

interface

uses
  CustomerReview, System.Generics.Collections;

type
  ICustomerReviewService = interface
    ['{4C398186-FA74-4280-B4B1-3AD59119176D}']
    procedure CreateCustomerReview(const CustomerReview: TCustomerReview);
    function GetCustomerReviewsByBookId(const BookId: Integer):
      TObjectList<TCustomerReview>;
    function GetCustomerReviewById(const CustomerReviewId: Integer):
      TCustomerReview;
    procedure UpdateCustomerReview(const CustomerReview: TCustomerReview);
    procedure DeleteCustomerReview(const CustomerReviewId: Integer);
  end;

implementation

end.
