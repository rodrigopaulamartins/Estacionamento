program Condominio;

uses
  Forms,
  FrmPrincipal in 'FrmPrincipal.pas' {FPrincipal},
  Dados in 'Dados.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Controle de Condomínios';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.Run;
end.
