object TfrmPrincipal: TTfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'TfrmPrincipal'
  ClientHeight = 465
  ClientWidth = 429
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
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 76
    Height = 13
    Caption = 'Nome do Aluno:'
  end
  object Label2: TLabel
    Left = 8
    Top = 69
    Width = 41
    Height = 13
    Caption = '1'#170' Nota:'
  end
  object Label3: TLabel
    Left = 136
    Top = 69
    Width = 41
    Height = 13
    Caption = '2'#170' Nota:'
  end
  object edtNome: TEdit
    Left = 8
    Top = 35
    Width = 413
    Height = 21
    TabOrder = 0
    Text = 'edtNome'
  end
  object edtPrimeiraNota: TEdit
    Left = 8
    Top = 88
    Width = 105
    Height = 21
    TabOrder = 1
  end
  object edtSegundaNota: TEdit
    Left = 136
    Top = 88
    Width = 105
    Height = 21
    TabOrder = 2
  end
  object btnGravarAluno: TButton
    Left = 255
    Top = 86
    Width = 75
    Height = 25
    Caption = 'Gravar Aluno'
    TabOrder = 3
    OnClick = btnGravarAlunoClick
  end
  object btnLerAluno: TButton
    Left = 346
    Top = 86
    Width = 75
    Height = 25
    Caption = 'Ler Aluno'
    TabOrder = 4
    OnClick = btnLerAlunoClick
  end
  object mmDiario: TMemo
    Left = 8
    Top = 123
    Width = 413
    Height = 334
    Lines.Strings = (
      '')
    TabOrder = 5
  end
end
