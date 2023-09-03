unit ViewFactory;

interface

uses
  BookDetailsFrm, WriteReviewFrm, LoginFrm;

type
  TViewFactory = class
  public
    class function CreateBookDetailsView: TBookDetailsView;
    class function CreateWriteReviewView: TWriteReviewView;
    class function CreateLoginView: TLoginView;
  end;

implementation

class function TViewFactory.CreateBookDetailsView: TBookDetailsView;
begin
  Result := TBookDetailsView.Create(nil);
end;

class function TViewFactory.CreateLoginView: TLoginView;
begin
  Result := TLoginView.Create(nil);
end;

class function TViewFactory.CreateWriteReviewView: TWriteReviewView;
begin
  Result := TWriteReviewView.Create(nil);
end;

end.
