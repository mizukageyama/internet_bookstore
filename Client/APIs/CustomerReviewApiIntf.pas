unit CustomerReviewApiIntf;

interface

uses
  System.Generics.Collections, MVCFramework.RESTClient.Intf,
  MVCFramework.RESTClient, JSON;

type
  ICustomerReviewApi = interface
    ['{89CEF9E6-CA69-49DA-B6A6-A58CF85FE5C9}']
    function CreateReview(const RequestBody: string): IMVCRESTResponse;
    function GetReviewsByBookId(const BookId: Integer): IMVCRESTResponse;
    function GetReviewById(const ReviewId: Integer): IMVCRESTResponse;
    function UpdateReview(const RequestBody: string): IMVCRESTResponse;
    function DeleteReview(const ReviewId: Integer): IMVCRESTResponse;
  end;

implementation

end.