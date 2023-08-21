unit WriteReviewPresenter;

interface

uses
  WriteReviewPresenterIntf, WriteReviewFrmIntf, CustomerReviewServiceClientIntf,
  System.SysUtils, Vcl.Dialogs, CustomerReviewDTO;

type
  TWriteReviewPresenter = class(TInterfacedObject, IWriteReviewPresenter)
  private
    FWriteReviewView: IWriteReviewForm;
    FCustomerReviewService: ICustomerReviewServiceClient;
  protected
    procedure InitializeView;
    procedure SaveReview(const BookId: Integer);
    procedure ValidateInput(out CustomerReview: TCustomerReview;
      out IsSuccess: Boolean);
    procedure HideValidationMessage;
  public
    constructor Create(AWriteReviewView: IWriteReviewForm;
      ACustomerReviewService: ICustomerReviewServiceClient);
  end;

implementation

{ TWriteReviewPresenter }

constructor TWriteReviewPresenter.Create(AWriteReviewView: IWriteReviewForm;
  ACustomerReviewService: ICustomerReviewServiceClient);
begin
  FWriteReviewView := AWriteReviewView;
  FCustomerReviewService := ACustomerReviewService;
  FWriteReviewView.SetPresenter(Self);
end;

procedure TWriteReviewPresenter.InitializeView;
begin
  FWriteReviewView.DisplayBookTitle;
  FWriteReviewView.DisplayCustomerGreeting('Anna');
  FWriteReviewView.HideReviewValidationMessage;
  HideValidationMessage;
end;

procedure TWriteReviewPresenter.SaveReview(const BookId: Integer);
var
  CustomerReview: TCustomerReview;
  IsSuccess: Boolean;
begin
  CustomerReview := TCustomerReview.Create;
  ValidateInput(CustomerReview, IsSuccess);
  CustomerReview.SetBookId(BookId);
  CustomerReview.SetCustomerId(1);

  if IsSuccess then
  begin
    try
      FCustomerReviewService.CreateCustomerReview(CustomerReview);
      ShowMessage('Review Added Successfully');
      FWriteReviewView.CloseForm;
      //Should reload the parent's reviews
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
      FWriteReviewView.ShowRatingValidationMessage('Rating should be 1-5 range');
  end
  else
    FWriteReviewView.ShowRatingValidationMessage('Rating should be a number');

  if CustomerReview.IsMoreThan1MB then
    FWriteReviewView.ShowReviewValidationMessage('Review should be less than 1MB');

  if CustomerReview.IsTooShort then
    FWriteReviewView.ShowReviewValidationMessage('Review should be 10 or more characters');

  IsSuccess := CustomerReview.IsValid;
end;

procedure TWriteReviewPresenter.HideValidationMessage;
begin
  FWriteReviewView.HideReviewValidationMessage;
  FWriteReviewView.HideRatingValidationMessage;
end;

end.
