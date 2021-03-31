program CEP;

uses
  Vcl.Forms,
  uCEP in 'uCEP.pas' {FrmCliente},
  Email in 'Email.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmCliente, FrmCliente);
  Application.Run;
end.
