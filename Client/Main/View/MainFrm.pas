unit MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  MainPresenterIntf, MainFrmIntf, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  Vcl.Bind.Grid, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.ObjectScope,
  Data.Bind.GenData;

type
  TMainView = class(TForm, IMainView)
    TitleLabel: TLabel;
    WelcomeTextPanel: TPanel;
    lblWelcome: TLabel;
    BookListGrid: TStringGrid;
    BookAdapterBindSource: TAdapterBindSource;
    BookBindingsList: TBindingsList;
    LinkGridToDataSourceAdapterBindSource1: TLinkGridToDataSource;
    procedure FormShow(Sender: TObject);
    procedure BookListGridDblClick(Sender: TObject);
  private
    FMainPresenter: IMainPresenter;
  public
    procedure SetPresenter(APresenter: IMainPresenter);
    procedure SetBindSourceAdapter(const BindSourceAdapter: TBindSourceAdapter);
    procedure ShowMessageDialog(const Msg: string);
    function GetSelectedBook: TObject;
  end;

implementation

{$R *.dfm}

{ TMainForm }

uses
  System.Generics.Collections;

procedure TMainView.FormShow(Sender: TObject);
begin
  FMainPresenter.LoadBooks;
end;

function TMainView.GetSelectedBook: TObject;
begin
  var SelectedRow := BookAdapterBindSource.Adapter.Current;
  Result := SelectedRow;
end;

procedure TMainView.SetBindSourceAdapter(
  const BindSourceAdapter: TBindSourceAdapter);
begin
  BookAdapterBindSource.Adapter := BindSourceAdapter;
  BookAdapterBindSource.Active := True;
end;

procedure TMainView.SetPresenter(APresenter: IMainPresenter);
begin
  FMainPresenter := APresenter;
end;

procedure TMainView.ShowMessageDialog(const Msg: string);
begin
  ShowMessage(Msg);
end;

procedure TMainView.BookListGridDblClick(Sender: TObject);
begin
  if BookListGrid.RowCount = 0 then
    Exit;
  FMainPresenter.ShowBookDetails;
end;

end.
