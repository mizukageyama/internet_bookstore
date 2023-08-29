unit ResponseHandler;

interface

uses
  SYSCONST;

type
  TResponseHandler = class
  public
    class function Result(const StatusCode: Integer): TStatusCode;
  end;

implementation

{ TResponseHandler }

class function TResponseHandler.Result(const StatusCode: Integer): TStatusCode;
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
