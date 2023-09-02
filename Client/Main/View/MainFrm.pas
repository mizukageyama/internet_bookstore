unit MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  MainPresenterIntf, MainFrmIntf, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  Vcl.Bind.Grid, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.ObjectScope,
  Data.Bind.GenData, Book;

type
  TMainView = class(TForm, IMainView)
    lblTitle: TLabel;
    pnlWelcomeText: TPanel;
    lblWelcome: TLabel;
    StringGrid1: TStringGrid;
    AdapterBindSource1: TAdapterBindSource;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceAdapterBindSource1: TLinkGridToDataSource;
    procedure FormShow(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
  private
    FMainPresenter: IMainPresenter;
  public
    procedure SetPresenter(APresenter: IMainPresenter);
    procedure SetBindSourceAdapter(const BindSourceAdapter: TBindSourceAdapter);
    procedure ShowMessageDialog(const Msg: string);
    function GetSelectedBook: TBook;
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

function TMainView.GetSelectedBook: TBook;
begin
  var SelectedRow := AdapterBindSource1.Adapter.Current as TBook;
  Result := SelectedRow;
end;

procedure TMainView.SetBindSourceAdapter(
  const BindSourceAdapter: TBindSourceAdapter);
begin
  AdapterBindSource1.Adapter := BindSourceAdapter;
  AdapterBindSource1.Active := True;
end;

procedure TMainView.SetPresenter(APresenter: IMainPresenter);
begin
  FMainPresenter := APresenter;
end;

procedure TMainView.ShowMessageDialog(const Msg: string);
begin
  ShowMessage(Msg);
end;

procedure TMainView.StringGrid1DblClick(Sender: TObject);
begin
  if StringGrid1.RowCount = 0 then
    Exit;
  FMainPresenter.ShowBookDetails;
end;

end.
