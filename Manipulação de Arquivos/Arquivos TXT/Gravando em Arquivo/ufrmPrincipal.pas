unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edtNumero: TEdit;
    btnTabuada: TButton;
    Label1: TLabel;
    procedure btnTabuadaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnTabuadaClick(Sender: TObject);
var
  xArq: TextFile;
  i, n: Integer;
begin
  try
    //Cria um arquivo "Tabuada.txt" na raiz do projeto
    AssignFile(xArq, 'Tabuada.txt');

    Rewrite(xArq);

    n := StrToIntDef(edtNumero.Text, 0);

    //Grava uma linha no arquivo
    Writeln(xArq, '+--Resultado--+');

    for I := 1 to 10 do
    begin
      //Grava uma linha da tabuada no arquivo
      Writeln(xArq, '| ', i, ' X ', n, ' = ', (i*n), '   |');
    end;

    //Grava uma linha no arquivo
    Writeln(xArq, '+--------------+');

    ShowMessage('Tabuada gravada com sucesso!');
  finally
    //Fecha o arquivo txt
    CloseFile(xArq);
  end;
end;
end.
