unit uCEP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, Data.DB, Datasnap.DBClient,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, System.UITypes;

type
  TFrmCliente = class(TForm)
    CdsClient: TClientDataSet;
    CdsClientNmClient: TStringField;
    DtsClient: TDataSource;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit10: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    CdsClientNoLograd: TStringField;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    WwwConexa: TIdHTTP;
    Panel5: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure CdsClientAfterInsert(DataSet: TDataSet);
    procedure DBEdit6Exit(Sender: TObject);
    procedure CdsClientBeforePost(DataSet: TDataSet);
    procedure CdsClientAfterPost(DataSet: TDataSet);
  private
    procedure CarregarDadosCep;
    function  CriarXmlRegistro : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCliente: TFrmCliente;

implementation

uses Json, XmlDoc, XMLIntf, Email;

{$R *.dfm}

procedure TFrmCliente.FormCreate(Sender: TObject);
begin
     CdsClient.CreateDataSet;
end;

procedure TFrmCliente.CdsClientAfterInsert(DataSet: TDataSet);
begin
      CdsClient.FieldByName('NmPais').AsString := 'Brasil';
end;

procedure TFrmCliente.CdsClientAfterPost(DataSet: TDataSet);
var lNmArquiv : String;
    lEmail    : TEmail;
    lNmUsuari : String;
    lDsSenha  : String;
begin
      lNmArquiv := CriarXmlRegistro;

      lNmUsuari := InputBox('conta gmail', 'e-mail', 'para envio do e-mail');
      lDsSenha  := InputBox('senha conta gmail', 'senha', 'para envio e-mail');

      try
          lEmail := TEmail.Create(Self);
          lEmail.EnviaEmail(lNmArquiv, CdsClient, lNmUsuari, lDsSenha);

          MessageDlg('Registro atualizado com sucesso!', mtInformation, [mbOk], 0);
      finally
           FreeAndNil(lEmail);
      end;
end;

procedure TFrmCliente.CdsClientBeforePost(DataSet: TDataSet);
begin

      if CdsClient.FieldByName('NmClient').AsString = '' then
      begin
            raise Exception.Create('Informe o nome do Cliente');
      end;

      if CdsClient.FieldByName('RgClient').AsString = '' then
      begin
            raise Exception.Create('Informe o RG');
      end;

      if CdsClient.FieldByName('NoCpf').AsString = '' then
      begin
            raise Exception.Create('Informe o CPF');
      end;

      if CdsClient.FieldByName('DsEmail').AsString = '' then
      begin
            raise Exception.Create('Informe o e-mail');
      end;

      if CdsClient.FieldByName('NoCEP').AsString = '' then
      begin
            raise Exception.Create('Informe o CEP');
      end;

      if CdsClient.FieldByName('DsLograd').AsString = '' then
      begin
            raise Exception.Create('Informe o logradouro');
      end;

      if CdsClient.FieldByName('NoLograd').AsString = '' then
      begin
            raise Exception.Create('Informe o número do logradouro');
      end;

      if CdsClient.FieldByName('NmBairro').AsString = '' then
      begin
            raise Exception.Create('Informe o bairro');
      end;

      if CdsClient.FieldByName('NmCidade').AsString = '' then
      begin
            raise Exception.Create('Informe o nome da cidade');
      end;

      if CdsClient.FieldByName('UfEstado').AsString = '' then
      begin
            raise Exception.Create('Informe o estado da cidade');
      end;

      if CdsClient.FieldByName('NmPais').AsString = '' then
      begin
            raise Exception.Create('Informe o nome do país');
      end;

end;

procedure TFrmCliente.DBEdit6Exit(Sender: TObject);
begin
      if CdsClient.State in [dsInsert, dsEdit] then
      begin
            CarregarDadosCep;
      end;
end;

procedure TFrmCliente.CarregarDadosCep;
var lTxJSon : String;
    lDsUrl  : String;
    lArJSon : TJSONArray;
    lVlJSon : TJSonValue;
