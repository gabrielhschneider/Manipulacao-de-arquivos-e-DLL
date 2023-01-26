unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edtNomePC: TEdit;
    edtNomeUser: TEdit;
    edtDirSistema: TEdit;
    edtDirWindows: TEdit;
    edtDirTemp: TEdit;
    edtVersaoWindows: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnInformacoes: TButton;
    procedure btnInformacoesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  uInfoPC;

{$R *.dfm}

procedure TForm1.btnInformacoesClick(Sender: TObject);
begin
  edtNomePC.Text        := TInfoPc.ComputerName;
  edtNomeuser.Text      := TInfoPc.UserName;
  edtDirSistema.Text    := TInfoPc.SystemDirectory;
  edtDirWindows.Text    := TInfoPc.WindowsDirectory;
  edtDirTemp.Text       := TInfoPc.TempPath;
  edtVersaoWindows.Text := TInfoPc.VersionEx;
end;

end.
