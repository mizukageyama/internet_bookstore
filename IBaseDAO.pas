unit IBaseDAO;

interface

uses
  System.Generics.Collections;

type
  IBaseDAO<T: class> = interface
    procedure Create(Obj: T);
    function GetAll: TObjectList<T>;
    function GetById(Id: Integer): T;
    function Update(Obj: T): Boolean;
    function Delete: Boolean;
  end;

implementation

end.
