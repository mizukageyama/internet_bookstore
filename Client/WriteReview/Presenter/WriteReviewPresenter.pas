unit WriteReviewPresenter;

interface

uses
  WriteReviewPresenterIntf, WriteReviewFrmIntf, CustomerReviewServiceIntf,
  System.SysUtils, Vcl.Dialogs, CustomerReview, Vcl.Forms;

type
  TWriteReviewPresenter = class(TInterfacedObject, IWriteReviewPresenter)
  private
    FWriteReviewView: IWriteReviewForm;
    FCustomerReviewServiceProxy: ICustomerReviewService;
  protected
    procedure InitializeView;
    procedure SubmitReview(const BookId: Integer);
    procedure ValidateInput(out CustomerReview: TCustomerReview;
      out IsSuccess: Boolean);
    procedure HideValidationMessage;
  public
    constructor Create(AWriteReviewView: IWriteReviewForm;
      ACustomerReviewService: ICustomerReviewService);
  end;

implementation

uses
  CustomerSession, BookDetailsFrmIntf, BookDetailsFrm;

{ TWriteReviewPresenter }

constructor TWriteReviewPresenter.Create(AWriteReviewView: IWriteReviewForm;
  ACustomerReviewService: ICustomerReviewService);
begin
  FWriteReviewView := AWriteReviewView;
  FCustomerReviewServiceProxy := ACustomerReviewService;
  FWriteReviewView.SetPresenter(Self);
end;

procedure TWriteReviewPresenter.InitializeView;
begin
  FWriteReviewView.DisplayBookTitle;
  var CustomerSession := TCustomerSession.Instance;
  FWriteReviewView.DisplayCustomerGreeting(CustomerSession.GetCustomerName);
  FWriteReviewView.HideReviewValidationMessage;
  HideValidationMessage;
end;

procedure TWriteReviewPresenter.SubmitReview(const BookId: Integer);
var
  CustomerReview: TCustomerReview;
  IsSuccess: Boolean;
begin
  CustomerReview := TCustomerReview.Create;
  ValidateInput(CustomerReview, IsSuccess);
  CustomerReview.SetBookId(BookId);

  var CustomerSession := TCustomerSession.Instance;
  CustomerReview.SetCustomerId(CustomerSession.GetCustomerID);

  if IsSuccess then
  begin
    try
      FCustomerReviewServiceProxy.CreateCustomerReview(CustomerReview);
      ShowMessage('Review is sent to admin for approval');
      FWriteReviewView.CloseForm;
    except
      on E: Exception do
        ShowMessage(E.ToString);
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
