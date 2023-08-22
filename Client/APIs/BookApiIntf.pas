unit BookApiIntf;

interface

uses
  Book, System.Generics.Collections, MVCFramework.RESTClient.Intf,
  MVCFramework.RESTClient, JSON;

type
  IBookApi = interface
    ['{1EE2FAF5-83FA-4D4F-896F-B2F095AAF2D8}']
    function CreateBook(const RequestBody: TJSONObject): IMVCRESTResponse;
    function GetBooks: IMVCRESTResponse;
    function GetBookById(const BookId: Integer): IMVCRESTResponse;
    function UpdateBook(const RequestBody: TJSONObject): IMVCRESTResponse;
    function DeleteBook(const BookId: Integer): IMVCRESTResponse;
  end;

implementation

end.
