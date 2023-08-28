unit MockBookActiveRecord;

interface

uses
  Book, BookContextIntf, MockBookMVCActiveRecord;

type
  TMockBookActiveRecord = class(TMockBookMVCActiveRecord, IBookContext)
  private
    FId: Integer;
    FTitle: string;
    FSynopsis: string;

    function GetBookId: Integer;
    procedure SetBookId(const BookId: Integer);

    function GetBookSynopsis: string;
    procedure SetBookSynopsis(const BookSypnosis: string);

    function GetBookTitle: string;
    procedure SetBookTitle(const BookTitle: string);
  public
    constructor Create; overload;
    constructor Create(const ABook: TBook); overload;

    property Id: Integer read GetBookId write SetBookId;
    property Title: string read GetBookTitle write SetBookTitle;
    property Synopsis: string read GetBookSynopsis write SetBookSynopsis;
  end;

implementation

{ TMockBookActiveRecord }

constructor TMockBookActiveRecord.Create(const ABook: TBook);
begin
  inherited Create;

  FId := ABook.Id;
  FTitle := ABook.Title;
  FSynopsis := ABook.Synopsis;
end;

constructor TMockBookActiveRecord.Create;
begin
  inherited Create;
end;

function TMockBookActiveRecord.GetBookId: Integer;
begin
  Result := FId;
end;

function TMockBookActiveRecord.GetBookSynopsis: string;
begin
  Result := FSynopsis;
end;

function TMockBookActiveRecord.GetBookTitle: string;
begin
  Result := FTitle;
end;

procedure TMockBookActiveRecord.SetBookId(const BookId: Integer);
begin
  FId := BookId;
end;

procedure TMockBookActiveRecord.SetBookSynopsis(const BookSypnosis: string);
begin
  FSynopsis := BookSypnosis;
end;

procedure TMockBookActiveRecord.SetBookTitle(const BookTitle: string);
begin
  FTitle := BookTitle;
end;

end.

