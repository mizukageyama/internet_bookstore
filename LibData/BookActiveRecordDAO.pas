unit BookActiveRecordDAO;

interface

uses
  Book, BookDAOIntf, MVCFramework, MVCFramework.Commons,
  MVCFramework.ActiveRecord, System.Generics.Collections, system.SysUtils,
  MVCFramework.SQLGenerators.MySQL;

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



uses
  BookActiveRecord, BookContextIntf;

{ TBookDAO }

procedure TBookActiveRecordDAO.Insert(const Book: TBook);
begin
//  try
//    Book.Insert;
//  except
//    on E: Exception do
//      raise Exception.Create(Classname + ', Failed to create book: ' +
//        E.Message);
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
  var BookARObj := TBookActiveRecord.Create;
  var BookAR := BookARObj.GetByPK(TBookActiveRecord, BookId);

  if BookAR = nil then
    raise EMVCActiveRecordNotFound.Create(Classname + ', Book not found');

  var Book := TBook.Create(BookAR as TBookActiveRecord);
  Result := Book;
end;

function TBookActiveRecordDAO.Select: TObjectList<TBook>;
begin
  try
    var BookARObj := TBookActiveRecord.Create;
    var ARList := BookARObj.All(TBookActiveRecord);
    var BookList := TObjectList<TBook>.Create;

    for var ARItem in ARList do
    begin
      var BookContext := ARItem As TBookActiveRecord;
      var Book := TBook.Create(BookContext);
      BookList.Add(Book);
    end;

    Result := BookList;
  except
    on E: Exception do
      raise EMVCActiveRecordNotFound.Create(Classname + ', Server Error:' +
        E.ToString);
  end;
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
