object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 438
  ClientWidth = 290
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TLabel
    Left = 8
    Top = 147
    Width = 44
    Height = 13
    Caption = 'Registro:'
  end
  object Label1: TLabel
    Left = 8
    Top = 21
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object Label2: TLabel
    Left = 8
    Top = 69
    Width = 37
    Height = 13
    Caption = 'Codigo:'
  end
  object Label3: TLabel
    Left = 152
    Top = 69
    Width = 100
    Height = 13
    Caption = 'Data de Nascimento:'
  end
  object edtCodigo: TEdit
    Left = 8
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtNome: TEdit
    Left = 8
    Top = 40
    Width = 265
    Height = 21
    TabOrder = 1
  end
  object edtDataN: TEdit
    Left = 152
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object mmRegistro: TMemo
    Left = 8
    Top = 166
    Width = 265
    Height = 225
    TabOrder = 3
  end
  object btnRegistrar: TButton
    Left = 96
    Top = 115
    Width = 81
    Height = 25
    Caption = 'Registrar'
    TabOrder = 4
    OnClick = btnRegistrarClick
  end
  object Registros: TButton
    Left = 96
    Top = 397
    Width = 81
    Height = 25
    Caption = 'Registros'
    TabOrder = 5
    OnClick = RegistrosClick
  end
end
