unit CustomerReviewDAOIntf;

interface

uses
  System.Generics.Collections, CustomerReview;

type
  ICustomerReviewDAO = interface
    ['{A5A1B3F1-7D62-4F1C-915F-B541A15E9BE1}']
    procedure Insert(const CustomerReview: TCustomerReview);
    function SelectWhereBookId(const CustomerReviewBookId: Integer):
      TObjectList<TCustomerReview>;
    function SelectWhereId(const CustomerReviewId: Integer): TCustomerReview;
    procedure Update(const CustomerReview: TCustomerReview);
    procedure Delete(const CustomerReviewId: Integer);
  end;

implementation

end.
