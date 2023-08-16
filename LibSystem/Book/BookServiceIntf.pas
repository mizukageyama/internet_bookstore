unit BookServiceIntf;

interface

uses
  Book, System.Generics.Collections;

type
  IBookService = interface
    ['{39D040CE-DB31-4ADC-8BC8-B2D8CFDB3CAE}']
    procedure CreateBook(const Book: TBook);
    function GetBooks: TObjectList<TBook>;
    function GetBookById(const BookId: Integer): TBook;
    procedure UpdateBook(const Book: TBook);
    procedure DeleteBook(const BookId: Integer);
  end;

implementation

end.
