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
    FMainView: IMainView;
    FMainService: IBookService;
  protected
    procedure LoadBooks;
    procedure ShowBookDetails;
    procedure PopulateBookTable(const Books: TObjectList<TBook>);
  public
    constructor Create(AMainView: IMainView; AMainService: IBookService);
  end;

implementation

uses
  BookDetailsPresenterIntf, BookDetailsPresenter, SYSCONST, StatusCodeException,
  CustomerReviewServiceIntf, CustomerReviewServiceProxy;

{ TMainPresenter }

constructor TMainPresenter.Create(AMainView: IMainView;
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
  SelectedBook: TBook;

  CustomerReviewServiceProxy: ICustomerReviewService;
  BookDetailsPresenter: IBookDetailsPresenter;
  BookDetailsView: TForm;
begin
  BookstoreDM := BookstoreDataModule;

  SelectedBook := TBook.Create(
    BookstoreDM.fdmemBookId.Value,
    BookstoreDM.fdMemBookTitle.Value,
    BookstoreDM.fdmemBookSynopsis.Value);

  BookDetailsView := TBookDetailsView.Create(nil);
  CustomerReviewServiceProxy := TCustomerReviewServiceProxy.Create;
  BookDetailsPresenter := TBookDetailsPresenter
    .Create(BookDetailsView as TBookDetailsView, CustomerReviewServiceProxy,
    SelectedBook);

  BookDetailsView.Show;
end;

end.

