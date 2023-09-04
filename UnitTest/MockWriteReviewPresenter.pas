unit MockWriteReviewPresenter;

interface

uses
  Book, CustomerReviewServiceIntf, WriteReviewFrmIntf,
  WriteReviewPresenterIntf, CustomerReview, Forms;

type TMockWriteReviewPresenter = class(TInterfacedObject, IWriteReviewPresenter)
  private
    FWriteReviewView: TForm;
    FCustomerReviewServiceProxy: ICustomerReviewService;
    FBook: TBook;
  public
    constructor Create(AWriteReviewView: TForm;
      ACustomerReviewService: ICustomerReviewService; ABook: TBook);

    procedure InitializeView;
    procedure SubmitReview;
    procedure ValidateInput(out CustomerReview: TCustomerReview;
      out IsSuccess: Boolean);
  end;

implementation

{ TMockWriteReviewPresenter }

constructor TMockWriteReviewPresenter.Create(AWriteReviewView: TForm;
  ACustomerReviewService: ICustomerReviewService; ABook: TBook);
begin
  FWriteReviewView := AWriteReviewView;
  FCustomerReviewServiceProxy := ACustomerReviewService;
  FBook := ABook;
end;

procedure TMockWriteReviewPresenter.InitializeView;
begin

end;

procedure TMockWriteReviewPresenter.SubmitReview;
begin

end;

procedure TMockWriteReviewPresenter.ValidateInput(
  out CustomerReview: TCustomerReview; out IsSuccess: Boolean);
begin

end;

end.
