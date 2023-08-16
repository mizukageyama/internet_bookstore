unit BookController;

interface

uses
  MVCFramework, MVCFramework.Commons, MVCFramework.Serializer.Commons,
  MVCFramework.ActiveRecord, System.Generics.Collections,
  Book, System.SysUtils, System.Classes, BookServiceIntf;

type
  [MVCPath('/api/books')]
  TBookController = class(TMVCController)
  private
    FService: IBookService;
  public
    [MVCPath()]
    [MVCHTTPMethod([httpGET])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON)]
    procedure GetBooks;

    [MVCPath('/($BookId)')]
    [MVCHTTPMethod([httpGET])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON)]
    procedure GetBookById(const BookId: Integer);

    [MVCPath()]
    [MVCHTTPMethod([httpPOST])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON)]
    [MVCConsumes(TMVCMediaType.APPLICATION_JSON)]
    procedure CreateBook;

    [MVCPath('/($BookId)')]
    [MVCHTTPMethod([httpDELETE])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON)]
    procedure DeleteBook(const BookId: Integer);

    [MVCPath('/($BookId)')]
    [MVCHTTPMethod([httpPUT])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON)]
    [MVCConsumes(TMVCMediaType.APPLICATION_JSON)]
    procedure UpdateBook(const BookId: Integer);
    
    constructor Create(const AService: IBookService); overload;
  end;

implementation

{ TBookController }

constructor TBookController.Create(const AService: IBookService);
begin
 if not Assigned(AService) then
    raise EArgumentNilException.Create('AService');

  inherited Create;
  FService := AService;
end;

procedure TBookController.CreateBook;
begin
  try
    var Book: TBook := Context.Request.BodyAs<TBook>;
    FService.CreateBook(Book);
    Render201Created('/api/books/' + Book.ID.ToString);
  except
    on E: Exception do
     Render(HTTP_STATUS.InternalServerError, 'An error occured: ' + E.ToString);
  end;
end;

procedure TBookController.DeleteBook(const BookId: Integer);
begin
  try
    FService.DeleteBook(BookId);
    Render(204, '');
  except
    on E: EMVCActiveRecordNotFound  do
      Render(HTTP_STATUS.NotFound, 'Book not found');
    on E: Exception do
      Render(HTTP_STATUS.InternalServerError, 'Failed to delete book');
  end;
end;

procedure TBookController.GetBookById(const BookId: Integer);
begin
  try
    var Book := FService.GetBookById(BookId);
    Render(ObjectDict().Add('data', Book));
  except
    on E: EMVCActiveRecordNotFound  do
      Render(HTTP_STATUS.NotFound, 'Book not found');
    on E: Exception do
      Render(HTTP_STATUS.InternalServerError, 'An error occured: ' + E.ToString);
  end;
end;

procedure TBookController.GetBooks;
begin
   try
    var Books := FService.GetBooks;
    Render(ObjectDict().Add('data', Books));
 except
    on E: Exception do
      Render(HTTP_STATUS.InternalServerError, 'An error occured: ' + E.ToString);
  end;
end;

procedure TBookController.UpdateBook(const BookId: Integer);
begin
  try
    var Book := Context.Request.BodyAs<TBook>;

    FService.UpdateBook(BookId, Book);
    Render(HTTP_STATUS.OK, '');
  except
    on E: EMVCActiveRecordNotFound  do
      Render(HTTP_STATUS.NotFound, 'Book not found');
    on E: Exception do
      Render(HTTP_STATUS.InternalServerError, 'Failed to update book: ' +
        E.ToString);
  end;
end;

end.
