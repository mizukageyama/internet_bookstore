unit BookDetailsPresenterIntf;

interface

uses
  Book;

type
  IBookDetailsPresenter = interface
    procedure LoadReviews(const BookId: Integer);
    procedure WriteReview(const Book: TBook);
    function IsCustomerLoggedIn: Boolean;
    procedure PopulateReviewsTable(JSONData: string);
  end;

implementation

end.
