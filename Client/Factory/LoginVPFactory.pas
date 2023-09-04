unit LoginVPFactory;

interface

uses
  LoginVPFactoryIntf;

type
  TLoginVPFactory = class(TInterfacedObject, ILoginVPFactory)
  public
    function CreateLoginView: ILoginView;
    function CreateLoginPresenter(ALoginViewView: ILoginView): ILoginPresenter;
  end;

implementation

uses
  LoginFrm;

{ TLoginVPFactory }

function TLoginVPFactory.CreateLoginPresenter(
  ALoginViewView: ILoginView): ILoginPresenter;
begin
  var LoginPresenter := TLoginPresenter.Create(ALoginViewView);
  Result := LoginPresenter;
end;

function TLoginVPFactory.CreateLoginView: ILoginView;
begin
  Result := TLoginView.Create;
end;

end.
