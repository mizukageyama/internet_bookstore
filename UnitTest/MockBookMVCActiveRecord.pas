unit MockBookMVCActiveRecord;

interface

uses
  MockBookActiveRecord, Book, System.Generics.Collections, System.SysUtils,
  BookContextIntf;

type
  TMockBookMVCActiveRecord = class
  private
    class var MockDatabase: TDictionary<Integer, TMockBookActiveRecord>;
    class var NextMockID: Integer;
  protected
    function QueryInterface(const IID: TGUID; out Obj): HRESULT; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  public
    constructor Create;
    destructor Destroy;
    class procedure MockInsert;
    class procedure MockDelete(RaiseException: Boolean);
    class function MockLoadByPK(BookId: Integer): Boolean;
    class function MockLoadByBookTitle(BookTitle: string): Boolean;
    class function MockAll: TArray<TMockBookActiveRecord>;
    procedure MockUpdate(RaiseException: Boolean);
  end;

implementation

{ TMockBookMVCActiveRecord }

constructor TMockBookMVCActiveRecord.Create;
begin
  MockDatabase := TDictionary<Integer, TMockBookActiveRecord>.Create;
  NextMockID := 1;

  var Book1 := TBook.Create(NextMockID, 'The Great Adventure',
    'In a world of magic and mystery, a young hero embarks on a quest to ' +
    'save the realm from an ancient evil that threatens to engulf ' +
    'everything in darkness.');
  MockDatabase.Add(NextMockID, TMockBookActiveRecord.Create(Book1));
  Inc(NextMockID);

  var Book2 := TBook.Create(NextMockID, 'Love in the Rain',
    'A heartwarming tale of two souls who find each other amidst the pouring ' +
    'rain, navigating life''s challenges together and discovering the true ' +
    'meaning of love.');
  MockDatabase.Add(NextMockID, TMockBookActiveRecord.Create(Book2));
  Inc(NextMockID);

  var Book3 := TBook.Create(NextMockID, 'Murder at Midnight',
    'In a sleepy town, a series of mysterious murders unfolds, and an ' +
    'unlikely detective must unravel the clues hidden within the shadows of ' +
    'the night to catch the cunning killer.');
  MockDatabase.Add(NextMockID, TMockBookActiveRecord.Create(Book2));
  Inc(NextMockID);

  var Book4 := TBook.Create(NextMockID, 'The Enchanted Garden',
    'A whimsical story set in a magical garden where plants come to life and ' +
    'creatures of folklore roam. When an ordinary girl stumbles upon this ' +
    'enchanted world, she must protect it from a dark enchantress.');
  MockDatabase.Add(NextMockID, TMockBookActiveRecord.Create(Book2));
  Inc(NextMockID);
end;

destructor TMockBookMVCActiveRecord.Destroy;
begin
  MockDatabase.Free;
end;

class procedure TMockBookMVCActiveRecord.MockInsert;
begin
  var Book := TMockBookActiveRecord(Self);

  Book.Id := NextMockID;
  MockDatabase.Add(Book.Id, Book);
  Inc(NextMockID);
end;

class procedure TMockBookMVCActiveRecord.MockDelete(RaiseException: Boolean);
begin
  var BookId := TMockBookActiveRecord(Self).Id;

  if not MockDatabase.ContainsKey(BookId) then
    raise Exception.Create('Book not found in database');

  MockDatabase.Remove(BookId);
end;

class function TMockBookMVCActiveRecord.MockLoadByBookTitle(
  BookTitle: string): Boolean;
begin
  for var Book in MockDatabase.Values do
  begin
    if Book.Title = BookTitle then
    begin
      Result := True;
      Break;
    end;
  end;

  Result := False;
end;

class function TMockBookMVCActiveRecord.MockLoadByPK(BookId: Integer): Boolean;
begin
  Result := MockDatabase.ContainsKey(BookId);
end;

class function TMockBookMVCActiveRecord.MockAll: TArray<TMockBookActiveRecord>;
begin
  Result := MockDatabase.Values.ToArray;
end;

procedure TMockBookMVCActiveRecord.MockUpdate(RaiseException: Boolean);
begin
  var Book := TMockBookActiveRecord(Self);

  if not MockDatabase.ContainsKey(Book.Id) then
    raise Exception.Create('Book not found in database');

  MockDatabase[Book.Id] := Book;
end;

function TMockBookMVCActiveRecord.QueryInterface(const IID: TGUID;
  out Obj): HRESULT;
begin
  Result := -1;
end;

function TMockBookMVCActiveRecord._AddRef: Integer;
begin
  Result := -1;
end;

function TMockBookMVCActiveRecord._Release: Integer;
begin
  Result := -1;
end;

end.

