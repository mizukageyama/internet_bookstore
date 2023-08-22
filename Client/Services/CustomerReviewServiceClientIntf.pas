unit CustomerReviewServiceClientIntf;

interface

uses
  CustomerReview;

type
  ICustomerReviewServiceClient = interface
    ['{BEB715ED-E32D-41A3-9D6D-38BBD0434F51}']
    procedure CreateCustomerReview(const CustomerReview: TCustomerReview);
    function GetCustomerReviewsByBookId(const BookId: Integer): string;
    function GetCustomerReviewById(const CustomerReviewId: Integer): string;
    procedure UpdateCustomerReview(const CustomerReview: TCustomerReview);
    procedure DeleteCustomerReview(const CustomerReviewId: Integer);
  end;

implementation

end.
