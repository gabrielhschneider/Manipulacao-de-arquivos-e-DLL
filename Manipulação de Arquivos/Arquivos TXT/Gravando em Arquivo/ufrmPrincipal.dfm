object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 107
  ClientWidth = 156
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 8
    Width = 99
    Height = 13
    Caption = 'Informe um Numero:'
  end
  object edtNumero: TEdit
    Left = 16
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object btnTabuada: TButton
    Left = 16
    Top = 67
    Width = 121
    Height = 25
    Caption = 'Tabuada'
    TabOrder = 1
    OnClick = btnTabuadaClick
  end
end
