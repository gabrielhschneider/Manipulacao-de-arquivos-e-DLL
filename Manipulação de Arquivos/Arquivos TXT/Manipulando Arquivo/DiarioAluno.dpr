program DiarioAluno;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {TfrmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTfrmPrincipal, TfrmPrincipal);
  Application.Run;
end.
