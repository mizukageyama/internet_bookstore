unit BookstoreDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TBookstoreDataModule = class(TDataModule)
    fdMemBook: TFDMemTable;
    dsBook: TDataSource;
    fdMemCustomer: TFDMemTable;
    dsCustomer: TDataSource;
    fdMemCustomerReview: TFDMemTable;
    dsCustomerReview: TDataSource;
    fdMemBookId: TIntegerField;
    fdMemBookTitle: TStringField;
    fdMemBookSynopsis: TStringField;
    fdMemCustomerReviewId: TIntegerField;
    fdMemCustomerReviewBookId: TIntegerField;
    fdMemCustomerReviewCustomerId: TIntegerField;
    fdMemCustomerReviewRating: TIntegerField;
    fdMemCustomerReviewReview: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BookstoreDataModule: TBookstoreDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
