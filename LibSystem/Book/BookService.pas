unit BookService;

interface

uses
  BookServiceIntf, Book, BookDaoIntf, System.Generics.Collections;

type
  TBookService = class(TInterfacedObject, IBookService)
  private
    FBookDao: IBookDao;
  public
    constructor Create(const ABookDao: IBookDao);

    procedure CreateBook(const Book: TBook);
    function GetBooks: TObjectList<TBook>;
    function GetBookById(const BookId: Integer): TBook;
    procedure UpdateBook(const Book: TBook);
    procedure DeleteBook(const BookId: Integer);
  end;

implementation

uses
  System.SysUtils;

{ TBookService }

constructor TBookService.Create(const ABookDao: IBookDao);
begin
  if not Assigned(ABookDao) then
    raise EArgumentNilException.Create('ABookDao');

  inherited Create;
  FBookDao := ABookDao;
end;

procedure TBookService.CreateBook(const Book: TBook);
begin
  FBookDao.Insert(Book);
end;

procedure TBookService.DeleteBook(const BookId: Integer);
begin
  FBookDao.Delete(BookId);
end;

function TBookService.GetBooks: TObjectList<TBook>;
begin
  Result := FBookDao.Select;
end;

function TBookService.GetBookById(const BookId: Integer): TBook;
begin
  Result := FBookDao.SelectWhereId(BookId);
end;

procedure TBookService.UpdateBook(const Book: TBook);
begin
//  if not Book.IsValid then
//  begin
//    Render(HTTP_STATUS.BadRequest, 'Invalid request data');
//    Exit;
//  end;

  FBookDao.Update(Book);
end;

end.
