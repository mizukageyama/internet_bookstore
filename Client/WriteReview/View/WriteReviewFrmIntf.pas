unit WriteReviewFrmIntf;

interface

uses
  Vcl.Forms, WriteReviewPresenterIntf;

type
  IWriteReviewForm = interface
    ['{CA877568-6A73-44DF-9B42-577E46E44AB7}']
    procedure DisplayBookTitle(const BookTitle: string);
    procedure DisplayCustomerGreeting(const Customer: string);
    function GetReviewText: string;
    function GetReviewRating: string;
    procedure HideForm;
    procedure ShowForm;
    procedure CloseForm;
    function Self: TForm;
    function GetParentForm: TForm;
    procedure ShowReviewValidationMessage(const ValidationMessage: string);
    procedure HideReviewValidationMessage;
    procedure ShowRatingValidationMessage(const ValidationMessage: string);
    procedure HideRatingValidationMessage;
    procedure SetPresenter(APresenter: IWriteReviewPresenter);
  end;

implementation

end.
