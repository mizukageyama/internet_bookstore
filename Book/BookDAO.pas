unit BookDAO;

interface

uses
  Book, BookDAOIntf, MVCFramework, MVCFramework.Commons,
  MVCFramework.Serializer.Commons, MVCFramework.ActiveRecord, BaseController,
  System.Generics.Collections, system.SysUtils;

type
  TBookDAO = class(TInterfacedObject, IBookDAO)
  public
    procedure CreateBook(const Book: TBook);
    function GetBooks: TObjectList<TBook>;
    function GetBookById(const BookId: Integer): TBook;
    procedure UpdateBook(const BookId: Integer; const Book: TBook);
    procedure DeleteBook(const BookId: Integer);
  end;

implementation

{ TBookDAO }
procedure TBookDAO.CreateBook(const Book: TBook);
begin
  try
    Book.Insert;
  except
    on E: Exception do
      raise Exception.Create(Classname + ', Failed to create book: ' +
        E.Message);
  end;
end;

procedure TBookDAO.DeleteBook(const BookId: Integer);
begin
  var Book := TMVCActiveRecord.GetByPK<TBook>(BookId, True);

  if Book = nil then
    raise EMVCActiveRecordNotFound.Create(Classname + ', Book not found');

  try
    Book.Delete;
  except
    on E: Exception do
      raise Exception.Create(Classname + ', Failed to delete book: ' +
        E.Message);
  end;
end;

function TBookDAO.GetBookById(const BookId: Integer): TBook;
begin
  Result := TMVCActiveRecord.GetOneByWhere<TBook>('ID = ?', [BookId]);
  if Result = nil then
    raise EMVCActiveRecordNotFound.Create(Classname + ', Book not found');
end;

function TBookDAO.GetBooks: TObjectList<TBook>;
begin
  try
    Result := TMVCActiveRecord.All<TBook>;
  except
    on E: Exception do
      raise EMVCActiveRecordNotFound.Create(Classname + ', Server Error:' +
        E.ToString);
  end;
end;

procedure TBookDAO.UpdateBook(const BookId: Integer; const Book: TBook);
begin
  var BookById := TMVCActiveRecord.GetByPK<TBook>(BookId, True);

  if BookById = nil then
    raise EMVCActiveRecordNotFound.Create(Classname + ', Book not found');

  try
    Book.Update;
  except
    on E: Exception do
      raise Exception.Create(Classname + ', Failed to update book: ' +
        E.Message);
  end;
end;

end.
