unit LoginFrmIntf;

interface

uses
  Vcl.Forms, LoginPresenterIntf;

type
  ILoginView = interface
    function GetUsername: string;
    function GetPassword: string;
    procedure CloseForm;
    procedure SetPresenter(APresenter: ILoginPresenter);
    procedure ShowMessageDialog(const Msg: string);
  end;

implementation

end.
