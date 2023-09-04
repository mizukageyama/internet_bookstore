unit BookController;

interface

uses
  MVCFramework, MVCFramework.Commons, MVCFramework.Serializer.Commons,
  MVCFramework.ActiveRecord, System.Generics.Collections, System.Math,
  Book, System.SysUtils, System.Classes, BookServiceIntf, BaseController;

type
  TBookController = class(TBaseController)
  private
    FBookService: IBookService;
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

    constructor Create(const AService: IBookService); reintroduce;
  end;

implementation

{ TBookController }

constructor TBookController.Create(const AService: IBookService);
begin
 if not Assigned(AService) then
    raise EArgumentNilException.Create('AService');

  inherited Create;
  FBookService := AService;
end;

procedure TBookController.CreateBook;
begin
  var Book := Context.Request.BodyAs<TBook>;
  
  if not Book.IsValid then
  begin
    raise EMVCException.Create(400, 'Invalid Request');
  end; 
     
  FBookService.CreateBook(Book);
  Render201Created('/api/books/' + Book.ID.ToString);
end;

procedure TBookController.DeleteBook(const BookId: Integer);
begin
  FBookService.DeleteBook(BookId);
  Render(204, '');
end;

procedure TBookController.GetBookById(const BookId: Integer);
begin
  var Book := FBookService.GetBookById(BookId);
  Render(ObjectDict().Add('data', Book));
end;

procedure TBookController.GetBooks;
begin
  var Books := FBookService.GetBooks;
  Render(ObjectDict().Add('data', Books));
end;

procedure TBookController.UpdateBook(const BookId: Integer);
begin
  var Book := Context.Request.BodyAs<TBook>;
  Book.Id := BookId;

  if not Book.IsValid then
  begin
    raise EMVCException.Create(400, 'Invalid Request');
  end;

  FBookService.UpdateBook(Book);
  Render(HTTP_STATUS.OK, '');
end;

end.
