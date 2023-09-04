unit MainFrmIntf;

interface

uses
  MainPresenterIntf, Data.Bind.ObjectScope;

type
  IMainView = interface
    ['{90EBBC97-4D42-4FAD-91D0-B74F1BE9F2B4}']
    procedure Show;
    procedure SetPresenter(APresenter: IMainPresenter);
    procedure ShowMessageDialog(const Msg: string);
    function GetSelectedBook: TObject;
  end;
implementation

end.
