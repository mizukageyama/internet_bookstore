unit BookContextIntf;

interface

type
  IBookContext = interface
    ['{B6B02FFE-9D3D-4D73-9501-9B12E140F0E3}']
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
