program Garagem;

uses
  Forms,
  FrmPrincipal in 'FrmPrincipal.pas' {FPrincipal},
  Dados in 'Dados.pas' {DM: TDataModule},
  FrmCadastroPlano in 'FrmCadastroPlano.pas' {FCadPlano},
  FrmCadConvenio in 'FrmCadConvenio.pas' {FCadConvenio},
  FrmCadastroVoucher in 'FrmCadastroVoucher.pas' {FCadVouchers},
  FrmCadastroTipoVeiculo in 'FrmCadastroTipoVeiculo.pas' {FCadTipoVeiculo},
  FrmCadastroCliente in 'FrmCadastroCliente.pas' {FCadCliente},
  FrmPesquisaPlano in 'FrmPesquisaPlano.pas' {FPesquisaPlano},
  FrmPesquisaVoucher in 'FrmPesquisaVoucher.pas' {FPesqVoucher},
  FrmPesquisaConvenio in 'FrmPesquisaConvenio.pas' {FPesqConvenio},
  FrmPesquisaTipoVeiculo in 'FrmPesquisaTipoVeiculo.pas' {FPesqTpoVeiculo},
  FrmPesquisaCliente in 'FrmPesquisaCliente.pas' {FPesqCliente},
  FrmCadastroVeiculoCliente in 'FrmCadastroVeiculoCliente.pas' {FVeiculosCliente},
  FrmCadMensalidade in 'FrmCadMensalidade.pas' {FCadMensalidades},
  FrmMovimentacao in 'FrmMovimentacao.pas' {FMovimentacao},
  FrmCadEmpresa in 'FrmCadEmpresa.pas' {FCadEmpresa},
  FrmCadAnotacao in 'FrmCadAnotacao.pas' {FCadAnotacao},
  FrmPesquisaAnotacao in 'FrmPesquisaAnotacao.pas' {FPesqAnotacao},
  FrmCaixa in 'FrmCaixa.pas' {FCaixa},
  FrmLancamentoCaixa in 'FrmLancamentoCaixa.pas' {FLancamento},
  FrmConferencia in 'FrmConferencia.pas' {FConferencia},
  FrmRelatorioCaixa in 'FrmRelatorioCaixa.pas' {FRelCaixa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Controle Estacionamento';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.Run;
end.
