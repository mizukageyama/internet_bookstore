unit BaseController;

interface

uses
  MVCFramework, FireDAC.Comp.Client, MVCFramework.ActiveRecord;

type
  TBaseController = class(TMVCController)
  protected
    procedure OnBeforeAction(Context: TWebContext; const AActionName: string;
      var Handled: Boolean); override;
    procedure OnAfterAction(Context: TWebContext; const AActionName: string);
      override;
  end;

implementation

procedure TBaseController.OnAfterAction(Context: TWebContext;
  const AActionName: string);
begin
//  ActiveRecordConnectionsRegistry.RemoveDefaultConnection;
//  inherited;
end;

procedure TBaseController.OnBeforeAction(Context: TWebContext;
  const AActionName: string; var Handled: Boolean);
var
  LConn: TFDConnection;
begin
//  inherited;
//  LConn := TFDConnection.Create(nil);
//  LConn.ConnectionDefName := 'Internet_Bookstore_Connection';
//  ActiveRecordConnectionsRegistry.AddDefaultConnection(LConn, True);
end;

end.
