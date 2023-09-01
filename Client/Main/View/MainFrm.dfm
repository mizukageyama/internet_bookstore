object MainView: TMainView
  Left = 0
  Top = 0
  Caption = 'Internet Bookstore'
  ClientHeight = 409
  ClientWidth = 609
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object lblTitle: TLabel
    Left = 0
    Top = 0
    Width = 609
    Height = 30
    Align = alTop
    Caption = 'ICONIX Internet Bookstore'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -22
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    ExplicitWidth = 258
  end
  object dbgBooks: TDBGrid
    Left = 0
    Top = 89
    Width = 609
    Height = 320
    Align = alClient
    DataSource = BookstoreDataModule.dsBook
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = dbgBooksDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Title'
        Width = 546
        Visible = True
      end>
  end
  object pnlWelcomeText: TPanel
    Left = 0
    Top = 30
    Width = 609
    Height = 59
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 603
    object lblWelcome: TLabel
      Left = 0
      Top = 0
      Width = 609
      Height = 25
      Align = alTop
      Caption = 'Welcome to our streamlined Internet Bookstore.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 412
    end
  end
end
