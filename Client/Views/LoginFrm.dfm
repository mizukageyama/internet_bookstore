object LoginForm: TLoginForm
  Left = 0
  Top = 0
  Align = alTop
  AutoSize = True
  BorderStyle = bsSingle
  Caption = 'Login'
  ClientHeight = 151
  ClientWidth = 304
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object btnLogin: TButton
    Left = 165
    Top = 81
    Width = 139
    Height = 70
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
    ExplicitLeft = 159
    ExplicitHeight = 61
  end
  object pnlEmail: TPanel
    Left = 0
    Top = 0
    Width = 304
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Padding.Top = 7
    Padding.Bottom = 7
    TabOrder = 1
    ExplicitWidth = 298
    object lblEmail: TLabel
      Left = 0
      Top = 7
      Width = 104
      Height = 27
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
    object edtEmail: TEdit
      Left = 104
      Top = 7
      Width = 168
      Height = 27
      Align = alLeft
      TabOrder = 0
      Text = 'thanna1@mit.edu'
      ExplicitHeight = 23
    end
  end
  object pnlPassword: TPanel
    Left = 0
    Top = 41
    Width = 304
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    Padding.Top = 7
    Padding.Bottom = 7
    TabOrder = 2
    ExplicitWidth = 298
    object lblPassword: TLabel
      Left = 0
      Top = 7
      Width = 104
      Height = 26
      Align = alLeft
      AutoSize = False
      Caption = 'Password'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = -8
      ExplicitTop = 6
      ExplicitHeight = 50
    end
    object edtPassword: TEdit
      Left = 104
      Top = 7
      Width = 168
      Height = 26
      Align = alLeft
      TabOrder = 0
      Text = 'cknssmmAoD'
      ExplicitHeight = 23
    end
  end
end
