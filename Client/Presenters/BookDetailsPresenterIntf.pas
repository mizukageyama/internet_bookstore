unit BookDetailsPresenterIntf;

interface

type
  IBookDetailsPresenter = interface
    procedure LoadReviews(const BookId: Integer);
    procedure WriteReview;
    function IsCustomerLoggedIn: Boolean;
    procedure PopulateReviewsTable(JSONData: string);
  end;

implementation

end.
