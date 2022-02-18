program avaliacaopratica;

uses
  Vcl.Forms,
  Main in 'Main.pas' {FrmMain},
  ClientForm in 'ClientForm.pas' {FrmClientForm},
  DataModule in 'DataModule.pas' {DtmClientForm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
