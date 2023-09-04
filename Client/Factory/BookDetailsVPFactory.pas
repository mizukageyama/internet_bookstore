unit BookDetailsVPFactory;

interface

uses
  BookDetailsVPFactoryIntf, BookDetailsFrmIntf, BookDetailsPresenterIntf, Book,
  LoginVPFactoryIntf, WriteReviewVPFactoryIntf;

type
  TBookDetailsVPFactory = class(TInterfacedObject, IBookDetailsVPFactory)
  public
    function CreateBookDetailsView: IBookDetailsView;
    function CreateBookDetailsPresenter(ABookDetailsView: IBookDetailsView;
      ALoginVPFactory: ILoginVPFactory;
      AWriteReviewVPFactory: IWriteReviewVPFactory; ABook: TBook):
      IBookDetailsPresenter;
  end;

implementation

uses
  BookDetailsFrm, BookDetailsPresenter;

{ TBookDetailsVPFactory }

function TBookDetailsVPFactory.CreateBookDetailsPresenter(
  ABookDetailsView: IBookDetailsView; ALoginVPFactory: ILoginVPFactory;
  AWriteReviewVPFactory: IWriteReviewVPFactory; ABook: TBook):
  IBookDetailsPresenter;
begin
  var BookDetailsPresenter := TBookDetailsPresenter
    .Create(ABookDetailsView, ABook, ALoginVPFactory, AWriteReviewVPFactory);
  Result := BookDetailsPresenter;
end;

function TBookDetailsVPFactory.CreateBookDetailsView: IBookDetailsView;
begin
  Result := TBookDetailsView.Create(nil);
end;

end.
