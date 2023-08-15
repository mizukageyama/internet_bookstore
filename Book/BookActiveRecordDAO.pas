unit BookActiveRecordDAO;

interface

uses
  Book, BookDAOIntf, MVCFramework, MVCFramework.Commons,
  MVCFramework.Serializer.Commons, MVCFramework.ActiveRecord,
  System.Generics.Collections, system.SysUtils;

type
  TBookActiveRecordDAO = class(TInterfacedObject, IBookDAO)
  public
    procedure Insert(const Book: TBook);
    function Select: TObjectList<TBook>;
    function SelectWhereId(const BookId: Integer): TBook;
    procedure Update(const BookId: Integer; const Book: TBook);
    procedure Delete(const BookId: Integer);
  end;

implementation

{ TBookActiveRecordDAO }
procedure TBookActiveRecordDAO.Insert(const Book: TBook);
begin
//  var BookAR := TBookActiveRecord.Create(Book);
//  try
//    try
//      BookAR.Insert;
//      ABook := TBook.Create(BookAR);
//    except
//      on E: Exception do
//      raise Exception.Create(Classname + ', Failed to create book: ' +
//        E.Message);
//    end;
//  finally
//    BookAR.Free;
//  end;
end;

procedure TBookActiveRecordDAO.Delete(const BookId: Integer);
begin
//  var Book := TMVCActiveRecord.GetByPK<TBook>(BookId, True);
//
//  if Book = nil then
//    raise EMVCActiveRecordNotFound.Create(Classname + ', Book not found');
//
//  try
//    Book.Delete;
//  except
//    on E: Exception do
//      raise Exception.Create(Classname + ', Failed to delete book: ' +
//        E.Message);
//  end;
end;

function TBookActiveRecordDAO.SelectWhereId(const BookId: Integer): TBook;
begin
//  Result := TMVCActiveRecord.GetOneByWhere<TBook>('ID = ?', [BookId]);
//  if Result = nil then
//    raise EMVCActiveRecordNotFound.Create(Classname + ', Book not found');
  Result := TBook.Create;
end;

function TBookActiveRecordDAO.Select: TObjectList<TBook>;
begin
//  var BookAR := TBookActiveRecord.Create;
//  try
//    BookAR.LoadByPK(ATitle);
//    ABook := TBook.Create(BookAR);
//  finally
//    BookAR.Free;
//  end;
     Result := TObjectList<TBook>.Create;

//  try
//    Result := TMVCActiveRecord.All<TBookActiveRecord>;
//  except
//    on E: Exception do
//      raise EMVCActiveRecordNotFound.Create('Classname' + ', Server Error:' +
//        E.ToString);
//  end;
end;

procedure TBookActiveRecordDAO.Update(const BookId: Integer; const Book: TBook);
begin
//  var BookById := TMVCActiveRecord.GetByPK<TBook>(BookId, True);
//
//  if BookById = nil then
//    raise EMVCActiveRecordNotFound.Create(Classname + ', Book not found');
//
//  try
//    Book.Id := BookId;
//    Book.Update;
//  except
//    on E: Exception do
//      raise Exception.Create(Classname + ', Failed to update book: ' +
//        E.Message);
//  end;
end;

end.
