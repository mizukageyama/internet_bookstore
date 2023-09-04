unit LoginFrmIntf;

interface

uses
  LoginPresenterIntf;

type
  ILoginView = interface
    function GetUsername: string;
    function GetPassword: string;
    procedure CloseForm;
    procedure SetPresenter(APresenter: ILoginPresenter);
    procedure ShowMessageDialog(const Msg: string);
    procedure Show;
  end;

implementation

end.
