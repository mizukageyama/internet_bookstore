object LoginView: TLoginView
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Login'
  ClientHeight = 110
  ClientWidth = 280
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pnlEmail: TPanel
    Left = 0
    Top = 0
    Width = 280
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Padding.Top = 7
    Padding.Bottom = 7
    TabOrder = 0
    ExplicitWidth = 274
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
    Width = 280
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    Padding.Top = 7
    Padding.Bottom = 7
    TabOrder = 1
    ExplicitWidth = 274
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
  object btnLogin: TButton
    Left = 141
    Top = 81
    Width = 139
    Height = 29
    Align = alRight
    Caption = 'Login'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnLoginClick
    ExplicitLeft = 135
    ExplicitHeight = 20
  end
end
