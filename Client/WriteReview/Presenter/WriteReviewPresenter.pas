unit WriteReviewPresenter;

interface

uses
  WriteReviewPresenterIntf, WriteReviewFrmIntf, CustomerReviewServiceIntf,
  System.SysUtils, Vcl.Dialogs, CustomerReview, Vcl.Forms, Book;

type
  TWriteReviewPresenter = class(TInterfacedObject, IWriteReviewPresenter)
  private
    FWriteReviewView: IWriteReviewForm;
    FCustomerReviewServiceProxy: ICustomerReviewService;
    FBook: TBook;
  protected
    procedure InitializeView;
    procedure SubmitReview;
    procedure ValidateInput(out CustomerReview: TCustomerReview;
      out IsSuccess: Boolean);
    procedure HideValidationMessage;
  public
    constructor Create(AWriteReviewView: IWriteReviewForm;
      ACustomerReviewService: ICustomerReviewService; ABook: TBook);
  end;

implementation

uses
  CustomerSession, BookDetailsFrmIntf, BookDetailsFrm, BookServiceProxy,
  StatusCodeException, SYSCONST;

{ TWriteReviewPresenter }

constructor TWriteReviewPresenter.Create(AWriteReviewView: IWriteReviewForm;
  ACustomerReviewService: ICustomerReviewService; ABook: TBook);
begin
  FWriteReviewView := AWriteReviewView;
  FCustomerReviewServiceProxy := ACustomerReviewService;
  FWriteReviewView.SetPresenter(Self);
  FBook := ABook;
end;

procedure TWriteReviewPresenter.InitializeView;
begin
  FWriteReviewView.DisplayBookTitle(FBook.Title);
  var CustomerSession := TCustomerSession.Instance;
  var Customer := CustomerSession.GetLoggedInCustomer;
  FWriteReviewView.DisplayCustomerGreeting(Customer.FirstName);
  HideValidationMessage;
end;

procedure TWriteReviewPresenter.SubmitReview;
var
  CustomerReview: TCustomerReview;
  IsValidationSuccess: Boolean;
  ReviewText: string;
  Rating: Integer;
begin
  ValidateInput(CustomerReview, IsValidationSuccess);

  if not IsValidationSuccess then
    Exit;

  CustomerReview := TCustomerReview.Create;
  var CustomerSession := TCustomerSession.Instance;
  var Customer := CustomerSession.GetLoggedInCustomer;
  CustomerReview.CustomerId := Customer.Id;
  CustomerReview.BookId := FBook.Id;

  try
    FCustomerReviewServiceProxy.CreateCustomerReview(CustomerReview);
    ShowMessage('Review is sent to admin for approval');
    FWriteReviewView.CloseForm;
  except
   on E: TStatusCodeException do
   begin
    case E.StatusCode of
      UnAuthorized:
        begin
          CustomerSession.SetDefaultValue;
          ShowMessage('Session expired. Please login');
          FWriteReviewView.CloseForm;
        end;
      NotFound: ShowMessage('Book no longer exists');
    else
      ShowMessage(E.ToString);
    end;
   end;
  end;
end;

procedure TWriteReviewPresenter.ValidateInput(out CustomerReview:
  TCustomerReview; out IsSuccess: Boolean);
var
  ReviewInput: string;
  RatingInput: string;
  Rating: Integer;
begin
  ReviewInput := FWriteReviewView.GetReviewText;
  RatingInput := FWriteReviewView.GetReviewRating;

  CustomerReview.Review := ReviewInput;
  IsSuccess := True;
  HideValidationMessage;

  if TryStrToInt(RatingInput, Rating) then
  begin
    CustomerReview.Rating := Rating;
    if not CustomerReview.IsRatingInRange then
    begin
      FWriteReviewView.ShowRatingValidationMessage(
        'Rating should be within 1-5 range');
      IsSuccess := False;
    end;
  end
  else
  begin
    FWriteReviewView.ShowRatingValidationMessage('Rating should be a number');
    IsSuccess := False;
  end;

  if CustomerReview.IsMoreThan1MB then
  begin
    FWriteReviewView.ShowReviewValidationMessage(
      'Review should be less than 1MB');
    IsSuccess := False;
  end;

  if CustomerReview.IsTooShort then
  begin
    FWriteReviewView.ShowReviewValidationMessage(
      'Review should not be less than 10 characters');
    IsSuccess := False;
  end;
end;

procedure TWriteReviewPresenter.HideValidationMessage;
begin
  FWriteReviewView.HideReviewValidationMessage;
  FWriteReviewView.HideRatingValidationMessage;
end;

end.
