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
  object TitleLabel: TLabel
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
  object WelcomeTextPanel: TPanel
    Left = 0
    Top = 30
    Width = 609
    Height = 59
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
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
  object BookListGrid: TStringGrid
    Tag = 1
    Left = 0
    Top = 89
    Width = 609
    Height = 320
    Align = alClient
    ColCount = 1
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goFixedRowDefAlign]
    TabOrder = 1
    OnDblClick = BookListGridDblClick
    ExplicitWidth = 603
    ExplicitHeight = 311
    ColWidths = (
      600)
    ColAligments = (
      0)
  end
  object BookAdapterBindSource: TAdapterBindSource
    AutoActivate = False
    ScopeMappings = <
      item
        Name = 'Title'
        ValVariant = ''
      end>
    Left = 536
    Top = 30
  end
  object BookBindingsList: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 428
    Top = 29
    object LinkGridToDataSourceAdapterBindSource1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = BookAdapterBindSource
      GridControl = BookListGrid
      Columns = <
        item
          MemberName = 'Title'
          Width = 600
        end>
    end
  end
end
