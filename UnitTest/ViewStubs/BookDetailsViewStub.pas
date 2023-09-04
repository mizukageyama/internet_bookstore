unit BookDetailsViewStub;

interface

uses
  BookDetailsFrmIntf, BookDetailsPresenterIntf, Book;

type
  TBookDetailsViewStub = class(TInterfacedObject, IBookDetailsView)
  private
    FPresenter: IBookDetailsPresenter;
    FBookDisplayed: TBook;
    FShown: Boolean;
  public
    procedure SetPresenter(APresenter: IBookDetailsPresenter);
    procedure SetBookDetails(const Book: TBook);
    procedure Show;

    property Book: TBook read FBookDisplayed;
    property Presenter: IBookDetailsPresenter read FPresenter;
    property IsShown: Boolean read FShown;
  end;
implementation

{ TBookDetailsViewStub }

procedure TBookDetailsViewStub.SetBookDetails(const Book: TBook);
begin
  FBookDisplayed := Book;
end;

procedure TBookDetailsViewStub.SetPresenter(APresenter: IBookDetailsPresenter);
begin
  FPresenter := APresenter;
end;

procedure TBookDetailsViewStub.Show;
begin
  FShown := True;
end;

end.
