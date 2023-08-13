unit CustomerReviewDAOIntf;

interface

uses
  System.Generics.Collections, CustomerReview;

type
  ICustomerReviewDAO = interface
    procedure CreateCustomerReview(const CustomerReview: TCustomerReview);
    function GetCustomerReviewsByBookId(const BookId: Integer):
      TObjectList<TCustomerReview>;
    procedure UpdateCustomerReview(const CustomerReviewId: Integer;
      const CustomerReview: TCustomerReview);
    procedure DeleteCustomerReview(const CustomerReviewId: Integer);
  end;

implementation

end.
