unit CustomerReviewServiceClientIntf;

interface

uses
  CustomerReviewDTO;

type
  ICustomerReviewServiceClient = interface
    ['{BEB715ED-E32D-41A3-9D6D-38BBD0434F51}']
    function CreateCustomerReview(const CustomerReview:
      TCustomerReview): string;
    function GetCustomerReviewsByBookId(const BookId: Integer): string;
    function GetCustomerReviewById(const CustomerReviewId: Integer): string;
    function UpdateCustomerReview(const CustomerReview:
      TCustomerReview): string;
    function DeleteCustomerReview(const CustomerReviewId: Integer): string;
  end;

implementation

end.
