unit SYSCONST; //change to pascal case

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

implementation

end.
