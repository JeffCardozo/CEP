program CEP;

uses
  Vcl.Forms,
  uCEP in 'uCEP.pas' {Form1},
  Email in 'Email.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
