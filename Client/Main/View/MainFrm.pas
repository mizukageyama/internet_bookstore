unit MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  MainPresenterIntf, MainFrmIntf, BookstoreDM;

type
  TMainView = class(TForm, IMainView)
    lblTitle: TLabel;
    dbgBooks: TDBGrid;
    pnlWelcomeText: TPanel;
    lblWelcome: TLabel;
    procedure FormShow(Sender: TObject);
    procedure dbgBooksDblClick(Sender: TObject);
  private
    FMainPresenter: IMainPresenter;
  public
    procedure SetPresenter(APresenter: IMainPresenter);
  end;

implementation

{$R *.dfm}

{ TMainForm }

procedure TMainView.FormShow(Sender: TObject);
begin
  FMainPresenter.LoadBooks;
end;

procedure TMainView.SetPresenter(APresenter: IMainPresenter);
begin
  FMainPresenter := APresenter;
end;

procedure TMainView.dbgBooksDblClick(Sender: TObject);
begin
  FMainPresenter.ShowBookDetails;
end;

end.
