object WriteReviewForm: TWriteReviewForm
  Left = 0
  Top = 0
  Caption = 'Write Review'
  ClientHeight = 364
  ClientWidth = 534
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lblBookTitle: TLabel
    Left = 0
    Top = 0
    Width = 534
    Height = 25
    Align = alTop
    Caption = 'Title'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 71
    ExplicitWidth = 38
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 330
    Width = 534
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitTop = 439
    ExplicitWidth = 616
    object btnSaveReview: TButton
      Left = 0
      Top = 0
      Width = 163
      Height = 34
      Align = alLeft
      Caption = 'Save Review'
      TabOrder = 0
    end
  end
  object pnlGreeting: TPanel
    Left = 0
    Top = 25
    Width = 534
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 96
    ExplicitWidth = 616
    object lblGreeting: TLabel
      Left = 0
      Top = 0
      Width = 534
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
  object pnlRating: TPanel
    Left = 0
    Top = 267
    Width = 534
    Height = 63
    Align = alBottom
    BevelOuter = bvNone
    Padding.Top = 7
    Padding.Bottom = 7
    TabOrder = 2
    ExplicitTop = 376
    ExplicitWidth = 616
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
        Width = 58
        Height = 27
        Align = alLeft
        TabOrder = 0
      end
    end
  end
  object pnlReview: TPanel
    Left = 0
    Top = 52
    Width = 534
    Height = 215
    Align = alClient
    Padding.Top = 7
    Padding.Bottom = 7
    TabOrder = 3
    ExplicitTop = 187
    ExplicitWidth = 616
    ExplicitHeight = 189
    object blbReview: TLabel
      Left = 1
      Top = 8
      Width = 103
      Height = 199
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
      Height = 199
      Align = alLeft
      TabOrder = 0
      ExplicitHeight = 173
      object lblReviewValidationMessage: TLabel
        Left = 1
        Top = 178
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
        ExplicitTop = 225
        ExplicitWidth = 129
      end
      object memReview: TMemo
        Left = 1
        Top = 1
        Width = 408
        Height = 177
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
  end
end
