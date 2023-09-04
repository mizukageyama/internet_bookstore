unit WriteReviewVPFactoryIntf;

interface

uses
  WriteReviewFrmIntf, WriteReviewPresenterIntf, Book, CustomerReviewServiceIntf;

type
  IWriteReviewVPFactory = interface
    ['{DC551807-3F0B-408E-B139-AB90DD10286F}']
    function CreateWriteReviewView: IWriteReviewView;
    function CreateWriteReviewPresenter(AWriteReviewView: IWriteReviewView;
      ACustomerReviewServiceProxy: ICustomerReviewService; ABook: TBook):
      IWriteReviewPresenter;
  end;

implementation

end.
