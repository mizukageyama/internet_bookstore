unit BookDetailsVPFactoryIntf;

interface

uses
  BookDetailsFrmIntf, BookDetailsPresenterIntf, Book, LoginVPFactoryIntf,
  WriteReviewVPFactoryIntf;

type
  IBookDetailsVPFactory = interface
    ['{2889E033-B1E1-42A2-A367-02B99F0A9B8A}']
    function CreateBookDetailsView: IBookDetailsView;
    function CreateBookDetailsPresenter(ABookDetailsView: IBookDetailsView;
      ALoginVPFactory: ILoginVPFactory;
      AWriteReviewVPFactory: IWriteReviewVPFactory; ABook: TBook):
      IBookDetailsPresenter;
  end;

implementation

end.
