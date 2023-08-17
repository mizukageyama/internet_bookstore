object LoginForm: TLoginForm
  Left = 0
  Top = 0
  Align = alTop
  AutoSize = True
  BorderStyle = bsSingle
  Caption = 'Login'
  ClientHeight = 161
  ClientWidth = 349
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object btnLogin: TButton
    Left = 248
    Top = 128
    Width = 101
    Height = 33
    Align = alRight
    Caption = 'Login'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnLoginClick
    ExplicitTop = 160
    ExplicitHeight = 19
  end
  object pnlEmail: TPanel
    Left = 0
    Top = 0
    Width = 349
    Height = 64
    Align = alTop
    BevelOuter = bvNone
    Padding.Top = 7
    Padding.Bottom = 7
    TabOrder = 1
    ExplicitTop = 177
    ExplicitWidth = 628
    object lblEmail: TLabel
      Left = 0
      Top = 7
      Width = 104
      Height = 50
      Align = alLeft
      AutoSize = False
      Caption = 'Email'
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
    object pnlEmailInput: TPanel
      Left = 104
      Top = 7
      Width = 245
      Height = 50
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 106
      ExplicitWidth = 522
      object lblEmailValidationMessage: TLabel
        Left = 0
        Top = 30
        Width = 245
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
        ExplicitWidth = 129
      end
      object edtEmail: TEdit
        Left = 0
        Top = 0
        Width = 168
        Height = 30
        Align = alLeft
        TabOrder = 0
        ExplicitHeight = 23
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 64
    Width = 349
    Height = 64
    Align = alTop
    BevelOuter = bvNone
    Padding.Top = 7
    Padding.Bottom = 7
    TabOrder = 2
    ExplicitTop = 177
    ExplicitWidth = 628
    object lblPassword: TLabel
      Left = 0
      Top = 7
      Width = 104
      Height = 50
      Align = alLeft
      AutoSize = False
      Caption = 'Password'
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
    object pnlPasswordInput: TPanel
      Left = 104
      Top = 7
      Width = 245
      Height = 50
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 106
      ExplicitWidth = 522
      object lblPasswordValidationMessage: TLabel
        Left = 0
        Top = 30
        Width = 245
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
        ExplicitWidth = 129
      end
      object edtPassword: TEdit
        Left = 0
        Top = 0
        Width = 168
        Height = 30
        Align = alLeft
        TabOrder = 0
        ExplicitHeight = 23
      end
    end
  end
end
