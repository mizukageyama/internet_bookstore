unit AuthCriteria;

interface

uses
  System.Generics.Collections, MVCFramework.ActiveRecord,
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

uses
  CustomerActiveRecord, Customer;

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
begin
  inherited;

  var CustomerAR := TCustomerActiveRecord.Create;
  var CustomerList := CustomerAR.Where(TCustomerActiveRecord,
    ' WHERE EMAIL = ?', [AUserName]);

  try
    if CustomerList.Count	<> 0 then
    begin
      var Customer := TCustomer.Create(CustomerList[0] as TCustomerActiveRecord);
      AIsValid := Customer.IsPasswordMatched(APassword);

      if not AIsValid then
      begin
        raise EMVCException.Create(HTTP_STATUS.Unauthorized,
          'Invalid Password');
        Exit;
      end;

      AIsValid := True;
      ASessionData.AddOrSetValue('customer_name', Customer.FirstName);
      ASessionData.AddOrSetValue('customer_id', Customer.Id.ToString);
    end
    else
    begin
      raise EMVCException.Create(HTTP_STATUS.Unauthorized,
        'Email does not exist');
      AIsValid := False;
    end;
  finally
    CustomerAR.Free;
    CustomerList.Free;
  end;
end;

procedure TAuthCriteria.OnAuthorization(const AContext: TWebContext;
  AUserRoles: TList<string>; const AControllerQualifiedClassName: string;
  const AActionName: string; var AIsAuthorized: Boolean);
begin
  AIsAuthorized := True;
end;

end.
