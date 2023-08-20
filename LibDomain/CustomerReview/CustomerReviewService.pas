unit CustomerReviewService;

interface

uses
  CustomerReviewServiceIntf, CustomerReview, CustomerReviewDaoIntf,
  System.Generics.Collections;

type
  TCustomerReviewService = class(TInterfacedObject, ICustomerReviewService)
  private
    FCustomerReviewDao: ICustomerReviewDao;
  public
    constructor Create(const ACustomerReviewDao: ICustomerReviewDao);

    procedure CreateCustomerReview(const CustomerReview: TCustomerReview);
    function GetCustomerReviewsByBookId(const BookId: Integer):
      TObjectList<TCustomerReview>;
    function GetCustomerReviewById(const CustomerReviewId: Integer):
      TCustomerReview;
    procedure UpdateCustomerReview(const CustomerReview: TCustomerReview);
    procedure DeleteCustomerReview(const CustomerReviewId: Integer);
  end;

implementation

uses
  System.SysUtils;

{ TCustomerReviewService }

constructor TCustomerReviewService.Create(
  const ACustomerReviewDao: ICustomerReviewDao);
begin
  FCustomerReviewDao := ACustomerReviewDao;
end;

procedure TCustomerReviewService.CreateCustomerReview(
  const CustomerReview: TCustomerReview);
begin
  FCustomerReviewDao.Insert(CustomerReview);
end;

procedure TCustomerReviewService.DeleteCustomerReview(
  const CustomerReviewId: Integer);
begin
  FCustomerReviewDao.Delete(CustomerReviewId);
end;

function TCustomerReviewService.GetCustomerReviewById(
  const CustomerReviewId: Integer): TCustomerReview;
begin
  Result := FCustomerReviewDao.SelectWhereId(CustomerReviewId);
end;

function TCustomerReviewService.GetCustomerReviewsByBookId(
  const BookId: Integer): TObjectList<TCustomerReview>;
begin
  Result := FCustomerReviewDao.SelectWhereBookId(BookId);
end;

procedure TCustomerReviewService.UpdateCustomerReview(
  const CustomerReview: TCustomerReview);
begin
  FCustomerReviewDao.Update(CustomerReview);
end;

end.
