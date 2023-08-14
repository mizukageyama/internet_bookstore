unit InternetBookstoreController;

interface

uses
  MVCFramework, MVCFramework.Commons, MVCFramework.Serializer.Commons,
  BaseController;

type
  [MVCPath('/api')]
  TInternetBookstoreController = class(TBaseController)
  public
    [MVCPath('/index')]
    [MVCHTTPMethod([httpGET])]
    [MVCProduces('text/html')]
    procedure Index;
  end;

implementation

uses
  System.SysUtils, MVCFramework.Logger, System.StrUtils, System.Classes,
  Web.HTTPApp;

procedure TInternetBookstoreController.Index;
var
  HtmlContent: TStringList;
begin
  HtmlContent := TStringList.Create;
  try
    // Load the HTML content from a file
    HtmlContent.LoadFromFile('../../static/index.html');

    // Set the content type and render the HTML content
    ContentType := 'text/html';
    Render(HtmlContent.Text);
  finally
    HtmlContent.Free;
  end;
end;

end.
