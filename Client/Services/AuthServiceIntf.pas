unit AuthServiceIntf;

interface

type
  IAuthService = interface
    ['{6B95ADE1-136F-464A-AF6B-271251176B64}']
    function LoginCustomer(const Username, Password: string): string;
  end;

implementation

end.
