object BookDetailsForm: TBookDetailsForm
  Left = 0
  Top = 0
  Caption = 'Book Details'
  ClientHeight = 258
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object lblTitle: TLabel
    Left = 0
    Top = 0
    Width = 628
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
  object lblBookTitle: TLabel
    Left = 0
    Top = 130
    Width = 628
    Height = 23
    Align = alTop
    Caption = 'Title'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblSynopsis: TLabel
    Left = 0
    Top = 153
    Width = 628
    Height = 71
    Margins.Top = 10
    Align = alClient
    Caption = 'Synopsis'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ExplicitHeight = 64
  end
  object pnlWelcomeText: TPanel
    Left = 0
    Top = 30
    Width = 628
    Height = 59
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lblWelcome: TLabel
      Left = 0
      Top = 0
      Width = 628
      Height = 25
      Align = alTop
      Caption = 'Welcome to our streamlined Internet Bookstore.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 412
    end
  end
  object pnlSearch: TPanel
    Left = 0
    Top = 89
    Width = 628
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Padding.Top = 5
    Padding.Bottom = 5
    TabOrder = 1
    ExplicitTop = 30
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
      ExplicitLeft = 1
      ExplicitTop = 6
      ExplicitHeight = 23
    end
    object edtSearchKey: TEdit
      Left = 393
      Top = 5
      Width = 139
      Height = 31
      Align = alRight
      TabOrder = 0
      ExplicitLeft = 392
      ExplicitTop = 6
      ExplicitHeight = 23
    end
    object Search: TButton
      Left = 537
      Top = 5
      Width = 91
      Height = 31
      Align = alRight
      Caption = 'Search'
      TabOrder = 1
      ExplicitLeft = 536
      ExplicitTop = 6
      ExplicitHeight = 29
    end
    object pnlSpace: TPanel
      Left = 532
      Top = 5
      Width = 5
      Height = 31
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitLeft = 531
      ExplicitTop = 6
      ExplicitHeight = 29
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 224
    Width = 628
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = 408
    object Button1: TButton
      Left = 425
      Top = 0
      Width = 203
      Height = 34
      Align = alRight
      Caption = 'Write a Review for this book'
      TabOrder = 0
      OnClick = Button1Click
      ExplicitLeft = 424
      ExplicitTop = 1
      ExplicitHeight = 32
    end
  end
end
