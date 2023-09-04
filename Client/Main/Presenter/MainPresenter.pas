unit MainPresenter;

interface

uses
  MainPresenterIntf, BookServiceIntf, MainFrmIntf, System.SysUtils,
  Book, System.Generics.Collections;

type
  TMainPresenter = class(TInterfacedObject, IMainPresenter)
  private
    FMainView: IMainView;
    FBookServiceProxy: IBookService;
    FBookList: TList<TObject>;
  public
    constructor Create(AMainView: IMainView; AMainService: IBookService);
    procedure LoadBooks;
    procedure ShowBookDetails;
    function GetBookList: TList<TObject>;
    function GetBookClass: TClass;
  end;

implementation

uses
  BookDetailsPresenterIntf, BookDetailsPresenter, SysConst,
  StatusCodeException, CustomerReviewServiceIntf, CustomerReviewServiceProxy,
  BookDetailsFrm, ViewFactory;

{ TMainPresenter }

constructor TMainPresenter.Create(AMainView: IMainView;
  AMainService: IBookService);
begin
  FMainView := AMainView;
  FBookServiceProxy := AMainService;
  FMainView.SetPresenter(Self);
  FBookList := TList<TObject>.Create;
end;

function TMainPresenter.GetBookClass: TClass;
begin
  Result := TBook;
end;

function TMainPresenter.GetBookList: TList<TObject>;
begin
  Result := FBookList;
end;

procedure TMainPresenter.LoadBooks;
begin
  try
    for var Book in FBookServiceProxy.GetBooks do
      FBookList.Add(Book);
  except
    on E: Exception do
    begin
      FMainView.ShowMessageDialog(E.ToString);
    end;
  end;
end;

procedure TMainPresenter.ShowBookDetails;
var
  SelectedBook: TBook;
  BookDetailsPresenter: IBookDetailsPresenter;
  BookDetailsView: TBookDetailsView;
begin
  SelectedBook := FMainView.GetSelectedBook as TBook;
  BookDetailsView := TViewFactory.CreateBookDetailsView;
  BookDetailsPresenter := TBookDetailsPresenter
    .Create(BookDetailsView as TBookDetailsView, SelectedBook);

  BookDetailsView.Show;
end;

end.

