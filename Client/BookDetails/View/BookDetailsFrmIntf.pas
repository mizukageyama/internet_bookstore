unit BookDetailsFrmIntf;

interface

uses
  BookDetailsPresenterIntf, Book;

type
  IBookDetailsView = interface
    ['{17668FD4-DB3A-46D6-B72A-68D0E7792EC9}']
    procedure SetPresenter(APresenter: IBookDetailsPresenter);
    procedure SetBookDetails(const Book: TBook);
    procedure Show;
  end;

implementation

end.
