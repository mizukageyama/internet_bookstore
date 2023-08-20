unit CustomerReviewRepositoryIntf;

interface

uses
  System.Generics.Collections, MVCFramework.RESTClient.Intf,
  MVCFramework.RESTClient, JSON;

type
  ICustomerReviewRepository = interface
    function CreateReview(const RequestBody: TJSONObject): IMVCRESTResponse;
    function GetReviewsByBookId(const BookId: Integer): IMVCRESTResponse;
    function GetReviewById(const ReviewId: Integer): IMVCRESTResponse;
    function UpdateReview(const RequestBody: TJSONObject): IMVCRESTResponse;
    function DeleteReview(const ReviewId: Integer): IMVCRESTResponse;
  end;

implementation

end.
