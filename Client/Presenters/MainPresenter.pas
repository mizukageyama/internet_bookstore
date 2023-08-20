unit MainPresenter;

interface

uses
  MainPresenterIntf, BookServiceClientIntf, MainFrmIntf, System.SysUtils,
  Vcl.Dialogs, MVCFramework.DataSet.Utils, MVCFramework.Serializer.Commons,
  BookstoreDM, BookDTO, BookDetailsFrm, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms;

type
  TMainPresenter = class(TInterfacedObject, IMainPresenter)
  private
    FMainView: IMainFrm;
    FMainService: IBookServiceClient;
  protected
    procedure LoadBooks;
    procedure ShowBookDetails;
    procedure PopulateBookTable(JSONData: string);
  public
    constructor Create(AMainView: IMainFrm; AMainService: IBookServiceClient);
  end;

implementation

uses
  CustomerReviewRepositoryIntf, CustomerReviewRepository,
  BookDetailsPresenterIntf, BookDetailsPresenter,
  CustomerReviewServiceClientIntf, CustomerReviewServiceclient;

{ TMainPresenter }

constructor TMainPresenter.Create(AMainView: IMainFrm;
  AMainService: IBookServiceClient);
begin
  FMainView := AMainView;
  FMainService := AMainService;
  FMainView.SetPresenter(Self);
end;

procedure TMainPresenter.LoadBooks;
begin
  try
    var ResponseContent := FMainService.GetBooks;
    PopulateBookTable(ResponseContent);
    FMainView.EnablePrevButton;
    FMainView.EnableNextButton;
    FMainView.SetPageInfo(1, 4);
  except
    on E: Exception do
    begin
      ShowMessage(E.ToString);
      FMainView.DisablePrevButton;
      FMainView.DisableNextButton;
      FMainView.SetNoResult;
    end;
  end;
end;

procedure TMainPresenter.PopulateBookTable(JSONData: string);
begin
  var BookstoreDM := BookstoreDataModule;
  BookstoreDM.fdmemBook.Close;
  BookstoreDM.fdmemBook.Open;
  BookstoreDM.fdmemBook.LoadJSONArrayFromJSONObjectProperty('data', JSONData,
    TMVCNameCase.ncPascalCase);
  BookstoreDM.fdmemBook.First;
end;

procedure TMainPresenter.ShowBookDetails;
var
  BookstoreDM: TBookstoreDataModule;
  BookId: Integer;
  BookTitle: string;
  BookSynopsis: string;
  SelectedBook: TBook;
  CustomerReviewRepository: ICustomerReviewRepository;
  CustomerReviewService: ICustomerReviewServiceClient;
  BookDetailsPresenter: IBookDetailsPresenter;
  BookDetailsForm: TForm;
begin
  //FMainView.HideForm;
  BookstoreDM := BookstoreDataModule;

  BookId := (BookstoreDM.fdmemBookId.Value);
  BookTitle := (BookstoreDM.fdmemBookTitle.Value);
  BookSynopsis := (BookstoreDM.fdmemBookSynopsis.Value);
  SelectedBook := TBook.Create(BookId, BookTitle, BookSynopsis);

  BookDetailsForm := TBookDetailsForm.Create(SelectedBook, FMainView.Self);
  CustomerReviewRepository := TCustomerReviewRepository.Create;
  CustomerReviewService := TCustomerReviewServiceClient
    .Create(CustomerReviewRepository);
  BookDetailsPresenter := TBookDetailsPresenter
    .Create(BookDetailsForm as TBookDetailsForm, CustomerReviewService);

  BookDetailsForm.Show;
end;

end.

