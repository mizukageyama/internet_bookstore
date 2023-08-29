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
  FWriteReviewView.HideReviewValidationMessage;
  HideValidationMessage;
end;

procedure TWriteReviewPresenter.SubmitReview;
var
  CustomerReview: TCustomerReview;
  IsValidationSuccess: Boolean;
begin
  CustomerReview := TCustomerReview.Create;
  ValidateInput(CustomerReview, IsValidationSuccess);

  try
    var BookServiceProxy := TBookServiceProxy.Create;
    var Book := BookServiceProxy.GetBookById(FBook.Id);
  except
    on E: TStatusCodeException do
      begin
        case E.StatusCode of
          NotFound: ShowMessage('Book no longer exists');
          else
            ShowMessage(E.ToString);
        end;
        Exit;
      end;
  end;

  var CustomerSession := TCustomerSession.Instance;
  var Customer := CustomerSession.GetLoggedInCustomer;
  CustomerReview.SetCustomerId(Customer.Id);
  CustomerReview.SetBookId(FBook.Id);

  if not IsValidationSuccess then
    Exit;

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
        end
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

  CustomerReview.SetReview(ReviewInput);
  HideValidationMessage;

  if TryStrToInt(RatingInput, Rating) then
  begin
    CustomerReview.SetRating(Rating);
    if not CustomerReview.IsRatingInRange then
      FWriteReviewView.ShowRatingValidationMessage(
        'Rating should be within 1-5 range');
  end
  else
    FWriteReviewView.ShowRatingValidationMessage('Rating should be a number');

  if CustomerReview.IsMoreThan1MB then
    FWriteReviewView.ShowReviewValidationMessage(
      'Review should be less than 1MB');

  if CustomerReview.IsTooShort then
    FWriteReviewView.ShowReviewValidationMessage(
      'Review should not be less than 10 characters');

  IsSuccess := CustomerReview.IsValid;
end;

procedure TWriteReviewPresenter.HideValidationMessage;
begin
  FWriteReviewView.HideReviewValidationMessage;
  FWriteReviewView.HideRatingValidationMessage;
end;

end.
