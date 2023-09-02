unit StatusCodeException;

interface

uses
  SYSCONST, System.SysUtils;

type
  TStatusCodeException = class(Exception)
  private
    FStatusCode: TStatusCode;
  public
    constructor Create(AStatusCode: TStatusCode; const AMsg: string);
    property StatusCode: TStatusCode read FStatusCode;
  end;

implementation

constructor TStatusCodeException.Create(AStatusCode: TStatusCode;
  const AMsg: string);
begin
  inherited Create(AMsg);
  FStatusCode := AStatusCode;
end;

end.
