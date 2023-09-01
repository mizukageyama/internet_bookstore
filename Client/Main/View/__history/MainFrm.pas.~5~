unit MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  MainPresenterIntf, MainFrmIntf;

type
  TMainForm = class(TForm, IMainFrm)
    lblTitle: TLabel;
    dbgBooks: TDBGrid;
    pnlWelcomeText: TPanel;
    lblWelcome: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgBooksDblClick(Sender: TObject);
  protected
    FPresenter: IMainPresenter;
    procedure HideForm;
    procedure ShowForm;
    function Self: TForm;
  public
    procedure SetPresenter(APresenter: IMainPresenter);
  end;

implementation

{$R *.dfm}

{ TMainForm }

procedure TMainForm.SetPresenter(APresenter: IMainPresenter);
begin
  FPresenter := APresenter;
end;

procedure TMainForm.ShowForm;
begin
  Self.Show;
end;

procedure TMainForm.dbgBooksDblClick(Sender: TObject);
begin
  FPresenter.ShowBookDetails;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FPresenter := nil;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  FPresenter.LoadBooks;
end;

procedure TMainForm.HideForm;
begin
  Self.Hide;
end;

function TMainForm.Self: TForm;
begin
  Result := Self;
end;

end.
