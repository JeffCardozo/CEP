unit Email;

interface

uses
  SysUtils, Classes, DbClient;

type
  TEmail = class(TComponent)
  private
    function CorpoEmail(pCdsClient: TClientDataSet): String;
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    procedure EnviaEmail(pNmArquiv: String; pCdsClient : TClientDataSet;
                         pNmUsuari : String; pDsSenha : String);
  published
    { Published declarations }
  end;

implementation

uses IdMessageClient, IdSMTPBase, IdSMTP, IdIOHandler, IdIOHandlerSocket,
     IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdMessage, IdAttachmentFile,
     IdExplicitTLSClientServerBase, IdText;

procedure TEmail.EnviaEmail(pNmArquiv: String; pCdsClient : TClientDataSet;
                            pNmUsuari : String; pDsSenha : String);
var AuthSSL : TIdSSLIOHandlerSocketOpenSSL;
    IdSMTP    : TIdSMTP;
    IdMessage : TIdMessage;
    lDsAnexo  : tIdAttachmentFile;
begin
      IdSMTP    := TIdSMTP.Create(nil);
      IdMessage := TIdMessage.Create(nil);

      try
          IdSMTP.Host     := 'smtp.gmail.com';
          IdSMTP.Port     := 465;
          IdSMTP.AuthType := satDefault;
          IdSMTP.Username := pNmUsuari;
          IdSMTP.Password := pDsSenha;
          IdSMTP.AuthType := satDefault;

          AuthSSL                   := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
          IdSMTP.IOHandler          := AuthSSL;
          IdSMTP.UseTLS             := utUseImplicitTLS;
          AuthSSL.SSLOptions.Method := sslvTLSv1;
          AuthSSL.SSLOptions.Mode   := sslmClient;

          IdMessage.From.Address               := pNmUsuari;
          IdMessage.Recipients.EMailAddresses  :=
                                  pCdsClient.FieldByName('DsEmail').AsString;
          IdMessage.Subject   := 'Atualização de cadastro de cliente';
          IdMessage.CharSet   := 'ISO-8859-1';
          IdMessage.Encoding  := meDefault;
          IdMessage.Body.Text := CorpoEmail(pCdsClient);

          IdMessage.MessageParts.Clear;
          lDsAnexo := TIdAttachmentFile.Create(IdMessage.MessageParts, pNmArquiv);
          lDsAnexo.ContentDisposition := 'attachment';

          try
              IdSMTP.Connect;
              IdSMTP.Send(IdMessage);
          except
              on E: Exception do
              begin
                    raise Exception.Create('Erro ao enviar E-Mail: ' + E.Message);
              end;
          end;
      finally
          IdSMTP.Disconnect;
          FreeAndNil(IdSMTP);
          FreeAndNil(IdMessage);
      end;
end;

function TEmail.CorpoEmail(pCdsClient : TClientDataSet) : String;
begin
      Result :=
          'Nome: '         + pCdsClient.FieldByName('NmClient').AsString + #13 +
          'RG  : '         + pCdsClient.FieldByName('RgClient').AsString + #13 +
          'CPF : '         + pCdsClient.FieldByName('NoCpf').AsString    + #13 +
          'Fone: '         + pCdsClient.FieldByName('NoFone').AsString   + #13 +
          'e-mail:'        + pCdsClient.FieldByName('DsEmail').AsString  + #13 +
          'CEP : '         + pCdsClient.FieldByName('NoCep').AsString    + #13 +
          'Logradouro: '   + pCdsClient.FieldByName('DsLograd').AsString + #13 +
          'nro : '         + pCdsClient.FieldByName('NoLograd').AsString + #13 +
          'Complemento : ' + pCdsClient.FieldByName('DsComple').AsString + #13 +
          'Bairro  : '     + pCdsClient.FieldByName('NmBairro').AsString + #13 +
          'Cidade : '      + pCdsClient.FieldByName('NmCidade').AsString + #13 +
          'UF  : '         + pCdsClient.FieldByName('UfEstado').AsString + #13 +
          'Pais : '       + pCdsClient.FieldByName('NmPais').AsString;
end;

end.

