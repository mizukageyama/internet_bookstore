unit AuthCriteria;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client, MVCFramework.ActiveRecord,
  MVCFramework, System.StrUtils, System.SysUtils, MVCFramework.Commons;

type
  TAuthCriteria = class(TInterfacedObject, IMVCAuthenticationHandler)
  public
    procedure OnRequest(const AContext: TWebContext;
      const AControllerQualifiedClassName, AActionName: string;
      var AAuthenticationRequired: Boolean);
    procedure OnAuthentication(const AContext: TWebContext; const AUserName,
      APassword: string; AUserRoles: TList<string>; var AIsValid: Boolean;
      const ASessionData: TDictionary<string, string>);
    procedure OnAuthorization(const AContext: TWebContext;
      AUserRoles: TList<string>; const AControllerQualifiedClassName: string;
      const AActionName: string; var AIsAuthorized: Boolean);
 end;

implementation

//uses
//  Customer;

procedure TAuthCriteria.OnRequest(const AContext: TWebContext;
  const AControllerQualifiedClassName, AActionName: string;
  var AAuthenticationRequired: Boolean);
begin
  if (AContext.Request.HTTPMethod in [httpPOST, httpPUT, httpDELETE]) then
    AAuthenticationRequired := True
  else
    AAuthenticationRequired := False;
end;

procedure TAuthCriteria.OnAuthentication(const AContext: TWebContext;
  const AUserName, APassword: string; AUserRoles: TList<string>;
  var AIsValid: Boolean; const ASessionData: TDictionary<string, string>);
var
  LConn: TFDConnection;
  //LCustomer: TCustomer;
begin
  inherited;

//  LCustomer := TMVCActiveRecord.GetOneByWhere<TCustomer>('email = ?',
//    [AUserName], False);

  try
//    AIsValid := Assigned(LCustomer) and LCustomer.IsPasswordMatched(APassword);
//    if not AIsValid then
//    begin
//      Exit;
//    end;
    //Let's save in the custom claims the user's user_id
    AIsValid := True;
    ASessionData.AddOrSetValue('customer_id', '9');
  finally
    //LCustomer.Free;
    //ActiveRecordConnectionsRegistry.RemoveDefaultConnection;
  end;
end;

procedure TAuthCriteria.OnAuthorization(const AContext: TWebContext;
  AUserRoles: TList<string>; const AControllerQualifiedClassName: string;
  const AActionName: string; var AIsAuthorized: Boolean);
begin
  AIsAuthorized := True;
end;

end.
