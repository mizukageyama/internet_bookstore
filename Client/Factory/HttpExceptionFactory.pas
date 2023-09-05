unit HttpExceptionFactory;

interface

uses
  System.SysUtils, ServerExceptionFactoryIntf, SysConst;

type
  THttpExceptionFactory = class(TInterfacedObject, IServerExceptionFactory)
  public
    function CreateException(const StatusCode: TStatusCode): Exception;
  end;

implementation

uses
  StatusCodeException;

{ THttpExceptionFactory }

function THttpExceptionFactory.CreateException(
  const StatusCode: TStatusCode): Exception;
begin
  case StatusCode of
    NotFound: Result := EHTTPNotFoundException.Create('Resource not found');
    UnAuthorized: Result := EHTTPUnauthorizedException
      .Create('Not authenticated');
    BadRequest: Result := EHTTPBadRequestException.Create('Invalid request');
    Forbidden: Result := EHTTPForbiddenException
      .Create('Not allowed to access this resource');
    ServerError: Result := EHTTPServerErrorException
      .Create('Internal server error');
  end;
end;

end.
