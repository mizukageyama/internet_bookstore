unit WriteReviewFrmIntf;

interface

uses
  WriteReviewPresenterIntf, Customer, Book;

type
  IWriteReviewView= interface
    ['{CA877568-6A73-44DF-9B42-577E46E44AB7}']
    procedure SetPresenter(APresenter: IWriteReviewPresenter);
    procedure DisplayCustomerGreeting(const Customer: TCustomer);
    procedure DisplayBookTitle(const Book: TBook);
    function GetReviewText: string;
    function GetReviewRating: string;
    procedure CloseForm;
    procedure ShowMessageDialog(const Msg: string);
    procedure ShowReviewValidationMessage(const ValidationMessage: string);
    procedure ShowRatingValidationMessage(const ValidationMessage: string);
    procedure HideValidationMessage;
    procedure Show;
  end;

implementation

end.
