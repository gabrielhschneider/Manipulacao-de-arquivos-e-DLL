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
  xAtualizacao :IXMLNode;
  xExecutaveis :IXMLNode;
  xExecutavel :IXMLNode;
  xBibliotecas :IXMLNode;
  xBiblioteca :IXMLNode;
begin
  //Ativa o componente TXMLDocument
  XMLDocument1.Active := True;

  //Cria o n? principal do xml
  xAtualizacao := XMLDocument1.AddChild('atualizacao');

  //Cria o n? dos executaveis dentro do n? principal
  xExecutaveis := xAtualizacao.AddChild('executaveis');

  //Adiciona um excutavel ao n? de executaveis
  xExecutavel := xExecutaveis.AddChild('excutavel');
  xExecutavel.SetAttributeNS('versao', '', '1.0.3.22');
  xExecutavel.SetAttributeNS('descricao', '', 'Modulo gerencial');
  xExecutavel.Text := 'gerencial.exe';

  //Adiciona um excutavel ao n? de executaveis
  xExecutavel := xExecutaveis.AddChild('excutavel');
  xExecutavel.SetAttributeNS('versao', '', '1.0.3.123');
  xExecutavel.SetAttributeNS('descricao', '', 'Configuracoes de Aplicacao');
  xExecutavel.Text := 'configuracoes.exe';


  //Cria o n? das bibliotecas dentro do n? principal
  xBibliotecas := xAtualizacao.AddChild('bibliotecas');

  //Adiciona uma biblioteca ao n? de bibliotecas
  xBiblioteca := xBibliotecas.AddChild('biblioteca');
  xBiblioteca.SetAttributeNS('versao', '', '2.0.0.1');
  xBiblioteca.SetAttributeNS('descricao', '', 'Biblioteca de funcoes');
  xBiblioteca.Text := 'funcoes.dll';

  //Adiciona uma biblioteca ao n? de bibliotecas
  xBiblioteca := xBibliotecas.AddChild('biblioteca');
  xBiblioteca.SetAttributeNS('versao', '', '1.2.0.4');
  xBiblioteca.SetAttributeNS('descricao', '', 'Biblioteca com rotinas de negocios');
  xBiblioteca.Text := 'app.dll';


  mmLeitura.Lines.Text := XMLDocument1.XML.Text;
end;

end.
