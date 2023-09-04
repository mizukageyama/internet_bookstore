unit StatusCodeException;

interface

uses
  System.SysUtils;

type
  ENotFoundStatusCodeException = class(Exception)
  public
    constructor Create(const AMsg: string);
  end;

  EForbiddenStatusCodeException = class(Exception)
  public
    constructor Create(const AMsg: string);
  end;

  EUnauthorizedStatusCodeException = class(Exception)
  public
    constructor Create(const AMsg: string);
  end;

  EBadRequestStatusCodeException = class(Exception)
  public
    constructor Create(const AMsg: string);
  end;

  EServerErrorStatusCodeException = class(Exception)
  public
    constructor Create(const AMsg: string);
  end;

implementation

{ ENotFoundStatusCodeException }

constructor ENotFoundStatusCodeException.Create(const AMsg: string);
begin
  inherited Create(AMsg);
end;

{ EForbiddenStatusCodeException }

constructor EForbiddenStatusCodeException.Create(const AMsg: string);
begin
  inherited Create(AMsg);
end;

{ EUnauthorizedStatusCodeException }

constructor EUnauthorizedStatusCodeException.Create(const AMsg: string);
begin
  inherited Create(AMsg);
end;

{ EBadRequestStatusCodeException }

constructor EBadRequestStatusCodeException.Create(const AMsg: string);
begin
  inherited Create(AMsg);
end;

{ EServerErrorStatusCodeException }

constructor EServerErrorStatusCodeException.Create(const AMsg: string);
begin
  inherited Create(AMsg);
end;

end.
