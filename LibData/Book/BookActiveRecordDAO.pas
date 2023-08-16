unit BookActiveRecordDAO;

interface

uses
  Book, BookDAOIntf, MVCFramework, MVCFramework.Commons,
  MVCFramework.ActiveRecord, System.Generics.Collections, System.SysUtils;

type
  TBookActiveRecordDAO = class(TInterfacedObject, IBookDAO)
  public
    procedure Insert(const Book: TBook);
    function Select: TObjectList<TBook>;
    function SelectWhereId(const BookId: Integer): TBook;
    procedure Update(const Book: TBook);
    procedure Delete(const BookId: Integer);
  end;

implementation

uses
  BookActiveRecord, BookContextIntf;

{ TBookActiveRecordDAO }

procedure TBookActiveRecordDAO.Insert(const Book: TBook);
begin
  var BookAR := TBookActiveRecord.Create(Book);
  try
    BookAR.Insert;
  finally
    BookAR.Free;
  end;
end;

procedure TBookActiveRecordDAO.Delete(const BookId: Integer);
begin
  var BookAR := TBookActiveRecord.Create;
  try
    BookAR.Id := BookId;
    BookAR.Delete(True);
  finally
    BookAR.Free;
  end;
end;

function TBookActiveRecordDAO.SelectWhereId(const BookId: Integer): TBook;
begin
  var BookAR := TBookActiveRecord.Create;
  try
    if not BookAR.LoadByPK(BookId) then
      raise EMVCActiveRecordNotFound.Create(Classname + ': Book with ' + 
        'ID ' + BookId.ToString + ' not found');
	
    var Book := TBook.Create(BookAR);
    Result := Book;
  finally
    BookAR.Free;
  end;
end;

function TBookActiveRecordDAO.Select: TObjectList<TBook>;
begin
  var BookAR := TBookActiveRecord.Create;
  var ARList := BookAR.All(TBookActiveRecord);
  var BookList := TObjectList<TBook>.Create;

  for var ARItem in ARList do
  begin
    var BookContext := ARItem As TBookActiveRecord;
    var Book := TBook.Create(BookContext);
    BookList.Add(Book);
  end;

  Result := BookList;
end;

procedure TBookActiveRecordDAO.Update(const Book: TBook);
begin
  var BookAR := TBookActiveRecord.Create(Book);
  try
    BookAR.Update(True);
  finally
    BookAR.Free;
  end;
end;

end.
