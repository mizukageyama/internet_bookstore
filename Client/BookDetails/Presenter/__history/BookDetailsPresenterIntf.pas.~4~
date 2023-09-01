unit BookDetailsPresenterIntf;

interface

uses
  Book, CustomerReview, System.Generics.Collections;

type
  IBookDetailsPresenter = interface
    ['{26ABF55F-A04E-4A09-A329-9F84C34090A3}']
    procedure LoadReviews;
    procedure WriteReview;
    function IsCustomerLoggedIn: Boolean;
    procedure PopulateReviewsTable(const CustomerReviews:
      TObjectList<TCustomerReview>);
    procedure DisplayBookDetails;
  end;

implementation

end.
