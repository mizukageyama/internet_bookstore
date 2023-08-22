unit BookRepositoryIntf;

interface

uses
  Book, System.Generics.Collections, MVCFramework.RESTClient.Intf,
  MVCFramework.RESTClient, JSON;

type
  IBookRepository = interface
    function CreateBook(const RequestBody: TJSONObject): IMVCRESTResponse;
    function GetBooks: IMVCRESTResponse;
    function GetBookById(const BookId: Integer): IMVCRESTResponse;
    function UpdateBook(const RequestBody: TJSONObject): IMVCRESTResponse;
    function DeleteBook(const BookId: Integer): IMVCRESTResponse;
  end;

implementation

end.
