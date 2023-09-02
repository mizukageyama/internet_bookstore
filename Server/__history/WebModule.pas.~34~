unit WebModule;

interface

uses
  MVCFramework, MVCFramework.Commons, MVCFramework.Serializer.Commons,
  MVCFramework.ActiveRecord, System.SysUtils, MVCFramework.Logger,
  System.StrUtils, System.Math,  FireDAC.Stan.Error, System.Generics.Collections,
  System.Classes, Web.HTTPApp, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL;

type
  TMyWebModule = class(TWebModule)
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    procedure WebModuleCreate(Sender: TObject);
    procedure WebModuleDestroy(Sender: TObject);
  private
    FMVC: TMVCEngine;
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TMyWebModule;

implementation

{$R *.dfm}

uses
  System.IOUtils,
  MVCFramework.JWT,
  MVCFramework.Middleware.JWT,
  MVCFramework.Middleware.ActiveRecord, 
  MVCFramework.Middleware.StaticFiles, 
  MVCFramework.Middleware.Analytics,
  MVCFramework.Middleware.Trace, 
  MVCFramework.Middleware.CORS,
  MVCFramework.Middleware.ETag,
  MVCFramework.Middleware.Compression,
  MVCFramework.Serializer.JsonDataObjects, JsonDataObjects,
  BookActiveRecordDAO, BookService, BookController, BookDAOIntf,
  CustomerActiveRecordDAO, CustomerService, CustomerController, CustomerDAOIntf,
  CustomerReviewActiveRecordDAO, CustomerReviewService,
  CustomerReviewController, CustomerReviewDAOIntf, AuthCriteria;

procedure TMyWebModule.WebModuleCreate(Sender: TObject);
begin
  FMVC := TMVCEngine.Create(Self,
    procedure(Config: TMVCConfig)
    begin
      Config[TMVCConfigKey.SessionTimeout] := '0';
      Config[TMVCConfigKey.DefaultContentType] :=
        TMVCConstants.DEFAULT_CONTENT_TYPE;
      Config[TMVCConfigKey.DefaultContentCharset] :=
        TMVCConstants.DEFAULT_CONTENT_CHARSET;
      Config[TMVCConfigKey.AllowUnhandledAction] := 'false';
      Config[TMVCConfigKey.LoadSystemControllers] := 'false';
      Config[TMVCConfigKey.DefaultViewFileExtension] := 'html';
      Config[TMVCConfigKey.ViewPath] := 'templates';
      Config[TMVCConfigKey.MaxEntitiesRecordCount] := '20';
      Config[TMVCConfigKey.ExposeServerSignature] := 'true';
      Config[TMVCConfigKey.ExposeXPoweredBy] := 'true';
      Config[TMVCConfigKey.MaxRequestSize] :=
        IntToStr(TMVCConstants.DEFAULT_MAX_REQUEST_SIZE);
    end);


    FMVC.AddMiddleware(TMVCActiveRecordMiddleware
      .Create('Internet_Bookstore_Connection','FDConnectionDefs.ini'));

    var lConfigClaims: TJWTClaimsSetup := procedure (const JWT: TJWT)
    begin
      JWT.Claims.Issuer := 'Internet Bookstore';
      //JWT will expire in 1 hour
      JWT.Claims.ExpirationTime := Now + EncodeTime(1, 0, 0, 0);
      JWT.Claims.NotBefore := Now - EncodeTime(0, 5, 0, 0);
      JWT.Claims.IssuedAt := Now;
    end;

  FMVC.AddMiddleware(
    TMVCJWTAuthenticationMiddleware.Create(
      TAuthCriteria.Create,
      lConfigClaims,
      'this_is_my_secret',
      '/api/auth/login',
      [TJWTCheckableClaim.ExpirationTime, TJWTCheckableClaim.NotBefore]
    )
  );

  //MVCCryptInit; //Initialize OpenSSL
  FMVC.AddMiddleware(TMVCCORSMiddleware.Create);

  FMVC.AddController(
    TBookController,
    function: TMVCController
    begin
      var DAO: IBookDAO := TBookActiveRecordDAO.Create;
      var Service := TBookService.Create(DAO);
      Result := TBookController.Create(Service);
    end,
    '/api/books');

  FMVC.AddController(
    TCustomerController,
    function: TMVCController
    begin
      var DAO: ICustomerDAO := TCustomerActiveRecordDao.Create;
      var Service := TCustomerService.Create(DAO);
      Result := TCustomerController.Create(Service);
    end,
    '/api/customers');

  FMVC.AddController(
    TCustomerReviewController,
    function: TMVCController
    begin
      var DAO: ICustomerReviewDAO := TCustomerReviewActiveRecordDao.Create;
      var Service := TCustomerReviewService.Create(DAO);
      Result := TCustomerReviewController.Create(Service);
    end,
    '/api/reviews');

end;

procedure TMyWebModule.WebModuleDestroy(Sender: TObject);
begin
  FMVC.Free;
end;

end.
