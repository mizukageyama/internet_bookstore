unit WriteReviewFrmIntf;

interface

uses
  Vcl.Forms, WriteReviewPresenterIntf;

type
  IWriteReviewForm = interface
    procedure DisplayBookTitle;
    procedure DisplayCustomerGreeting(const Customer: string);
    function GetReviewText: string;
    function GetReviewRating: string;
    procedure HideForm;
    procedure ShowForm;
    procedure CloseForm;
    function Self: TForm;
    procedure ShowReviewValidationMessage(const ValidationMessage: string);
    procedure HideReviewValidationMessage;
    procedure ShowRatingValidationMessage(const ValidationMessage: string);
    procedure HideRatingValidationMessage;
    procedure SetPresenter(APresenter: IWriteReviewPresenter);
  end;

implementation

end.
