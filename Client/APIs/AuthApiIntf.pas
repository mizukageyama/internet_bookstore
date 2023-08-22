unit AuthApiIntf;

interface

uses
  System.Generics.Collections, MVCFramework.RESTClient.Intf,
  MVCFramework.RESTClient, JSON;

type
  IAuthApi = interface
    ['{D93E6939-AE2B-400A-B793-AFA67338C83F}']
    function LoginUser(const Username, Password: string): IMVCRESTResponse;
  end;

implementation

end.
