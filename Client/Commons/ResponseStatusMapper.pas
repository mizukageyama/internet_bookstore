unit ResponseStatusMapper;

interface

uses
  SysConst;

type
  TResponseStatusMapper = class
  public
    class function Map(const StatusCode: Integer): TStatusCode;
  end;

implementation

{ TResponseStatusMapper }

class function TResponseStatusMapper.Map(const StatusCode: Integer):
  TStatusCode;
begin
  case StatusCode of
    200, 201, 204: Result := OK;
    400: Result := BadRequest;
    401: Result := Unauthorized;
    403: Result := Forbidden;
    404: Result := NotFound;
  else
    Result := ServerError;
  end;
end;

end.
