unit IBaseDAO;

interface

uses
  System.Generics.Collections;

type
  IBaseDAO<T: class> = interface
    function Get: TObjectList<T>;
  end;

implementation

end.
