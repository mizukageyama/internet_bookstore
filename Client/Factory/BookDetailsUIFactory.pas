unit BookDetailsUIFactory;

interface

uses
  BookDetailsUIFactoryIntf, BookDetailsFrmIntf, BookDetailsPresenterIntf;

type
  TBookDetailsUIFactory = class(TInterfacedObject, IBookDetailsUIFactory)
  public
    function CreateBookDetailsView: IBookDetailsView;
    function CreateBookDetailsPresenter: IBookDetailsPresenter;
  end;

implementation

{ TBookDetailsUIFactory }

function TBookDetailsUIFactory.CreateBookDetailsPresenter: IBookDetailsPresenter;
begin
//  Result :=
end;

function TBookDetailsUIFactory.CreateBookDetailsView: IBookDetailsView;
begin
//  Result :=
end;

end.