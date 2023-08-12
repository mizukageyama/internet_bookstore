unit CustomerReviewDAO;

interface

uses
  CustomerReview, CustomerReviewDAOIntf, MVCFramework, MVCFramework.Commons,
  MVCFramework.Serializer.Commons, MVCFramework.ActiveRecord, BaseController,
  System.Generics.Collections, system.SysUtils;

type
  TCustomerReviewDAO = class(TInterfacedObject, ICustomerReviewDAO)
    procedure CreateCustomerReview(const CustomerReview: TCustomerReview);
    function GetCustomerReviewsByBookId: TObjectList<TCustomerReview>;
    procedure UpdateCustomerReview(const CustomerReviewId: Integer;
      const CustomerReview: TCustomerReview);
    procedure DeleteCustomerReview(const CustomerReviewId: Integer);
  end;

implementation

{ TCustomerReviewDAO }

procedure TCustomerReviewDAO.CreateCustomerReview(
  const CustomerReview: TCustomerReview);
begin

end;

procedure TCustomerReviewDAO.DeleteCustomerReview(
  const CustomerReviewId: Integer);
begin

end;

function TCustomerReviewDAO.GetCustomerReviewsByBookId: TObjectList<TCustomerReview>;
begin

end;

procedure TCustomerReviewDAO.UpdateCustomerReview(
  const CustomerReviewId: Integer; const CustomerReview: TCustomerReview);
begin

end;

end.

