object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Internet Bookstore'
  ClientHeight = 418
  ClientWidth = 615
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object lblTitle: TLabel
    Left = 0
    Top = 0
    Width = 615
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
    Width = 615
    Height = 329
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
    Width = 615
    Height = 59
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 611
    object lblWelcome: TLabel
      Left = 0
      Top = 0
      Width = 615
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
