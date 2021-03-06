unit FrmCadastroCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, Menus, cxMaskEdit, cxDBEdit, cxTextEdit, JvExControls,
  JvEnterTab, StdCtrls, ExtCtrls, ImgList, cxButtons, cxGroupBox, ActnList, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, JvExStdCtrls, JvCombobox,
  JvDBCombobox, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxCalendar, cxMemo, ACBrBase, ACBrValidador, cxCheckBox, JvDBLookup;

type
  TFCadCliente = class(TForm)
    Botoes: TActionList;
    AcNovo: TAction;
    AcSalvar: TAction;
    AcPesquisa: TAction;
    cxGroupBox1: TcxGroupBox;
    cxButton4: TcxButton;
    cxButton1: TcxButton;
    cxGroupBox2: TcxGroupBox;
    cxButton3: TcxButton;
    cxButton2: TcxButton;
    cxButton5: TcxButton;
    ImgHabilita: TImageList;
    Panel1: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBMaskEdit2: TcxDBMaskEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    DCliente: TDataSource;
    QCliente: TZQuery;
    QClientecodigo: TIntegerField;
    QClientetipo_pessoa: TWideStringField;
    QClientecpf_cnpj: TWideStringField;
    QClientenome: TWideStringField;
    QClientecep: TWideStringField;
    QClienteendereco: TWideStringField;
    QClientebairro: TWideStringField;
    QClientecidade: TWideStringField;
    QClienteestado: TWideStringField;
    QClientetelefone: TWideStringField;
    QClientecelular: TWideStringField;
    QClienteemail: TWideStringField;
    QClienteidplano: TIntegerField;
    QClientedt_validade: TDateField;
    QClienteobservacao: TWideStringField;
    QClienteinativo: TWideStringField;
    JvDBComboBox1: TJvDBComboBox;
    Label6: TLabel;
    Label7: TLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    Label8: TLabel;
    cxDBTextEdit7: TcxDBTextEdit;
    Label9: TLabel;
    Label10: TLabel;
    cxDBTextEdit8: TcxDBTextEdit;
    Label11: TLabel;
    cxDBTextEdit9: TcxDBTextEdit;
    Label12: TLabel;
    DPesqPlano: TDataSource;
    QPesqPlano: TZQuery;
    QPesqPlanocodigo: TIntegerField;
    QPesqPlanodescricao: TWideStringField;
    QPesqPlanohorario_inicial: TTimeField;
    QPesqPlanohora_final: TTimeField;
    QPesqPlanonum_vagas: TIntegerField;
    QPesqPlanovalor_plano: TFloatField;
    QPesqPlanoinativo: TWideStringField;
    cxDBDateEdit1: TcxDBDateEdit;
    Label13: TLabel;
    cxDBMemo1: TcxDBMemo;
    Label14: TLabel;
    Valida_CPF_CNPJ: TACBrValidador;
    cxDBCheckBox1: TcxDBCheckBox;
    cxButton6: TcxButton;
    AcincluirVeiculo: TAction;
    DVeiculo: TDataSource;
    QVeiculo: TZQuery;
    QVeiculocodigo: TIntegerField;
    QVeiculocodcliente: TIntegerField;
    QVeiculoplaca: TWideStringField;
    QVeiculoveiculo: TWideStringField;
    QVeiculoinativo: TWideStringField;
    cxButton7: TcxButton;
    AcMensal: TAction;
    DMensalidade: TDataSource;
    QMensalidade: TZQuery;
    QMensalidadecodigo: TIntegerField;
    QMensalidadecodcliente: TIntegerField;
    QMensalidadedt_vencimento: TDateField;
    QMensalidadevlr_pagar: TFloatField;
    QMensalidadedt_pagamento: TDateField;
    QMensalidadevlr_pago: TFloatField;
    QMensalidadesituacao: TWideStringField;
    QMensalidadehistorico: TWideStringField;
    QVeiculoidtipoveiculo: TIntegerField;
    QDescTipoVeiculo: TZQuery;
    QDescTipoVeiculocodigo: TIntegerField;
    QDescTipoVeiculodescricao: TWideStringField;
    QDescTipoVeiculolotacao: TIntegerField;
    QDescTipoVeiculovalor_quizeminutos: TFloatField;
    QDescTipoVeiculovalor_quinzeseguintes: TFloatField;
    QDescTipoVeiculovalor_trintaminutos: TFloatField;
    QDescTipoVeiculovalor_trintaminutos_seguinte: TFloatField;
    QDescTipoVeiculoprimeiros_minutos: TIntegerField;
    QDescTipoVeiculovalor_primeiros_minutos: TFloatField;
    QDescTipoVeiculovalor_hora: TFloatField;
    QDescTipoVeiculovalor_hora_seguinte: TFloatField;
    QDescTipoVeiculovalor_pernoite: TFloatField;
    QDescTipoVeiculovalor_diaria: TFloatField;
    QDescTipoVeiculoinativo: TWideStringField;
    QVeiculoDescTipo: TStringField;
    QDescTipoVeiculocortesia: TTimeField;
    QMensalidadedt_final: TDateField;
    QMensalidadefechado: TWideStringField;
    QPesqPlanocob_valor: TWideStringField;
    JvDBLookupCombo1: TJvDBLookupCombo;
    procedure cxDBTextEdit1Exit(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure AcNovoExecute(Sender: TObject);
    procedure AcSalvarExecute(Sender: TObject);
    procedure AcPesquisaExecute(Sender: TObject);
    procedure AcincluirVeiculoExecute(Sender: TObject);
    procedure AcMensalExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadCliente: TFCadCliente;

implementation

uses
  Dados, FrmPesquisaCliente, FrmCadastroVeiculoCliente, FrmCadMensalidade;

{$R *.dfm}

procedure TFCadCliente.AcincluirVeiculoExecute(Sender: TObject);
begin
   //abre o formulario dos veiculos
   if DCliente.State in [dsInsert] then
   begin
      QCliente.Post;
      QCliente.Edit;
   end;
   QVeiculo.Open;

   Application.CreateForm(TFVeiculosCliente, FVeiculosCliente);
   FVeiculosCliente.ShowModal;
   FVeiculosCliente.Free;
end;

procedure TFCadCliente.AcMensalExecute(Sender: TObject);
begin
   //abre o formulario dos veiculos
   if DCliente.State in [dsInsert] then
   begin
      QCliente.Post;
      QCliente.Edit;
   end;
   Application.CreateForm(TFCadMensalidades, FCadMensalidades);
   FCadMensalidades.ShowModal;
   FCadMensalidades.Free;
end;

procedure TFCadCliente.AcNovoExecute(Sender: TObject);
begin
   //habila o painel dos edits
   Panel1.Enabled := True;
   //abre a tabela TB_CONTABANCARIA
   QCliente.Open;
   //incluis?o de um novo registro
   QCliente.Append;
   //joga o campo inativo = N
   QCliente.FindField('INATIVO').Value := 'N';
   //Edit da agencia recebe o focus
   JvDBComboBox1.SetFocus;
end;

procedure TFCadCliente.AcPesquisaExecute(Sender: TObject);
begin
   Application.CreateForm(TFPesqCliente, FPesqCliente);
   FPesqCliente.ShowModal;
   FPesqCliente.Free;
end;

procedure TFCadCliente.AcSalvarExecute(Sender: TObject);
begin
   //verifica se os campos est?o preenchidos
   if cxDBTextEdit1.Text = '' then
   begin
      Application.MessageBox('Informe o CPF ou CNPJ.','ATEN??O', MB_ICONEXCLAMATION+MB_OK);
      cxDBTextEdit1.SetFocus;
      Abort;
   end
   else
   begin
      if cxDBTextEdit2.Text = '  :  ' then
      begin
         Application.MessageBox('Informe a descri??o do plano.','ATEN??O', MB_ICONEXCLAMATION+MB_OK);
         cxDBTextEdit2.SetFocus;
         Abort;
      end
      else
      begin
         QCliente.Post;
         Application.MessageBox('Registro salvo com sucesso!!!.','CONFIRMA??O', MB_ICONINFORMATION+MB_OK);
         //fecha a tabela
         QCliente.Close;
         Panel1.Enabled := False;
      end;
   end;
end;

procedure TFCadCliente.cxButton4Click(Sender: TObject);
begin
   //fecha o formulario
   Close;
end;

procedure TFCadCliente.cxDBTextEdit1Exit(Sender: TObject);
begin
   if JvDBComboBox1.ItemIndex = -1 then
   begin
      Application.MessageBox('Informe o tipo de pessoa F?sica ou Jur?dica.','ATEN??O', MB_ICONEXCLAMATION+MB_OK);
      JvDBComboBox1.SetFocus;
      Abort;
   end;

   if JvDBComboBox1.ItemIndex = 0 then
   begin
      if cxDBTextEdit1.Text <> '' then
      begin
         //validar o cpf do cliente
         Valida_CPF_CNPJ.TipoDocto := docCPF;
         Valida_CPF_CNPJ.Documento := cxDBTextEdit1.Text;
         if not (Valida_CPF_CNPJ.Validar) then
         begin
            ShowMessage('O CPF n?mero ' + cxDBTextEdit1.Text + ' ? inv?lido');
            cxDBTextEdit1.SetFocus;
             Abort;
         end;
          //caso o cpf for digitado errado ocorre a mensagem de erro
          cxDBTextEdit1.Text := Valida_CPF_CNPJ.Formatar;
      end;
   end
   else
   begin
      if cxDBTextEdit1.Text <> '' then
      begin
         //validar o cpf do cliente
         Valida_CPF_CNPJ.TipoDocto := docCNPJ;
         Valida_CPF_CNPJ.Documento := cxDBTextEdit1.Text;
         if not (Valida_CPF_CNPJ.Validar) then
         begin
            ShowMessage('O CNPJ n?mero ' + cxDBTextEdit1.Text + ' ? inv?lido');
             cxDBTextEdit1.SetFocus;
             Abort;
         end;
          //caso o cpf for digitado errado ocorre a mensagem de erro
          cxDBTextEdit1.Text := Valida_CPF_CNPJ.Formatar;
      end;
   end;
end;

procedure TFCadCliente.FormActivate(Sender: TObject);
begin
   //abre a tabela de plano
   QPesqPlano.Open;
end;

procedure TFCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     //verifica se n?o esta fazendo inclus?o ou altera??o do registro
   if DCliente.State in [dsInsert, dsEdit] then
   begin
      if Application.MessageBox('Tem certeza que deseja cancelar a Altera??o ou Inclus?o?','AVISO', MB_ICONQUESTION+MB_YESNO)= IDYES then
      begin
         QCliente.Cancel;
         Close;
      end
      else
      begin
         Abort;
      end;
   end;
end;

procedure TFCadCliente.FormShow(Sender: TObject);
begin
   //desativa os campos edits para n?o deixar alterar
   Panel1.Enabled := False;
end;

end.
