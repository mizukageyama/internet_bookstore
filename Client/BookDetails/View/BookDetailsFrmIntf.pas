unit BookDetailsFrmIntf;

interface

uses
  BookDetailsPresenterIntf, Vcl.Forms, Book;

type
  IBookDetailsView = interface
    ['{17668FD4-DB3A-46D6-B72A-68D0E7792EC9}']
    procedure SetPresenter(APresenter: IBookDetailsPresenter);
    procedure SetBookDetails(const Book: TBook);
  end;

implementation

end.
