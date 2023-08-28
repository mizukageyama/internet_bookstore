unit CustomerReviewActiveRecordServiceStub;

interface

uses
  CustomerReviewDAOIntf, CustomerReview, System.Generics.Collections,
  MockCustomerReviewTableDatabase;

type
  TCustomerReviewARServiceStub = class(TInterfacedObject, ICustomerReviewDAO)
  private
    FMockDatabase: TMockCustomerReviewTableDatabase;
    procedure CreateCustomerReview(const CustomerReview: TCustomerReview);
    procedure DeleteCustomerReview(const CustomerReviewId: Integer);
    function GetCustomerReviewById(
      const CustomerReviewId: Integer): TCustomerReview;
    function GetCustomerReviewsByBookId(
      const BookId: Integer): TObjectList<TCustomerReview>;
    procedure UpdateCustomerReview(const CustomerReview: TCustomerReview);
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


{ TCustomerReviewARServiceStub }

constructor TCustomerReviewARServiceStub.Create(
  AMockDatabase: TMockCustomerReviewTableDatabase);
begin
  FMockDatabase := AMockDatabase;
end;

end.
