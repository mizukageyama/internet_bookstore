unit CustomerReviewDAO;

interface

uses
  CustomerReview, CustomerReviewDAOIntf, MVCFramework, MVCFramework.Commons,
  MVCFramework.Serializer.Commons, MVCFramework.ActiveRecord, BaseController,
  System.Generics.Collections, system.SysUtils;

type
  TCustomerReviewDAO = class(TInterfacedObject, ICustomerReviewDAO)
    procedure CreateCustomerReview(const CustomerReview: TCustomerReview);
    function GetCustomerReviewsByBookId(const BookId: Integer):
      TObjectList<TCustomerReview>;
    procedure UpdateCustomerReview(const CustomerReviewId: Integer;
      const CustomerReview: TCustomerReview);
    procedure DeleteCustomerReview(const CustomerReviewId: Integer);
  end;

implementation

{ TCustomerReviewDAO }

procedure TCustomerReviewDAO.CreateCustomerReview(
  const CustomerReview: TCustomerReview);
begin
  try
    CustomerReview.Insert;
  except
    on E: Exception do
      raise Exception.Create(Classname + ', Failed to create review: ' +
        E.Message);
  end;
end;

procedure TCustomerReviewDAO.DeleteCustomerReview(
  const CustomerReviewId: Integer);
begin
  var CustomerReview := TMVCActiveRecord
    .GetByPK<TCustomerReview>(CustomerReviewId, True);

  if CustomerReview = nil then
    raise EMVCActiveRecordNotFound.Create(Classname +
      ', Customer review not found');

  try
    CustomerReview.Delete;
  except
    on E: Exception do
      raise Exception.Create(Classname + ', Failed to delete review: ' +
        E.Message);
  end;
end;

function TCustomerReviewDAO.GetCustomerReviewsByBookId(const BookId: Integer):
  TObjectList<TCustomerReview>;
begin
  Result := TMVCActiveRecord.Where<TCustomerReview>('BOOK_ID = ?', [BookId]);
end;

procedure TCustomerReviewDAO.UpdateCustomerReview(
  const CustomerReviewId: Integer; const CustomerReview: TCustomerReview);
begin
  var CustomerReviewById := TMVCActiveRecord
    .GetByPK<TCustomerReview>(CustomerReviewId, True);

  if CustomerReviewById = nil then
    raise EMVCActiveRecordNotFound.Create(Classname +
      ', Customer review not found');

  try
    CustomerReview.Update;
  except
    on E: Exception do
      raise Exception.Create(Classname + ', Failed to update review: ' +
        E.Message);
  end;
end;

end.

