unit CustomerReviewARDaoStub;

interface

uses
  CustomerReviewDAOIntf, CustomerReview, System.Generics.Collections,
  MockCustomerReviewTableDatabase;

type
  TCustomerReviewARDaoStub = class(TInterfacedObject, ICustomerReviewDAO)
  private
    FMockDatabase: TMockCustomerReviewTableDatabase;
  public
    constructor Create(AMockDatabase: TMockCustomerReviewTableDatabase);
    procedure Insert(const CustomerReview: TCustomerReview);
    function SelectWhereBookId(const CustomerReviewBookId: Integer):
      TObjectList<TCustomerReview>;
    function SelectWhereId(const CustomerReviewId: Integer): TCustomerReview;
    procedure Update(const CustomerReview: TCustomerReview);
    procedure Delete(const CustomerReviewId: Integer);
  end;

implementation

{ TCustomerReviewARDaoStub }

constructor TCustomerReviewARDaoStub.Create(
  AMockDatabase: TMockCustomerReviewTableDatabase);
begin
  FMockDatabase := AMockDatabase;
end;

procedure TCustomerReviewARDaoStub.Delete(const CustomerReviewId: Integer);
begin
  FMockDatabase.DeleteReview(CustomerReviewId);
end;

procedure TCustomerReviewARDaoStub.Insert(
  const CustomerReview: TCustomerReview);
begin
  FMockDatabase.AddCustomerReview(CustomerReview);
end;

function TCustomerReviewARDaoStub.SelectWhereBookId(
  const CustomerReviewBookId: Integer): TObjectList<TCustomerReview>;
begin
  Result := FMockDatabase.GetReviewsByBookId(CustomerReviewBookId);
end;

function TCustomerReviewARDaoStub.SelectWhereId(
  const CustomerReviewId: Integer): TCustomerReview;
begin
  Result := FMockDatabase.GetCustomerReviewById(CustomerReviewId);
end;

procedure TCustomerReviewARDaoStub.Update(
  const CustomerReview: TCustomerReview);
begin
  FMockDatabase.UpdateReview(CustomerReview);
end;

end.
