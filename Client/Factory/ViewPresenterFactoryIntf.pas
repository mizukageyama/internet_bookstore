unit ViewPresenterFactoryIntf;

interface

uses
  LoginFrmIntf, LoginPresenterIntf, BookDetailsFrmIntf, WriteReviewFrmIntf,
  BookDetailsPresenterIntf, CustomerReviewServiceIntf, Book,
  WriteReviewPresenterIntf;

type
  IViewPresenterFactory = interface
    ['{552171CD-2326-4DFF-9641-4C64CAC28393}']
    function CreateLoginView: ILoginView;
    function CreateLoginPresenter(ALoginViewView: ILoginView): ILoginPresenter;

    function CreateBookDetailsView: IBookDetailsView;
    function CreateBookDetailsPresenter(ABookDetailsView: IBookDetailsView;
      ABook: TBook; AViewPresenterFactory: IViewPresenterFactory):
      IBookDetailsPresenter;

    function CreateWriteReviewView: IWriteReviewView;
    function CreateWriteReviewPresenter(AWriteReviewView: IWriteReviewView;
      ACustomerReviewServiceProxy: ICustomerReviewService; ABook: TBook):
      IWriteReviewPresenter;
  end;

implementation

end.
