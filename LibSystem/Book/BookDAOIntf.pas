unit BookDAOIntf;

interface

uses
  System.Generics.Collections, Book;

type
  IBookDAO = interface
    ['{A6BC0AA5-E144-4BDA-920B-4BC7186F9FE5}']
    procedure Insert(const Book: TBook);
    function Select: TObjectList<TBook>;
    function SelectWhereId(const BookId: Integer): TBook;
    procedure Update(const Book: TBook);
    procedure Delete(const BookId: Integer);
  end;

implementation

end.
