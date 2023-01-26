unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    mmLeitura: TMemo;
    btnExecutar: TButton;
    XMLDocument1: TXMLDocument;
    procedure btnExecutarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnExecutarClick(Sender: TObject);
var
  xAplicacao   :IXMLNode;
  xExecutaveis :IXMLNode;
  xExecutavel  :IXMLNode;
  xBibliotecas :IXMLNode;
  xBiblioteca  :IXMLNode;
  xVersao      :IXMLNode;
  xDescricao   :IXMLNode;
  xInfNo       :IXMLNodeList;
  i            :Integer;
begin
  mmLeitura.Clear;

  //Ativa o XMLDocument para podermos ler as informa��es do xml
  XMLDocument1.Active := True;

  //Busco o n� principal do xml
  xAplicacao := XMLDocument1.DocumentElement;

  //Busca o n� onde est� a lista de execut�veis
  xExecutaveis := xAplicacao.ChildNodes.FindNode('executaveis');

  //Busca o n� onde est� a linha de bicliotecas
  xBibliotecas := xAplicacao.ChildNodes.FindNode('bibliotecas');

  mmLeitura.Lines.Add('EXECUTAVEIS');
  mmLeitura.Lines.Add('');

  //Percorre todas os executaveis
  for i := 0 to xExecutaveis.ChildNodes.Count - 1 do
  begin
    xExecutavel := xExecutaveis.ChildNodes[i];

    //Recupera os atributos do n� Executavel
    xInfNo := xExecutavel.AttributeNodes;

    mmLeitura.Lines.Add(xExecutavel.Text);
    mmLeitura.Lines.Add('-------------------');
    mmLeitura.Lines.Add('vers�o: ' + xInfNo.FindNode('versao').Text);
    mmLeitura.Lines.Add('descri��o: ' + xInfNo.FindNode('descricao').Text);
    mmLeitura.Lines.Add('');
  end;

  mmLeitura.Lines.Add('');
  mmLeitura.Lines.Add('[BIBLIOTECAS]');
  mmLeitura.Lines.Add('');

  //Percorre todas as bibliotecas
  for i := 0 to xBibliotecas.ChildNodes.Count - 1 do
  begin
    xBiblioteca := xBibliotecas.ChildNodes[i];

    //Recupera os atributos do n� biblioteca
    xInfNo := xBiblioteca.AttributeNodes;

    mmLeitura.Lines.Add(xBiblioteca.Text);
    mmLeitura.Lines.Add('-------------------');
    mmLeitura.Lines.Add('vers�o: ' + xInfNo.FindNode('versao').Text);
    mmLeitura.Lines.Add('descri��o: ' + xInfNo.FindNode('descricao').Text);
    mmLeitura.Lines.Add('');
  end;
end;

end.
