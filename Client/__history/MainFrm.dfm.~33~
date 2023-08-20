object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Internet Bookstore'
  ClientHeight = 382
  ClientWidth = 615
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
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
    Top = 130
    Width = 615
    Height = 237
    Align = alClient
    DataSource = BookstoreDataModule.dsBook
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
        FieldName = 'id'
        Title.Caption = 'ID'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'title'
        Title.Caption = 'Title'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'synopsis'
        Title.Caption = 'Synopsis'
        Width = 396
        Visible = True
      end>
  end
  object pnlSearch: TPanel
    Left = 0
    Top = 89
    Width = 615
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Padding.Top = 5
    Padding.Bottom = 5
    TabOrder = 1
    ExplicitWidth = 622
    object lblSearch: TLabel
      Left = 0
      Top = 5
      Width = 94
      Height = 31
      Align = alLeft
      Caption = 'Search Book'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 23
    end
    object edtSearchKey: TEdit
      Left = 380
      Top = 5
      Width = 139
      Height = 31
      Align = alRight
      TabOrder = 0
      ExplicitLeft = 387
      ExplicitHeight = 23
    end
    object Search: TButton
      Left = 524
      Top = 5
      Width = 91
      Height = 31
      Align = alRight
      Caption = 'Search'
      TabOrder = 1
      OnClick = SearchClick
      ExplicitLeft = 531
    end
    object pnlSpace: TPanel
      Left = 519
      Top = 5
      Width = 5
      Height = 31
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitLeft = 526
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 367
    Width = 615
    Height = 15
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = 581
    ExplicitWidth = 622
  end
  object pnlWelcomeText: TPanel
    Left = 0
    Top = 30
    Width = 615
    Height = 59
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitWidth = 622
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
