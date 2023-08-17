object WriteReviewForm: TWriteReviewForm
  Left = 0
  Top = 0
  Caption = 'Write Review'
  ClientHeight = 491
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
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
    Top = 71
    Width = 628
    Height = 25
    Align = alTop
    Caption = 'Title'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitWidth = 38
  end
  object pnlSearch: TPanel
    Left = 0
    Top = 30
    Width = 628
    Height = 41
    Align = alTop
    Padding.Top = 5
    Padding.Bottom = 5
    TabOrder = 0
    ExplicitWidth = 622
    object lblSearch: TLabel
      Left = 1
      Top = 6
      Width = 94
      Height = 29
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
      Left = 392
      Top = 6
      Width = 139
      Height = 29
      Align = alRight
      TabOrder = 0
      ExplicitHeight = 23
    end
    object btnSearch: TButton
      Left = 536
      Top = 6
      Width = 91
      Height = 29
      Align = alRight
      Caption = 'Search'
      TabOrder = 1
    end
    object pnlSpace: TPanel
      Left = 531
      Top = 6
      Width = 5
      Height = 29
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 457
    Width = 628
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitTop = 408
    object btnSaveReview: TButton
      Left = 0
      Top = 0
      Width = 163
      Height = 34
      Align = alLeft
      Caption = 'Save Review'
      TabOrder = 0
      ExplicitLeft = 464
      ExplicitTop = 1
      ExplicitHeight = 32
    end
  end
  object pnlGreeting: TPanel
    Left = 0
    Top = 96
    Width = 628
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = 150
    object lblGreeting: TLabel
      Left = 0
      Top = 0
      Width = 628
      Height = 27
      Align = alClient
      Caption = 'Hello __, please enter your review for this book.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 311
      ExplicitHeight = 20
    end
  end
  object pnlReviewForm: TPanel
    Left = 0
    Top = 123
    Width = 628
    Height = 64
    Align = alTop
    BevelOuter = bvNone
    Padding.Top = 7
    Padding.Bottom = 7
    TabOrder = 3
    ExplicitTop = 177
    object lblReviewTitle: TLabel
      Left = 0
      Top = 7
      Width = 104
      Height = 50
      Align = alLeft
      AutoSize = False
      Caption = 'Title'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitHeight = 22
    end
    object pnlTitleInput: TPanel
      Left = 106
      Top = 7
      Width = 522
      Height = 50
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 105
      ExplicitTop = 8
      ExplicitHeight = 48
      object lblTitleValidationMessage: TLabel
        Left = 0
        Top = 30
        Width = 522
        Height = 20
        Align = alBottom
        Caption = 'Validation Message'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ExplicitTop = 27
        ExplicitWidth = 129
      end
      object edtReviewTitle: TEdit
        Left = 0
        Top = 0
        Width = 168
        Height = 30
        Align = alLeft
        TabOrder = 0
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitHeight = 28
      end
    end
  end
  object pnlRating: TPanel
    Left = 0
    Top = 394
    Width = 628
    Height = 63
    Align = alBottom
    BevelOuter = bvNone
    Padding.Top = 7
    Padding.Bottom = 7
    TabOrder = 4
    ExplicitTop = 456
    object lblRating: TLabel
      Left = 0
      Top = 7
      Width = 104
      Height = 49
      Align = alLeft
      AutoSize = False
      Caption = 'Rating (1-5)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitHeight = 22
    end
    object pnlRatingInput: TPanel
      Left = 104
      Top = 7
      Width = 482
      Height = 49
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object lblRatingValidationMessage: TLabel
        Left = 1
        Top = 28
        Width = 480
        Height = 20
        Align = alBottom
        Caption = 'Validation Message'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 129
      end
      object edtRating: TEdit
        Left = 1
        Top = 1
        Width = 168
        Height = 27
        Align = alLeft
        TabOrder = 0
        ExplicitHeight = 23
      end
    end
  end
  object pnlReview: TPanel
    Left = 0
    Top = 187
    Width = 628
    Height = 207
    Align = alClient
    Padding.Top = 7
    Padding.Bottom = 7
    TabOrder = 5
    ExplicitTop = 283
    ExplicitHeight = 142
    object blbReview: TLabel
      Left = 1
      Top = 8
      Width = 103
      Height = 191
      Align = alLeft
      AutoSize = False
      Caption = 'Your Review'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 126
    end
    object pnlReviewInput: TPanel
      Left = 104
      Top = 8
      Width = 483
      Height = 191
      Align = alLeft
      TabOrder = 0
      ExplicitLeft = 144
      ExplicitHeight = 126
      object lblReviewValidationMessage: TLabel
        Left = 1
        Top = 170
        Width = 481
        Height = 20
        Align = alBottom
        Caption = 'Validation Message'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitTop = 155
        ExplicitWidth = 129
      end
      object memReview: TMemo
        Left = 1
        Top = 1
        Width = 296
        Height = 169
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = -111
        ExplicitHeight = 174
      end
    end
  end
end
