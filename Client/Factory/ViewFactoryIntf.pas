unit ViewFactoryIntf;

interface

uses
  BookDetailsFrmIntf, WriteReviewFrmIntf, LoginFrmIntf;

type
  IViewFactory = interface
    function CreateBookDetailsView: IBookDetailsView;
    function CreateWriteReviewView: IWriteReviewView;
    function CreateLoginView: ILoginView;
  end;

implementation

end.
