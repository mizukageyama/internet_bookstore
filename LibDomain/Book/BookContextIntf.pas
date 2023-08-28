unit BookContextIntf;

interface

type
  IBookContext = interface
    ['{09373C52-A6BD-478C-8703-AF3EF11488D1}']
    function GetBookId: Integer;
    procedure SetBookId(const BookId: Integer);

    function GetBookSynopsis: string;
    procedure SetBookSynopsis(const BookSypnosis: string);

    function GetBookTitle: string;
    procedure SetBookTitle(const BookTitle: string);

    property Id: Integer read GetBookId write SetBookId;
    property Title: string read GetBookTitle write SetBookTitle;
    property Synopsis: string read GetBookSynopsis write SetBookSynopsis;
  end;

implementation

end.
