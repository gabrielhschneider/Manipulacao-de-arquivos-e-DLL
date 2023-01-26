unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type

  TSoma = function (A: Double; B: Double): Double stdcall;

  TForm1 = class(TForm)
    edtNumero1: TEdit;
    edtNumero2: TEdit;
    btnCalcular: TButton;
    lblResultado: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnCalcularClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ChamarDll;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.btnCalcularClick(Sender: TObject);
begin
  self.ChamarDll;
  lblResultado.Visible := True;
end;

// Consumindo DLL explicitamente
procedure TForm1.ChamarDll;
var
  xHandle: THandle;
  xSoma: TSoma;
  xResultado: Double;
  xNum1, xNum2: Double;
begin
  if not TryStrToFloat(edtNumero1.Text, xNum1)then
    raise Exception.Create('Valor para o Numero 1 inválido!');

  if not TryStrToFloat(edtNumero2.Text, xNum2)then
    raise Exception.Create('Valor para o Numero 2 inválido!');

  xHandle := LoadLibrary('MinhaDLL.dll');
  if xHandle > 0 then
  begin
    try
      @xSoma := GetProcAddress(xHandle, 'Somar');

      if @xSoma <> nil then
      begin
        xResultado := xSoma(xNum1, xNum2);
        lblResultado.Caption := xResultado.ToString;
      end
      else
        ShowMessage('Nao foi possível carregar o procedimento da DLL');
    finally
      FreeLibrary(xHandle);
    end;
  end
  else
    ShowMessage('Não foi possivel carregar a DLL');
end;

end.
