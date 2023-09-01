object WriteReviewView: TWriteReviewView
  Left = 0
  Top = 0
  Caption = 'Write Review'
  ClientHeight = 346
  ClientWidth = 522
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object lblBookTitle: TLabel
    Left = 0
    Top = 0
    Width = 522
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
  object pnlBottom: TPanel
    Left = 0
    Top = 312
    Width = 522
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
    ExplicitTop = 303
    ExplicitWidth = 516
    object btnSubmitReview: TButton
      Left = 0
      Top = 0
      Width = 163
      Height = 34
      Align = alLeft
      Caption = 'Submit Review'
      TabOrder = 0
      OnClick = btnSubmitReviewClick
    end
  end
  object pnlGreeting: TPanel
    Left = 0
    Top = 25
    Width = 522
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 516
    object lblGreeting: TLabel
      Left = 0
      Top = 0
      Width = 522
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
    Top = 249
    Width = 522
    Height = 63
    Align = alBottom
    BevelOuter = bvNone
    Padding.Top = 7
    Padding.Bottom = 7
    TabOrder = 2
    ExplicitTop = 240
    ExplicitWidth = 516
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
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object edtRating: TEdit
        Left = 0
        Top = 0
        Width = 58
        Height = 27
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBackground
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitHeight = 23
      end
      object pnlValidation: TPanel
        Left = 0
        Top = 27
        Width = 482
        Height = 22
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object lblRatingValidationMessage: TLabel
          Left = 0
          Top = 2
          Width = 482
          Height = 20
          Align = alBottom
          Caption = 'Validation Message'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Visible = False
          ExplicitWidth = 129
        end
      end
    end
  end
  object pnlReview: TPanel
    Left = 0
    Top = 52
    Width = 522
    Height = 197
    Align = alClient
    BevelOuter = bvNone
    Padding.Top = 7
    Padding.Bottom = 7
    TabOrder = 3
    ExplicitWidth = 516
    ExplicitHeight = 188
    object blbReview: TLabel
      Left = 0
      Top = 7
      Width = 103
      Height = 183
      Align = alLeft
      AutoSize = False
      Caption = 'Your Review'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 1
      ExplicitTop = 8
      ExplicitHeight = 126
    end
    object pnlReviewInput: TPanel
      Left = 103
      Top = 7
      Width = 483
      Height = 183
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitHeight = 174
      object lblReviewValidationMessage: TLabel
        Left = 0
        Top = 163
        Width = 483
        Height = 20
        Align = alBottom
        Caption = 'Validation Message'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Visible = False
        ExplicitWidth = 129
      end
      object memReview: TMemo
        Left = 0
        Top = 0
        Width = 408
        Height = 163
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitHeight = 154
      end
    end
  end
end
