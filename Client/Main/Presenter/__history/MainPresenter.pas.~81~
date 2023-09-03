unit MainPresenter;

interface

uses
  MainPresenterIntf, BookServiceIntf, MainFrmIntf, System.SysUtils,
  Book, System.Generics.Collections, Data.Bind.ObjectScope;

type
  TMainPresenter = class(TInterfacedObject, IMainPresenter)
  private
    FMainView: IMainView;
    FBookServiceProxy: IBookService;
  public
    constructor Create(AMainView: IMainView; AMainService: IBookService);
    procedure LoadBooks;
    procedure ShowBookDetails;
    procedure BindAdapterToDataList(const Books: TObjectList<TBook>);
  end;

implementation

uses
  BookDetailsPresenterIntf, BookDetailsPresenter, SYSCONST,
  StatusCodeException, CustomerReviewServiceIntf, CustomerReviewServiceProxy,
  MainFrm, BookDetailsFrm;

{ TMainPresenter }

constructor TMainPresenter.Create(AMainView: IMainView;
  AMainService: IBookService);
begin
  FMainView := AMainView;
  FBookServiceProxy := AMainService;
  FMainView.SetPresenter(Self);
end;

procedure TMainPresenter.LoadBooks;
begin
  try
    var Books := FBookServiceProxy.GetBooks;
    BindAdapterToDataList(Books);
  except
    on E: Exception do
    begin
      FMainView.ShowMessageDialog(E.ToString);
    end;
  end;
end;

procedure TMainPresenter.BindAdapterToDataList(const Books: TObjectList<TBook>);
begin
  var BindSourceAdapter := TListBindSourceAdapter<TBook>
    .Create(FMainView as TMainView, Books, True);
  FMainView.SetBindSourceAdapter(BindSourceAdapter);
end;

procedure TMainPresenter.ShowBookDetails;
var
  SelectedBook: TBook;
  BookDetailsPresenter: IBookDetailsPresenter;
  BookDetailsView: TBookDetailsView;
begin
  //factory method
  SelectedBook := FMainView.GetSelectedBook as TBook;
  BookDetailsView := TBookDetailsView.Create(FMainView as TMainView);
  BookDetailsPresenter := TBookDetailsPresenter
    .Create(BookDetailsView as TBookDetailsView, SelectedBook);

  BookDetailsView.Show;
end;

end.