begin
     if CdsClient.FieldByName('NoCep').AsString <> '' then
     begin
           // =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
           // =-= Consultando o CEP no site ViaCEP
           // =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
            try
                lDsUrl  := 'http://viacep.com.br/ws/' +
                             CdsClient.FieldByName('NoCep').AsString + '/json/';
                lTxJSon :=  WwwConexa.Get(lDsUrl);
            except
                MessageDlg('CEP não encontrado', mtError, [mbOk], 0);
            end;

            if lTxJson <> '' then
            begin
                 // =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
                 // =-= Tratando o resultado do Json
                 // =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

                 // =-=-=-=-= convertendo para array
                  lArJSon := TJSONObject.ParseJSONValue('[' +
                                                   lTxJson + ']') as TJSONArray;

                 // =-=-=-=-= carregando os valores
                  for lVlJSon in lArJSon do
                  begin
                        CdsClient.FieldByName('DsLograd').AsString :=
                                        lVlJSon.GetValue<String>('logradouro');

                        CdsClient.FieldByName('DsComple').AsString :=
                                        lVlJSon.GetValue<String>('complemento');

                        CdsClient.FieldByName('NmBairro').AsString :=
                                        lVlJSon.GetValue<String>('bairro');

                        CdsClient.FieldByName('NmCidade').AsString :=
                                        lVlJSon.GetValue<String>('localidade');

                        CdsClient.FieldByName('UfEstado').AsString :=
                                        lVlJSon.GetValue<String>('uf');
                  end;
            end;
     end;
end;

function TFrmCliente.CriarXmlRegistro : String;
var lXmlDocto : IXMLDocument;
    lNdElemen : IXMLNode;
begin
      lXmlDocto := TXMLDocument.Create(nil);
      lXmlDocto.Active := True;

      lXmlDocto.DocumentElement := lXmlDocto.CreateNode('Cliente', ntElement, '');

      lNdElemen       := lXmlDocto.DocumentElement.AddChild('Nome', -1);
      lNdElemen.Text  := CdsClient.FieldByName('NmClient').AsString;

      lNdElemen       := lXmlDocto.DocumentElement.AddChild('RG', -1);
      lNdElemen.Text  := CdsClient.FieldByName('RgClient').AsString;

      lNdElemen       := lXmlDocto.DocumentElement.AddChild('CPF', -1);
      lNdElemen.Text  := CdsClient.FieldByName('NoCpf').AsString;

      lNdElemen       := lXmlDocto.DocumentElement.AddChild('Fone', -1);
      lNdElemen.Text  := CdsClient.FieldByName('NoFone').AsString;

      lNdElemen       := lXmlDocto.DocumentElement.AddChild('e-mail', -1);
      lNdElemen.Text  := CdsClient.FieldByName('DsEmail').AsString;

      lNdElemen       := lXmlDocto.DocumentElement.AddChild('CEP', -1);
      lNdElemen.Text  := CdsClient.FieldByName('NoCep').AsString;

      lNdElemen       := lXmlDocto.DocumentElement.AddChild('Logradouro', -1);
      lNdElemen.Text  := CdsClient.FieldByName('DsLograd').AsString;

      lNdElemen       := lXmlDocto.DocumentElement.AddChild('Numero', -1);
      lNdElemen.Text  := CdsClient.FieldByName('NoLograd').AsString;

      lNdElemen       := lXmlDocto.DocumentElement.AddChild('Complemento', -1);
      lNdElemen.Text  := CdsClient.FieldByName('DsComple').AsString;

      lNdElemen       := lXmlDocto.DocumentElement.AddChild('Bairro', -1);
      lNdElemen.Text  := CdsClient.FieldByName('NmBairro').AsString;

      lNdElemen       := lXmlDocto.DocumentElement.AddChild('Cidade', -1);
      lNdElemen.Text  := CdsClient.FieldByName('NmCidade').AsString;

      lNdElemen       := lXmlDocto.DocumentElement.AddChild('Estado', -1);
      lNdElemen.Text  := CdsClient.FieldByName('UfEstado').AsString;

      lNdElemen       := lXmlDocto.DocumentElement.AddChild('Pais', -1);
      lNdElemen.Text  := CdsClient.FieldByName('NmPais').AsString;

      Result := GetCurrentDir + '\cliente.xml';

      lXmlDocto.SaveToFile(Result);
end;

end.

