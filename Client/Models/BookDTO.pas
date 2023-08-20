unit BookDTO;

interface

uses
  JSON;

type
  TBook = class
  private
    FId: Integer;
    FTitle: string;
    FSynopsis: string;
  public
    constructor Create(const AId: Integer; const ATitle, ASynopsis: string);
      overload;

    function ToJSONBody: TJSONObject;

    procedure SetBookId(const BookId: Integer);
    procedure SetBookSynopsis(const BookSynopsis: string);
    procedure SetBookTitle(const BookTitle: string);

    property Id: Integer read FId write SetBookId;
    property Title: string read FTitle write SetBookTitle;
    property Synopsis: string read FSynopsis write SetBookSynopsis;
  end;

implementation

{ TBook }

constructor TBook.Create(const AId: Integer; const ATitle, ASynopsis: string);
begin
  FId := AId;
  FTitle := ATitle;
  FSynopsis := ASynopsis;
end;

procedure TBook.SetBookId(const BookId: Integer);
begin
  FId := BookId;
end;

procedure TBook.SetBookSynopsis(const BookSynopsis: string);
begin
  FSynopsis := BookSynopsis;
end;

procedure TBook.SetBookTitle(const BookTitle: string);
begin
  FTitle := BookTitle;
end;

function TBook.ToJSONBody: TJSONObject;
begin
  var JSONBody := TJSONObject.Create;
  try
    JSONBody.AddPair('Id', Id);
    JSONBody.AddPair('Title', Title);
    JSONBody.AddPair('Synopsis', Synopsis);

    Result := JSONBody;
  finally
    JSONBody.Free;
  end;
end;

end.
