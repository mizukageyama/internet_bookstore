object BookDetailsView: TBookDetailsView
  Left = 0
  Top = 0
  Caption = 'Book Details'
  ClientHeight = 161
  ClientWidth = 504
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object BookTitleLabel: TLabel
    Left = 0
    Top = 41
    Width = 504
    Height = 20
    Align = alTop
    Caption = 'Title'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitWidth = 31
  end
  object SynopsisLabel: TLabel
    Left = 0
    Top = 61
    Width = 504
    Height = 100
    Margins.Top = 10
    Align = alClient
    Caption = 'Synopsis'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    WordWrap = True
    ExplicitWidth = 51
    ExplicitHeight = 17
  end
  object HeaderPanel: TPanel
    Left = 0
    Top = 0
    Width = 504
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Padding.Top = 10
    TabOrder = 0
    ExplicitWidth = 498
    object TitleLabel: TLabel
      Left = 0
      Top = 10
      Width = 120
      Height = 30
      Align = alLeft
      Caption = 'Book Details'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object WriteReviewButton: TButton
      Left = 370
      Top = 10
      Width = 134
      Height = 31
      Align = alRight
      Caption = 'Write Review'
      TabOrder = 0
      OnClick = WriteReviewButtonClick
      ExplicitLeft = 364
    end
  end
end
