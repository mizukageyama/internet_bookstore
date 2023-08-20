unit BookDetailsPresenter;

interface

uses
  MainPresenterIntf, BookServiceClientIntf, MainFrmIntf, System.SysUtils,
  Vcl.Dialogs, MVCFramework.DataSet.Utils, MVCFramework.Serializer.Commons,
  BookstoreDM, BookDTO, BookDetailsFrm, System.Variants, BookDetailsFrmIntf,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  CustomerReviewServiceClientIntf, BookDetailsPresenterIntf;

type
  TBookDetailsPresenter = class(TInterfacedObject, IBookDetailsPresenter)
  private
    FBookDetailsView: IBookDetailsForm;
    FBookDetailsService: ICustomerReviewServiceClient;
  protected
    procedure LoadReviews(const BookId: Integer);
    procedure WriteReview;
    function IsCustomerLoggedIn: Boolean;
    procedure PopulateReviewsTable(JSONData: string);
  public
    constructor Create(ABookDetailsView: IBookDetailsForm;
      ABookDetailsService: ICustomerReviewServiceClient);
  end;

implementation

{ TBookDetailsPresenter }

uses
  WriteReviewFrm;

function TBookDetailsPresenter.IsCustomerLoggedIn;
begin
  Result := True;
end;

constructor TBookDetailsPresenter.Create(ABookDetailsView: IBookDetailsForm;
  ABookDetailsService: ICustomerReviewServiceClient);
begin
  FBookDetailsView := ABookDetailsView;
  FBookDetailsService := ABookDetailsService;
  FBookDetailsView.SetPresenter(Self);
end;

procedure TBookDetailsPresenter.LoadReviews(const BookId: Integer);
begin
  var ResponseContent := FBookDetailsService.GetCustomerReviewsByBookId(BookId);
  PopulateReviewsTable(ResponseContent);
end;

procedure TBookDetailsPresenter.PopulateReviewsTable(JSONData: string);
begin
  var BookstoreDM := BookstoreDataModule;
  BookstoreDM.fdmemCustomerReview.Close;
  BookstoreDM.fdmemCustomerReview.Open;
  BookstoreDM.fdmemCustomerReview.LoadJSONArrayFromJSONObjectProperty('data',
    JSONData, TMVCNameCase.ncPascalCase);
  BookstoreDM.fdmemCustomerReview.First;
end;

procedure TBookDetailsPresenter.WriteReview;
begin
  if IsCustomerLoggedIn then
  begin
    var ReviewForm := TWriteReviewForm.Create(FBookDetailsView.Self);
    ReviewForm.Show;
  end
  else
  begin
//    var LoginForm := TLoginForm.Create(FBookDetailsView.Self);
//    LoginForm.Show;
  end;
end;

end.

