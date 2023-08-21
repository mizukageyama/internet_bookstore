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
    pnlBottom: TPanel;
    pnlWelcomeText: TPanel;
    lblWelcome: TLabel;
    lblPageInfo: TLabel;
    btnNext: TButton;
    btnPrev: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgBooksDblClick(Sender: TObject);
  protected
    FPresenter: IMainPresenter;
    procedure SetPageInfo(CurrentPage, TotalPage: Integer);
    procedure SetNoResult;
    procedure EnablePrevButton;
    procedure DisablePrevButton;
    procedure EnableNextButton;
    procedure DisableNextButton;
    procedure PopulateTable(JSONData: string);
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

procedure TMainForm.DisableNextButton;
begin
  btnNext.Enabled := False;
end;

procedure TMainForm.DisablePrevButton;
begin
  btnPrev.Enabled := False;
end;

procedure TMainForm.EnableNextButton;
begin
  btnNext.Enabled := True;
end;

procedure TMainForm.EnablePrevButton;
begin
  btnPrev.Enabled := True;
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

procedure TMainForm.PopulateTable(JSONData: string);
begin

end;

function TMainForm.Self: TForm;
begin
  Result := Self;
end;

procedure TMainForm.SetNoResult;
begin
  lblPageInfo.Caption := 'No result';
end;

procedure TMainForm.SetPageInfo(CurrentPage, TotalPage: Integer);
begin
  lblPageInfo.Caption := Format('Page %d out of %d', [CurrentPage, TotalPage]);
end;

end.
