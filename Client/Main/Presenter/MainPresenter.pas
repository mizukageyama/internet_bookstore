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
    FCurrentPage: Integer;
  protected
    procedure LoadBooks;
    procedure ShowBookDetails;
    procedure PopulateBookTable(const Books: TObjectList<TBook>);
  public
    constructor Create(AMainView: IMainFrm; AMainService: IBookService);
  end;

implementation

uses
  BookDetailsPresenterIntf, BookDetailsPresenter,
  CustomerReviewServiceIntf, CustomerReviewServiceProxy;

{ TMainPresenter }

constructor TMainPresenter.Create(AMainView: IMainFrm;
  AMainService: IBookService);
begin
  FMainView := AMainView;
  FMainService := AMainService;
  FMainView.SetPresenter(Self);
  FCurrentPage := 1;
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
  BookId: Integer;
  BookTitle: string;
  BookSynopsis: string;

  SelectedBook: TBook;

  CustomerReviewService: ICustomerReviewService;
  BookDetailsPresenter: IBookDetailsPresenter;
  BookDetailsForm: TForm;
begin
  BookstoreDM := BookstoreDataModule;

  BookId := (BookstoreDM.fdmemBookId.Value);
  BookTitle := (BookstoreDM.fdmemBookTitle.Value);
  BookSynopsis := (BookstoreDM.fdmemBookSynopsis.Value);
  SelectedBook := TBook.Create(BookId, BookTitle, BookSynopsis);

  BookDetailsForm := TBookDetailsForm.Create(SelectedBook, FMainView.Self);
  CustomerReviewService := TCustomerReviewServiceProxy.Create;
  BookDetailsPresenter := TBookDetailsPresenter
    .Create(BookDetailsForm as TBookDetailsForm, CustomerReviewService);

  BookDetailsForm.Show;
end;

end.

