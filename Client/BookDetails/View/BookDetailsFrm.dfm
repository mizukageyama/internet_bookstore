object BookDetailsForm: TBookDetailsForm
  Left = 0
  Top = 0
  Caption = 'Book Details'
  ClientHeight = 449
  ClientWidth = 504
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  OnShow = FormShow
  TextHeight = 15
  object lblBookTitle: TLabel
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
  object lblSynopsis: TLabel
    Left = 0
    Top = 61
    Width = 504
    Height = 74
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
  object pnlBottom: TPanel
    Left = 0
    Top = 0
    Width = 504
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Padding.Top = 10
    TabOrder = 0
    object lblTitle: TLabel
      Left = 0
      Top = 10
      Width = 258
      Height = 30
      Align = alLeft
      Caption = 'ICONIX Internet Bookstore'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -22
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object btnWriteReview: TButton
      Left = 376
      Top = 10
      Width = 134
      Height = 31
      Align = alRight
      Caption = 'Write Review'
      TabOrder = 0
      OnClick = btnWriteReviewClick
      ExplicitLeft = 370
    end
  end
  object pnlReviews: TPanel
    Left = 0
    Top = 135
    Width = 504
    Height = 314
    Align = alBottom
    TabOrder = 1
    object lblBookReviews: TLabel
      Left = 1
      Top = 1
      Width = 104
      Height = 15
      Align = alTop
      Caption = 'Customer Reviews'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object dbgReviews: TDBGrid
      Left = 1
      Top = 16
      Width = 508
      Height = 297
      Align = alClient
      DataSource = BookstoreDataModule.dsCustomerReview
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CustomerId'
          Title.Caption = 'Customer'
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Review'
          Width = 306
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Rating'
          Visible = True
        end>
    end
  end
end
