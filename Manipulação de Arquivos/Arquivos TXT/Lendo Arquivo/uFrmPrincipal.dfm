object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 281
  ClientWidth = 418
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
    Left = 8
    Top = 24
    Width = 135
    Height = 13
    Caption = 'Informe o nome do Arquivo:'
  end
  object edtArquivo: TEdit
    Left = 8
    Top = 43
    Width = 402
    Height = 21
    TabOrder = 0
  end
  object btnLeitura: TButton
    Left = 8
    Top = 70
    Width = 75
    Height = 25
    Caption = 'Ler Arquivo'
    TabOrder = 1
    OnClick = btnLeituraClick
  end
  object mmArquivo: TMemo
    Left = 8
    Top = 101
    Width = 402
    Height = 172
    TabOrder = 2
  end
end
