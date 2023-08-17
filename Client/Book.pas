unit Book;

interface

type
  TBook = class
  private
    FId: Integer;
    FTitle: string;
    FSynopsis: string;
  public
    procedure SetBookId(const Value: Integer);
    procedure SetBookSynopsis(const Value: string);
    procedure SetBookTitle(const Value: string);
    property Id: Integer read FId write SetBookId;
    property Title: string read FTitle write SetBookTitle;
    property Synopsis: string read FSynopsis write SetBookSynopsis;
  end;

implementation

{ TBook }

procedure TBook.SetBookId(const Value: Integer);
begin
  FId := Value;
end;

procedure TBook.SetBookSynopsis(const Value: string);
begin
  FSynopsis := Value;
end;

procedure TBook.SetBookTitle(const Value: string);
begin
  FTitle := Value;
end;

end.
