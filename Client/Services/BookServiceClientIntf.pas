unit BookServiceClientIntf;

interface

uses
  Book, System.Generics.Collections;

type
  IBookServiceClient = interface
    ['{2D8683E4-E6BC-4326-A0FD-900064145F80}']
    function CreateBook(const Book: TBook): string;
    function GetBooks: string;
    function GetBookById(const BookId: Integer): string;
    function UpdateBook(const Book: TBook): string;
    function DeleteBook(const BookId: Integer): string;
  end;

implementation

end.
