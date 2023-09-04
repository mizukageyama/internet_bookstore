unit StatusCodeException;

interface

uses
  System.SysUtils;

type
  EHTTPNotFoundException = class(Exception)
  public
    constructor Create(const AMsg: string);
  end;

  EHTTPForbiddenException = class(Exception)
  public
    constructor Create(const AMsg: string);
  end;

  EHTTPUnauthorizedException = class(Exception)
  public
    constructor Create(const AMsg: string);
  end;

  EHTTPBadRequestException = class(Exception)
  public
    constructor Create(const AMsg: string);
  end;

  EHTTPServerErrorException = class(Exception)
  public
    constructor Create(const AMsg: string);
  end;

implementation

{ EHTTPNotFoundException }

constructor EHTTPNotFoundException.Create(const AMsg: string);
begin
  inherited Create(AMsg);
end;

{ EHTTPForbiddenException }

constructor EHTTPForbiddenException.Create(const AMsg: string);
begin
  inherited Create(AMsg);
end;

{ EHTTPUnauthorizedException }

constructor EHTTPUnauthorizedException.Create(const AMsg: string);
begin
  inherited Create(AMsg);
end;

{ EHTTPBadRequestException }

constructor EHTTPBadRequestException.Create(const AMsg: string);
begin
  inherited Create(AMsg);
end;

{ EHTTPServerErrorException }

constructor EHTTPServerErrorException.Create(const AMsg: string);
begin
  inherited Create(AMsg);
end;

end.
