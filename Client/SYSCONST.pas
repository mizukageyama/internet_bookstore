unit SYSCONST;

interface

type
  TStatusCode = (
    OK,
    ServerError,
    NotFound,
    Forbidden,
    Unauthorized,
    BadRequest
  );

  var StatusCode: TStatusCode;

implementation

end.
