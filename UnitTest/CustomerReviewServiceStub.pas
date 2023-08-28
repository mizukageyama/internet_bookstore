unit CustomerReviewServiceStub;

interface

uses
  CustomerReviewServiceIntf, Book, System.Generics.Collections;

type
  TCustomerReviewServiceStub = class(TInterfacedObject, ICustomerReviewService)
  private
    FBookList: TObjectList<TBook>;
  public
    procedure CreateCustomerReview(const CustomerReview: TCustomerReview);
    function GetCustomerReviewsByBookId(const BookId: Integer):
      TObjectList<TCustomerReview>;
    function GetCustomerReviewById(const CustomerReviewId: Integer):
      TCustomerReview;
    procedure UpdateCustomerReview(const CustomerReview: TCustomerReview);
    procedure DeleteCustomerReview(const CustomerReviewId: Integer);
  end;

implementation

{ TCustomerReviewServiceStub }


constructor TCustomerReviewServiceStub.Create(ABookList: TObjectList<TBook>);
begin
  FBookList := ABookList;
end;

procedure TCustomerReviewServiceStub.CreateBook(const Book: TBook);
begin
  FBookList.Add(Book);
end;

procedure TCustomerReviewServiceStub.DeleteBook(const BookId: Integer);
begin
  FBookList.Delete(BookId);
end;

function TCustomerReviewServiceStub.GetBookById(const BookId: Integer): TBook;
begin
  Result := FBookList[BookId];
end;

function TCustomerReviewServiceStub.GetBooks: TObjectList<TBook>;
begin
  Result := FBookList;
end;

procedure TCustomerReviewServiceStub.UpdateBook(const Book: TBook);
begin
  FBookList[Book.Id] := Book;
end;

end.
