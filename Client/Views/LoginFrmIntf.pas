unit LoginFrmIntf;

interface

uses
  Vcl.Forms, LoginPresenterIntf;

type
  ILoginForm = interface
    function GetUsername: string;
    function GetPassword: string;
    procedure HideForm;
    procedure ShowForm;
    procedure CloseForm;
    function Self: TForm;
    procedure SetPresenter(APresenter: ILoginPresenter);
  end;

implementation

end.
