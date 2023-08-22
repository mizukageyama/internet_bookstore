unit BookDetailsPresenterIntf;

interface

uses
  Book, CustomerReview, System.Generics.Collections;

type
  IBookDetailsPresenter = interface
    ['{26ABF55F-A04E-4A09-A329-9F84C34090A3}']
    procedure LoadReviews(const BookId: Integer);
    procedure WriteReview(const Book: TBook);
    function IsCustomerLoggedIn: Boolean;
    procedure PopulateReviewsTable(const CustomerReviews:
      TObjectList<TCustomerReview>);
  end;

implementation

end.