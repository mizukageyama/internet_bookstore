unit MainFrmIntf;

interface

uses
  MainPresenterIntf, Vcl.Forms;

type
  IMainView = interface
    ['{90EBBC97-4D42-4FAD-91D0-B74F1BE9F2B4}']
    procedure SetPresenter(APresenter: IMainPresenter);
  end;
implementation

end.
