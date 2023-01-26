unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TTfrmPrincipal = class(TForm)
    Label1: TLabel;
    edtNome: TEdit;
    edtPrimeiraNota: TEdit;
    edtSegundaNota: TEdit;
    btnGravarAluno: TButton;
    btnLerAluno: TButton;
    mmDiario: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    procedure btnGravarAlunoClick(Sender: TObject);
    procedure btnLerAlunoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FArq: TextFile;
  public
    { Public declarations }
  end;

var
  TfrmPrincipal: TTfrmPrincipal;

implementation

uses
  System.SysUtils;

{$R *.dfm}

procedure TTfrmPrincipal.btnGravarAlunoClick(Sender: TObject);
begin
  if (edtNome.Text <> '') and
     (edtPrimeiraNota.Text <> '') and
     (edtSegundaNota.Text <> '') then
  begin
    //Grava uma linha com os dados de um aluno no arquivo
    Writeln(FArq, edtNome.Text,          '|',
                  edtPrimeiraNota.Text,  '|',
                  edtSegundaNota.Text,   '|');

    edtNome.Clear;
    edtPrimeiraNota.Clear;
    edtSegundaNota.Clear;
  end;
end;

procedure TTfrmPrincipal.btnLerAlunoClick(Sender: TObject);
var
  xLinha, xNome: String;
  xReg, i: Integer;
  xNota1, xNota2, xMedia: Double;
begin
  mmDiario.Clear;


  Reset(FArq);

  try
    xReg := 0;
    // Enquanto n�o atingir a marca final de arquivo
    while(not Eof(FArq)) do
    begin
    // l� uma linha com os dados de um aluno, do arquivo
    Readln(FArq, xLinha);

    Inc(xReg);

    //Recupera o nome do aluno
    i := pos('|', xLinha);
    xNome := copy(xLinha, 1, i-1);
    delete(xLinha, 1, i);

    //Recupera a 1� nota do aluno
    i := pos('|', xLinha);
    xNota1 := StrToFloatDef(copy(xLinha, 1, i-1), 0);
    delete(xLinha, 1, i);

    //Recupera a 2� nota do aluno
    i := pos('|', xLinha);
    xNota2 := StrToFloatDef(copy(xLinha, 1, i-1), 0);


    xMedia := (xNota1 + xNota2) / 2;
    mmDiario.Lines.Add('Registro Nro.: ' + IntToStr(xReg));
    mmDiario.Lines.Add('Nome do Aluno: ' + xNome);
    mmDiario.Lines.Add('1� Nota......: ' + FloatToStr(xNota1));
    mmDiario.Lines.Add('2� Nota......: ' + FloatToStr(xNota2));
    mmDiario.Lines.Add('M�dia........: ' + FloatToStr(xMedia));

    if (xMedia >= 7) then
      mmDiario.Lines.Add('Situa��o.....: Aprovado')
    else
      mmDiario.Lines.Add('Situa��o.....: Reprovado');

    mmDiario.Lines.Add('');
    end;
  finally
    Append(FArq);
  end;

end;

procedure TTfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CloseFile(FArq);
end;

procedure TTfrmPrincipal.FormShow(Sender: TObject);
begin
  AssignFile(FArq, 'diario.txt');
  {$I-}
  Reset(FArq);

  if IOResult <> 0 then
    Rewrite(FArq) //Arquivo n�o existente e ser� criado
  else
  begin
    CloseFile(FArq);
    Append(FArq); //O Arquivo existe e ser� aberto par sa�das adicionais
  end;
  {$I+}
end;

end.
