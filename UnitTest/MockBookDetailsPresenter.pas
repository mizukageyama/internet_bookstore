unit MockBookDetailsPresenter;

interface

uses
  MainPresenterIntf, BookServiceIntf, MainFrmIntf, Book,
  CustomerReviewServiceIntf, BookDetailsFrmIntf, CustomerReview,
  BookDetailsPresenterIntf;

type
  TMockBookDetailsPresenter = class(TInterfacedObject, IBookDetailsPresenter)
  private
    FBookDetailsView: IBookDetailsView;
    FBook: TBook;
  public
    constructor Create(ABookDetailsView: IBookDetailsView; ABook: TBook);

    procedure DisplayBookDetails;
    procedure WriteReview;
    procedure ShowWriteReviewview;
    procedure ShowLoginView;
  end;

implementation

{ TMockBookDetailsPresenter }

constructor TMockBookDetailsPresenter.Create(ABookDetailsView: IBookDetailsView;
  ABook: TBook);
begin

end;

procedure TMockBookDetailsPresenter.DisplayBookDetails;
begin

end;

procedure TMockBookDetailsPresenter.ShowLoginView;
begin

end;

procedure TMockBookDetailsPresenter.ShowWriteReviewview;
begin

end;

procedure TMockBookDetailsPresenter.WriteReview;
begin

end;

end.