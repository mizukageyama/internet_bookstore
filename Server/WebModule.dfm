object MyWebModule: TMyWebModule
  OnCreate = WebModuleCreate
  OnDestroy = WebModuleDestroy
  Actions = <>
  Height = 288
  Width = 519
  PixelsPerInch = 120
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\User\Documents\GitHub\internet_bookstore\Output\Lib\Win' +
      '32\Debug\libmysql.dll'
    Left = 233
    Top = 96
  end
end
