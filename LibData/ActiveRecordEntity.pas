unit ActiveRecordEntity;

interface

uses
  MVCFramework.ActiveRecord, MVCFramework, MVCFramework.Serializer.Commons,
  MVCFramework.SQLGenerators.MySQL, BookContextIntf;

type
  TActiveRecordEntity = class abstract(TMVCActiveRecord)
  public
    function QueryInterface(const IID: TGUID; out Obj): HRESULT; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  end;

implementation

{ TActiveRecordEntity }

function TActiveRecordEntity.QueryInterface(const IID: TGUID;
  out Obj): HRESULT;
begin
  Result := -1;
end;

function TActiveRecordEntity._AddRef: Integer;
begin
  Result := -1;
end;

function TActiveRecordEntity._Release: Integer;
begin
  Result := -1;
end;

end.
