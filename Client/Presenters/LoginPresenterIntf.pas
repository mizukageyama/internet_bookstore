unit LoginPresenterIntf;

interface

type
  ILoginPresenter = interface
    procedure Login;
    procedure ValidateInput(out Username, Password: string;
      out IsSuccess: Boolean);
  end;

implementation

end.
