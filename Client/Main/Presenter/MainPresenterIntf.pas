unit MainPresenterIntf;

interface

uses
  System.Generics.Collections, Book;

type
  IMainPresenter = interface
    ['{2E5AC146-48AE-4342-BA34-088EE61310B5}']
    procedure LoadBooks;
    procedure ShowBookDetails;
    function GetBookList: TList<TObject>;
    function GetBookClass: TClass;
  end;

implementation

end.
