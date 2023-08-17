unit MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  MVCFramework.RESTClient.Intf, MVCFramework.RESTClient,
  MVCFramework.DataSet.Utils, MVCFramework.Serializer.Commons;

type
  TMainForm = class(TForm)
    lblTitle: TLabel;
    dbgBooks: TDBGrid;
    pnlSearch: TPanel;
    Search: TButton;
    lblSearch: TLabel;
    pnlBottom: TPanel;
    edtSearchKey: TEdit;
    pnlSpace: TPanel;
    pnlWelcomeText: TPanel;
    lblWelcome: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SearchClick(Sender: TObject);
    procedure dbgBooksDblClick(Sender: TObject);
  private
    RESTClient: IMVCRESTClient;
    Loading: Boolean;
    procedure GetBooks;
    function GetSearchKey: string;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  BookstoreDM, WriteReviewFrm, BookDetailsFrm, Book;

{ TMainForm }

procedure TMainForm.dbgBooksDblClick(Sender: TObject);
begin
  Self.Hide;
  var SelectedBook := TBook.Create;
  SelectedBook.SetBookId(BookstoreDataModule.fdmemBookId.Value);
  SelectedBook.SetBookTitle(BookstoreDataModule.fdmemBookTitle.Value);
  SelectedBook.SetBookSynopsis(BookstoreDataModule.fdmemBookSynopsis.Value);
  var BookDetailsForm:=  TBookDetailsForm.Create(SelectedBook, Self);
  BookDetailsForm.Show;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  RESTClient := nil;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  RESTClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  GetBooks;
end;

procedure TMainForm.GetBooks;
var
  Resp: IMVCRESTResponse;
begin
  try
    Resp := RESTClient.Get('/api/books');
    if Resp.StatusCode = 200 then
    begin
      BookstoreDataModule.fdmemBook.Close;
      BookstoreDataModule.fdmemBook.Open;
      Loading := True;

      BookstoreDataModule.fdmemBook.LoadJSONArrayFromJSONObjectProperty('data',
        Resp.Content, TMVCNameCase.ncCamelCase);
      BookstoreDataModule.fdmemBook.First;

      Loading := True;
      RESTClient.ClearQueryParams;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('TMainForm.GetBooks: ' + E.toString);
      RESTClient.ClearQueryParams;
    end;
  end;
end;

function TMainForm.GetSearchKey: string;
begin

end;

procedure TMainForm.SearchClick(Sender: TObject);
begin
  //GetBooks;
  WriteReviewForm.Show;
end;

end.
