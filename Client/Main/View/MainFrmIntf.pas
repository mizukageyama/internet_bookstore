unit MainFrmIntf;

interface

uses
  MainPresenterIntf, Book, Vcl.Forms, Data.Bind.ObjectScope;

type
  IMainView = interface
    ['{90EBBC97-4D42-4FAD-91D0-B74F1BE9F2B4}']
    procedure SetPresenter(APresenter: IMainPresenter);
    procedure SetBindSourceAdapter(const Value: TBindSourceAdapter);
    function Self: TForm;
    procedure ShowMessageDialog(const Msg: string);
    function GetSelectedBook: TBook;
  end;
implementation

end.
