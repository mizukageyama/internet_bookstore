unit ViewFactory;

interface

uses
  BookDetailsFrmIntf, WriteReviewFrmIntf, LoginFrmIntf;

type
  TViewFactory = class
  public
    class function CreateBookDetailsView: IBookDetailsView;
    class function CreateWriteReviewView: IWriteReviewView;
    class function CreateLoginView: ILoginView;
  end;

implementation

uses
  BookDetailsFrm, WriteReviewFrm, LoginFrm;

class function TViewFactory.CreateBookDetailsView: IBookDetailsView;
begin
  Result := TBookDetailsView.Create(nil);
end;

class function TViewFactory.CreateLoginView: ILoginView;
begin
  Result := TLoginView.Create(nil);
end;

class function TViewFactory.CreateWriteReviewView: IWriteReviewView;
begin
  Result := TWriteReviewView.Create(nil);
end;

end.
