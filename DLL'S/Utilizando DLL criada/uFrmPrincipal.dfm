object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 110
  ClientWidth = 366
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblResultado: TLabel
    Left = 256
    Top = 69
    Width = 102
    Height = 19
    Caption = 'lblResultado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label1: TLabel
    Left = 8
    Top = 21
    Width = 50
    Height = 13
    Caption = 'Numero 1:'
  end
  object Label2: TLabel
    Left = 144
    Top = 24
    Width = 50
    Height = 13
    Caption = 'Numero 2:'
  end
  object edtNumero1: TEdit
    Left = 8
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtNumero2: TEdit
    Left = 144
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object btnCalcular: TButton
    Left = 283
    Top = 38
    Width = 75
    Height = 25
    Caption = 'Calcular'
    TabOrder = 2
    OnClick = btnCalcularClick
  end
end
