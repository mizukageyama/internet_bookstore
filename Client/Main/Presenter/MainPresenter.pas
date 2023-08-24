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
  BookDetailsPresenterIntf, BookDetailsPresenter,
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
  BookId: Integer;
  BookTitle: string;
  BookSynopsis: string;

  SelectedBook: TBook;

  CustomerReviewProxy: ICustomerReviewService;
  BookDetailsPresenter: IBookDetailsPresenter;
  BookDetailsForm: TForm;
begin
  BookstoreDM := BookstoreDataModule;

  BookId := (BookstoreDM.fdmemBookId.Value);

  //Use Service
  //If Service Return is nil, then must show message dialog that book no
  //longer exists then refresh

  BookTitle := (BookstoreDM.fdmemBookTitle.Value);
  BookSynopsis := (BookstoreDM.fdmemBookSynopsis.Value);
  SelectedBook := TBook.Create(BookId, BookTitle, BookSynopsis);

  BookDetailsForm := TBookDetailsForm.Create(SelectedBook, FMainView.Self);
  CustomerReviewProxy := TCustomerReviewServiceProxy.Create;
  BookDetailsPresenter := TBookDetailsPresenter
    .Create(BookDetailsForm as TBookDetailsForm, CustomerReviewProxy);

  BookDetailsForm.Show;
end;

end.

