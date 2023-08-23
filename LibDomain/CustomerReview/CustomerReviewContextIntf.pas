unit CustomerReviewContextIntf;

interface

type
  ICustomerReviewContext = interface
    ['{073F2737-2F23-4602-97C6-FE55EFE68269}']
    function GetCustomerReviewId: Integer;
    procedure SetCustomerReviewId(const CustomerReviewId: Integer);

    function GetCustomerReviewBookId: Integer;
    procedure SetCustomerReviewBookId(const BookId: Integer);

    function GetCustomerReviewCustomerId: Integer;
    procedure SetCustomerReviewCustomerId(const CustomerId: Integer);

    function GetReview: string;
    procedure SetReview(const Review: string);

    function GetCustomerReviewRating: Integer;
    procedure SetCustomerReviewRating(const Rating: Integer);

    function GetCustomerReviewIsPending: Boolean;
    procedure SetCustomerReviewIsPending(const IsPending: Boolean);

    property Id: Integer
      read GetCustomerReviewId write SetCustomerReviewId;

    property BookId: Integer
      read GetCustomerReviewBookId write SetCustomerReviewBookId;

    property CustomerId: Integer
      read GetCustomerReviewCustomerId write SetCustomerReviewCustomerId;

    property Review: string
      read GetReview write SetReview;

    property Rating: Integer
      read GetCustomerReviewRating write SetCustomerReviewRating;

    property IsPending: Boolean
      read GetCustomerReviewIsPending write SetCustomerReviewIsPending;
  end;

implementation

end.
