unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edtCodigo: TEdit;
    edtNome: TEdit;
    edtDataN: TEdit;
    mmRegistro: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnRegistrar: TButton;
    Registros: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnRegistrarClick(Sender: TObject);
    procedure RegistrosClick(Sender: TObject);
  private
    { Private declarations }
    FArq: TextFile;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnRegistrarClick(Sender: TObject);
begin
  if (edtNome.Text <> '') and
     (edtCodigo.Text <> '') and
     (edtDataN.Text <> '') then
  begin
    Writeln(FArq, edtNome.Text,          '|',
                  edtCodigo.Text,        '|',
                  edtDataN.Text,         '|');

    edtNome.Clear;
    edtCodigo.Clear;
    edtDataN.Clear;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CloseFile(FArq);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
AssignFile(FArq, 'CadastroPessoa.txt');
  {$I-}
  Reset(FArq);

  if IOResult <> 0 then
    Rewrite(FArq)
  else
  begin
    CloseFile(FArq);
    Append(FArq);
  end;
  {$I+}
end;

procedure TForm1.RegistrosClick(Sender: TObject);
var
  xLinha, xNome     : String;
  xCodigo, xReg, i  : Integer;
  xDataN            : TDateTime;
begin
  mmRegistro.Clear;
  Reset(FArq);

  try
    xReg := 0;
    while(not Eof(FArq)) do
    begin
    Readln(FArq, xLinha);

    Inc(xReg);

    //Recupera o Nome
    i := pos('|', xLinha);
    xNome := copy(xLinha, 1, i-1);
    delete(xLinha, 1, i);

    //Recupera o Codigo
    i := pos('|', xLinha);
    xCodigo := StrToIntDef(copy(xLinha, 1, i-1), 0);
    delete(xLinha, 1, i);

    //Recupera a Data de Nascimento
    i := pos('|', xLinha);
    xDataN := StrToDateDef(copy(xLinha, 1, i-1), 0);
    mmRegistro.Lines.Add('- Registro N�: ' + IntToStr(xReg));
    mmRegistro.Lines.Add('- Codigo pr�prio: ' + IntToStr(xCodigo));
    mmRegistro.Lines.Add('- Nome da pessoa: ' + xNome);
    mmRegistro.Lines.Add('- Data de Nascimento: ' + DateToStr(xDataN));

    mmRegistro.Lines.Add('-------------------------------------------------' +
                         '--------------');
    mmRegistro.Lines.Add('');
    end;
  finally
    Append(FArq);
  end;

end;

end.
