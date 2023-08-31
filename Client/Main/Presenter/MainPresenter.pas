unit MainPresenter;

interface

uses
  MainPresenterIntf, BookServiceIntf, MainFrmIntf, System.SysUtils,
  Vcl.Dialogs, MVCFramework.DataSet.Utils, MVCFramework.Serializer.Commons,
  BookstoreDM, Book, BookDetailsFrm, System.Variants,
  System.Generics.Collections, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms;

type
  TMainPresenter = class(TInterfacedObject, IMainPresenter)
  private
    FMainView: IMainFrm;
    FMainService: IBookService;
  protected
    procedure LoadBooks;
    procedure ShowBookDetails;
    procedure PopulateBookTable(const Books: TObjectList<TBook>);
  public
    constructor Create(AMainView: IMainFrm; AMainService: IBookService);
  end;

implementation

uses
  BookDetailsPresenterIntf, BookDetailsPresenter, SYSCONST, StatusCodeException,
  CustomerReviewServiceIntf, CustomerReviewServiceProxy;

{ TMainPresenter }

constructor TMainPresenter.Create(AMainView: IMainFrm;
  AMainService: IBookService);
begin
  FMainView := AMainView;
  FMainService := AMainService;
  FMainView.SetPresenter(Self);
end;

procedure TMainPresenter.LoadBooks;
begin
  try
    var Books := FMainService.GetBooks;
    PopulateBookTable(Books);
  except
    on E: Exception do
    begin
      ShowMessage(E.ToString);
    end;
  end;
end;

procedure TMainPresenter.PopulateBookTable(const Books: TObjectList<TBook>);
begin
  var BookstoreDM := BookstoreDataModule;
  BookstoreDM.fdmemBook.Close;
  BookstoreDM.fdmemBook.Open;

 for var Book in Books do
  begin
    BookstoreDM.fdmemBook.Append;
    BookstoreDM.fdmemBook.FieldByName('Id').AsInteger := Book.Id;
    BookstoreDM.fdmemBook.FieldByName('Title').AsString := Book.Title;
    BookstoreDM.fdmemBook.FieldByName('Synopsis').AsString := Book.Synopsis;
    BookstoreDM.fdmemBook.Post;
  end;

  BookstoreDM.fdmemBook.First;
end;

procedure TMainPresenter.ShowBookDetails;
var
  BookstoreDM: TBookstoreDataModule;
  SelectedBookId: Integer;
  SelectedBook: TBook;

  CustomerReviewServiceProxy: ICustomerReviewService;
  BookDetailsPresenter: IBookDetailsPresenter;
  BookDetailsForm: TForm;
begin
  BookstoreDM := BookstoreDataModule;
  SelectedBookId := (BookstoreDM.fdmemBookId.Value);

  try
    SelectedBook := FMainService.GetBookById(SelectedBookId);
  except
    on E: TStatusCodeException do
      begin
        case E.StatusCode of
          NotFound:
            begin
              ShowMessage('Book no longer exists');
              LoadBooks;
            end;
        else
          ShowMessage(E.ToString);
        end;
        Exit;
      end;
  end;

  BookDetailsForm := TBookDetailsForm.Create(nil);
  CustomerReviewServiceProxy := TCustomerReviewServiceProxy.Create;
  BookDetailsPresenter := TBookDetailsPresenter
    .Create(BookDetailsForm as TBookDetailsForm, CustomerReviewServiceProxy,
    SelectedBook);

  BookDetailsForm.Show;
end;

end.

