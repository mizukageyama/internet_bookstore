unit WriteReviewPresenterIntf;

interface

uses
  CustomerReviewDTO;

type
  IWriteReviewPresenter = interface
    procedure InitializeView;
    procedure SaveReview(const BookId: Integer);
    procedure ValidateInput(out CustomerReview: TCustomerReview;
      out IsSuccess: Boolean);
  end;

implementation

end.
