unit StatusCodeException;

interface

uses
  SYSCONST, System.SysUtils;

type
  TStatusCodeException = class(Exception)
  private
    FStatusCode: TStatusCode;
  public
    constructor Create(AStatusCode: TStatusCode; const Msg: string);
    property StatusCode: TStatusCode read FStatusCode;
  end;

implementation

constructor TStatusCodeException.Create(AStatusCode: TStatusCode;
  const Msg: string);
begin
  inherited Create(Msg);
  FStatusCode := AStatusCode;
end;

end.
