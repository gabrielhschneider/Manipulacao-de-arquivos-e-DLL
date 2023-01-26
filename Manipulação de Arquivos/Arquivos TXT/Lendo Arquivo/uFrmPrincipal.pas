unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    edtArquivo: TEdit;
    btnLeitura: TButton;
    mmArquivo: TMemo;
    procedure btnLeituraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnLeituraClick(Sender: TObject);
var
  xArq: TextFile;
  xLinha: String;
begin
  mmArquivo.Clear;
  try
    AssignFile(xArq, edtArquivo.Text);
    {$I-} //Desativa a Diretiva de input

    //Abre o arquivo para a leitura
    Reset(xArq);

    if IOResult <> 0 then
      raise Exception.Create('Erro na abertuda do arquivo!!!');

    {$I+} //Ativa a diretiva de input

    //Verifica se o arquivo atingiu a marca final de arquivo
    while (not eof(xArq)) do
    begin
      //Lê uma linha do arquivo
      Readln(xArq, xLinha);

      mmArquivo.Lines.add(xLinha);
    end;
  finally
    CloseFile(xArq);
  end;

end;

end.
