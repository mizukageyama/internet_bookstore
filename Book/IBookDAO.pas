unit IBookDAO;

interface

uses
  System.Generics.Collections, Book;

type
  IBookDAO = interface
    procedure CreateBook(Book: TBook);
    function GetAll: TObjectList<TBook>;
    function GetById(Id: Integer): TBook;
    function Update(Book: TBook): Boolean;
    function Delete: Boolean;
  end;

implementation

end.
