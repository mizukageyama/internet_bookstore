unit BookDAOIntf;

interface

uses
  System.Generics.Collections, Book;

type
  IBookDAO = interface
    procedure CreateBook(const Book: TBook);
    function GetBooks: TObjectList<TBook>;
    function GetBookById(const BookId: Integer): TBook;
    procedure UpdateBook(const BookId: Integer; const Book: TBook);
    procedure DeleteBook(const BookId: Integer);
  end;

implementation

end.
