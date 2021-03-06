unit FrmMovimentacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit,
  cxMaskEdit, cxSpinEdit, cxTimeEdit, StdCtrls, Mask, JvExMask, JvSpin,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Menus, ActnList, cxButtons,
  cxListBox, cxCalc, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, IniFiles,
  JvMenus, JvExControls, JvEnterTab, JvDBLookup;

type
  TFMovimentacao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    JvTimeEdit1: TJvTimeEdit;
    Timer1: TTimer;
    cxMaskEdit1: TcxMaskEdit;
    Label1: TLabel;
    Label12: TLabel;
    DTipoVe?culo: TDataSource;
    QTipoVeiculo: TZQuery;
    cxTextEdit1: TcxTextEdit;
    Label2: TLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    Botoes: TActionList;
    AcRecibo: TAction;
    AcCaixar: TAction;
    AcApagar: TAction;
    AcConferencia: TAction;
    AcFuncao: TAction;
    cxListBox1: TcxListBox;
    cxCalcEdit1: TcxCalcEdit;
    Label3: TLabel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Timer2: TTimer;
    dsDMovimentacao: TDataSource;
    QMovimentacao: TZQuery;
    intgrfldQMovimentacaocodigo: TIntegerField;
    wdstrngfldQMovimentacaoplaca: TWideStringField;
    wdstrngfldQMovimentacaodescricao: TWideStringField;
    wdstrngfldQMovimentacaotipo_cliente: TWideStringField;
    wdstrngfldQMovimentacaosituacao: TWideStringField;
    QMovimentacaodt_inclucao: TDateField;
    QMovimentacaohora_entrada: TDateTimeField;
    QMovimentacaohora_saida: TDateTimeField;
    QMovimentacaovalor_cobrado: TFloatField;
    QMovimentacaovalor_pago: TFloatField;
    intgrfldQMovimentacaototal_hora: TIntegerField;
    cxgrdbclmnGrid1DBTableView1codigo: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1placa: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1descricao: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1tipo_cliente: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1hora_entrada: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1situacao: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1dt_inclucao: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1hora_saida: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1valor_cobrado: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1valor_pago: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1total_hora: TcxGridDBColumn;
    QEmpresa: TZQuery;
    QEmpresacodigo: TIntegerField;
    QEmpresacnpj: TWideStringField;
    QEmpresarazao_social: TWideStringField;
    QEmpresaendereco: TWideStringField;
    QEmpresacidade: TWideStringField;
    QEmpresabairro: TWideStringField;
    QEmpresacep: TWideStringField;
    QEmpresauf: TWideStringField;
    QEmpresabloq_hora_windows: TWideStringField;
    QEmpresatelefone: TWideStringField;
    QEmpresatelefone1: TWideStringField;
    JvPopupMenu1: TJvPopupMenu;
    Convnio1: TMenuItem;
    N1: TMenuItem;
    F9Voucher1: TMenuItem;
    N2: TMenuItem;
    Anotaes1: TMenuItem;
    N3: TMenuItem;
    PagamentodeMensalidades1: TMenuItem;
    JvEnterAsTab1: TJvEnterAsTab;
    QVerificaMovimentacao: TZQuery;
    QVerificaMovimentacaocodigo: TIntegerField;
    QVerificaMovimentacaoplaca: TWideStringField;
    QVerificaMovimentacaodescricao: TWideStringField;
    QVerificaMovimentacaotipo_cliente: TWideStringField;
    QVerificaMovimentacaosituacao: TWideStringField;
    QVerificaMovimentacaodt_inclucao: TDateField;
    QVerificaMovimentacaohora_entrada: TDateTimeField;
    QVerificaMovimentacaohora_saida: TDateTimeField;
    QVerificaMovimentacaovalor_cobrado: TFloatField;
    QVerificaMovimentacaovalor_pago: TFloatField;
    QVerificaMovimentacaototal_hora: TIntegerField;
    QVerificaMovimentacaotipoveiculo: TIntegerField;
    QMovimentacaotipoveiculo: TIntegerField;
    QVerificaMensalista: TZQuery;
    QVerificaMensalistacodigo: TIntegerField;
    QVerificaMensalistacodcliente: TIntegerField;
    QVerificaMensalistaplaca: TWideStringField;
    QVerificaMensalistaveiculo: TWideStringField;
    QVerificaMensalistainativo: TWideStringField;
    QVerificaMensalistaIDPLANO: TIntegerField;
    QVerificaMensalistaDESCRICAO: TWideStringField;
    QVerificaMensalistaVALOR_PLANO: TFloatField;
    QVerificaMensalistaDT_VALIDADE: TDateField;
    QVerificaMensalistaidtipoveiculo: TIntegerField;
    QVerificaMensalistaNOME: TWideStringField;
    QVerificaAnotacao: TZQuery;
    intgrfldQVerificaAnotacaocodigo: TIntegerField;
    intgrfldQVerificaAnotacaocod_cliente: TIntegerField;
    wdstrngfldQVerificaAnotacaoplaca: TWideStringField;
    wdstrngfldQVerificaAnotacaomensagem: TWideStringField;
    wdstrngfldQVerificaAnotacaopermite_entrada: TWideStringField;
    wdstrngfldQVerificaAnotacaoimprimi_cupom: TWideStringField;
    wdstrngfldQVerificaAnotacaoinativo: TWideStringField;
    intgrfldQMovimentacaocodconvenio: TIntegerField;
    QMovimentacaovalor_desconto: TFloatField;
    QCaixa: TZQuery;
    dsDCaixa: TDataSource;
    intgrfldQCaixacodigo: TIntegerField;
    wdstrngfldQCaixadescricao: TWideStringField;
    wdstrngfldQCaixatipo: TWideStringField;
    QCaixavalor_pago: TFloatField;
    wdstrngfldQCaixafechado: TWideStringField;
    QCaixadt_entrada: TDateField;
    QCaixavalor_saida: TFloatField;
    JvDBLookupCombo1: TJvDBLookupCombo;
    QCalculaHora: TZQuery;
    QCalculaHoraHORAS: TLargeintField;
    QCalculaHoraMinutos: TLargeintField;
    QLocalizatipo: TZQuery;
    QLocalizatipocodigo: TIntegerField;
    QLocalizatipodescricao: TWideStringField;
    QLocalizatipolotacao: TIntegerField;
    QLocalizatipovalor_quizeminutos: TFloatField;
    QLocalizatipovalor_quinzeseguintes: TFloatField;
    QLocalizatipovalor_trintaminutos: TFloatField;
    QLocalizatipovalor_trintaminutos_seguinte: TFloatField;
    QLocalizatipoprimeiros_minutos: TIntegerField;
    QLocalizatipovalor_primeiros_minutos: TFloatField;
    QLocalizatipovalor_hora: TFloatField;
    QLocalizatipovalor_hora_seguinte: TFloatField;
    QLocalizatipovalor_pernoite: TFloatField;
    QLocalizatipovalor_diaria: TFloatField;
    QLocalizatipoinativo: TWideStringField;
    QCalculaHoraHORACHEIA: TLargeintField;
    cxCalcEdit2: TcxCalcEdit;
    QEmpresafuncionamento: TWideStringField;
    QCaixaidmovimentacao: TIntegerField;
    QCalculaHoraSEGUNDO: TTimeField;
    QLocalizatipocortesia: TTimeField;
    Label4: TLabel;
    JvDBLookupCombo2: TJvDBLookupCombo;
    CheckBox1: TCheckBox;
    DPlano: TDataSource;
    QPlano: TZQuery;
    QPlanocodigo: TIntegerField;
    QPlanodescricao: TWideStringField;
    QPlanohorario_inicial: TTimeField;
    QPlanohora_final: TTimeField;
    QPlanonum_vagas: TIntegerField;
    QPlanovalor_plano: TFloatField;
    QPlanoinativo: TWideStringField;
    QPlanocob_valor: TWideStringField;
    QMovimentacaoidplano: TIntegerField;
    QVerificaPlano: TZQuery;
    QVerificaPlanocodigo: TIntegerField;
    QVerificaPlanodescricao: TWideStringField;
    QVerificaPlanohorario_inicial: TTimeField;
    QVerificaPlanohora_final: TTimeField;
    QVerificaPlanonum_vagas: TIntegerField;
    QVerificaPlanovalor_plano: TFloatField;
    QVerificaPlanoinativo: TWideStringField;
    QVerificaPlanocob_valor: TWideStringField;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AcApagarExecute(Sender: TObject);
    procedure AcReciboExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cxTextEdit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxMaskEdit1Exit(Sender: TObject);
    procedure Anotaes1Click(Sender: TObject);
    procedure Convnio1Click(Sender: TObject);
    procedure F9Voucher1Click(Sender: TObject);
    procedure JvDBLookupCombo1Enter(Sender: TObject);
    procedure JvDBLookupCombo1Exit(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxCalcEdit1Exit(Sender: TObject);
    procedure AcConferenciaExecute(Sender: TObject);
    procedure AcCaixarExecute(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
protected
    procedure WMTimeChange(var Msg: TMessage) ; message WM_TIMECHANGE;
  private
    { Private declarations }
    isTimeChangeEventShowing: Boolean;
  public
    { Public declarations }
  end;

var
  FMovimentacao: TFMovimentacao;

implementation

uses
  Dados, FrmCadAnotacao, FrmCadConvenio, FrmPesquisaConvenio, FrmPesquisaVoucher, FrmCaixa, FrmConferencia;

{$R *.dfm}

procedure TFMovimentacao.AcApagarExecute(Sender: TObject);
begin
   //apgar movimento
   if Application.MessageBox('Tem certeza que deseja apagar o registo do movimento?','ATEN??O', MB_ICONQUESTION+MB_YESNO)=IDYES then
   begin
      QMovimentacao.Edit;
      QMovimentacao.FindField('SITUACAO').Value := 'C';
      QMovimentacao.Post;

      QMovimentacao.Close;
      QMovimentacao.SQL.Clear;
      QMovimentacao.SQL.Add('SELECT * FROM TB_MOVIMENTACAO');
      QMovimentacao.SQL.Add('WHERE DT_INCLUCAO = :DATA1');
      QMovimentacao.SQL.Add('AND SITUACAO = '+#39+'A'+#39);
      QMovimentacao.ParamByName('DATA1').AsDate := Date;
      QMovimentacao.Open;
      cxMaskEdit1.SetFocus;
   end;
end;

procedure TFMovimentacao.AcCaixarExecute(Sender: TObject);
begin
   //abre a tabela do caixa
   Application.CreateForm(TFCaixa, FCaixa);
   FCaixa.ShowModal;
   FCaixa.Free;
end;

procedure TFMovimentacao.AcConferenciaExecute(Sender: TObject);
begin
   Application.CreateForm(TFConferencia, FConferencia);
   FConferencia.ShowModal;
   FConferencia.Free;
end;

procedure TFMovimentacao.AcReciboExecute(Sender: TObject);
const
  IPula   = #13;       //Pula 1 linha
  IEspac1 = #27#48;    //Define espa?amento entre linhas de 1/8"
  IEspac2 = #27#49;    //Define espa?amento entre linhas de 7/72"
  IEspac3 = #27#50;    //Define espa?amento entre linhas de 1/6"
  IEject  = #12;       //Ejeta p?gina
  I80car  = #27#80#18; //Imprime com 80 colunas
  I96car  = #27#77#18; //Imprime com 96 colunas
  I137car = #27#80#15; //Imprime com 137 colunas
  I160car = #27#77#15; //Imprime com 160 colunas
  IDuploG = #27#14#18; //Imprime em caracter grande largura dupla
  IDuploP = #27#14#15; //Imprime em caracter pequeno largura dupla
  IDuploC = #27#20;    //Cancela largura dupla
  INegAti = #27#71;    //Imprime em negrito
  INegDes = #27#72;    //Cancela modo negrito
  IItaAti = #27#52;    //Imprime em It?lico
  IItaDes = #27#53;    //Cancela modo It?lico
var
   iniConf: TIniFile;
   Arquivo : TextFile;
   sPorta: String;
begin
   //abre o arquivo ini para verificar a porta da impressora
   iniConf     := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Garagem.ini');
   sPorta    := iniConf.ReadString('Impressora','Porta','');

   AssignFile(Arquivo,sPorta);
   Rewrite(Arquivo);
   //inicia a impress?o da etiqueta
   Writeln(Arquivo,I80car+INegAti+'    '+QEmpresa.FieldByName('RAZAO_SOCIAL').Text+INegDes);
   Writeln(Arquivo,I96car+'    '+QEmpresa.FieldByName('CNPJ'               ).Text);
   Writeln(Arquivo,I96car+'_____________________________________________');
   Writeln(Arquivo,I96car+'    '+'OBRIGADO, VOLTE SEMPRE!');
   Writeln(Arquivo,I96car+'    '+QEmpresa.FieldByName('TELEFONE'           ).Text);
   Writeln(Arquivo,I96car+'_____________________________________________');
   Writeln(Arquivo,IDuploG+INegAti+'    '+QMovimentacao.FieldByName('PLACA'    ).Text+INegDes+IDuploC);
   Writeln(Arquivo,IDuploP+INegAti+'    '+QMovimentacao.FieldByName('DESCRICAO').Text+INegDes+IDuploC);
   Writeln(Arquivo,I96car+'    '+'Tipo.....: ' + QTipoVeiculo.FieldByName('DESCRICAO').Text);
   Writeln(Arquivo,I96car+'    '+'Ticket...: ' + QMovimentacao.FieldByName('CODIGO'  ).Text);
   Writeln(Arquivo,I96car+'    '+'Data/Hora: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',QMovimentacao.FieldByName('HORA_ENTRADA').AsDateTime));
   Writeln(Arquivo,I137car+'    '+'Indispensavel a apresentacao deste');
   Writeln(Arquivo,I137car+'    '+'cupom para a retirada do veiculo');
   Writeln(Arquivo,I96car+'_____________________________________________');
   WriteLn(Arquivo,IPula);
   Writeln(Arquivo,I96car+'    '+QEmpresa.FieldByName('FUNCIONAMENTO').Text);
   Writeln(Arquivo,I96car+'_____________________________________________');
   WriteLn(Arquivo,IPula);
   WriteLn(Arquivo,IPula);
   WriteLn(Arquivo,IPula);
   WriteLn(Arquivo,IPula);
   WriteLn(Arquivo,IPula);
   WriteLn(Arquivo,IPula);
   WriteLn(Arquivo,IPula);
   WriteLn(Arquivo,IPula);
   WriteLn(Arquivo,IPula);
   CloseFile(Arquivo);
end;

procedure TFMovimentacao.Anotaes1Click(Sender: TObject);
begin
   Application.CreateForm(TFCadAnotacao, FCadAnotacao);
   //mensagem para poder fazer o troco
   QMovimentacao.Edit;
   QMovimentacao.FindField('SITUACAO'    ).Value := 'N';
   QMovimentacao.FindField('TIPO_CLIENTE').Value := 'I';
   QMovimentacao.Post;
   FCadAnotacao.Tag := 1;
   FCadAnotacao.ShowModal;
   FCadAnotacao.Free;
end;

procedure TFMovimentacao.CheckBox1Click(Sender: TObject);
begin
   if CheckBox1.State = cbChecked then
      QPlano.Open
   else
      QPlano.Close;
end;

procedure TFMovimentacao.Convnio1Click(Sender: TObject);
begin
   Application.CreateForm(TFPesqConvenio, FPesqConvenio);
   FPesqConvenio.Tag := 1;
   FPesqConvenio.ShowModal;
   FPesqConvenio.Free;
end;

procedure TFMovimentacao.cxCalcEdit1Exit(Sender: TObject);
var
mensagem: string;
troco : Currency;
begin
   //verifico se existe o valor do rececimento informado
   if (cxCalcEdit1.Value < 0) OR  (cxCalcEdit1.Value = 0.00)then
   begin
      Application.MessageBox('Informe um valor de recebimento.','ATEN??O', MB_ICONEXCLAMATION+MB_OK);
      cxCalcEdit1.SetFocus;
      Abort;
   end;
   //mensagem para poder fazer o troco
   QMovimentacao.Edit;
   if QMovimentacao.FindField('TIPO_CLIENTE').Value = 'D' then
      QMovimentacao.FindField('VALOR_COBRADO').Value := QPlano.FindField('VALOR_PLANO').Value
   else
      QMovimentacao.FindField('VALOR_COBRADO').Value := cxCalcEdit2.Value;
   QMovimentacao.Post;
   troco     := (cxCalcEdit1.Value - cxCalcEdit2.Value);
   mensagem  := 'TROCO = ' + FormatFloat('###,###,#0.00',troco);
   Application.MessageBox(PCHAR(mensagem),'TROCO', MB_ICONINFORMATION+MB_OK);
   //adiciona a tabela do caixa
   QCaixa.Open;
   QCaixa.Append;
   QCaixa.FindField('DESCRICAO'     ).Value := 'SAIDA DO VEICULO (' +cxMaskEdit1.Text+')';
   QCaixa.FindField('TIPO'          ).Value := QMovimentacao.FindField('TIPO_CLIENTE').Value;
   QCaixa.FindField('VALOR_PAGO'    ).Value := cxCalcEdit2.Value;
   QCaixa.FindField('DT_ENTRADA'    ).Value := QMovimentacao.FindField('DT_INCLUCAO' ).Value;
   QCaixa.FindField('IDMOVIMENTACAO').Value := QMovimentacao.FindField('CODIGO'      ).Value;
   QCaixa.FindField('FECHADO'       ).Value := 'A';
   QCaixa.Post;

   QMovimentacao.Close;
   QMovimentacao.SQL.Clear;
   QMovimentacao.SQL.Add('SELECT * FROM TB_MOVIMENTACAO');
   QMovimentacao.SQL.Add('WHERE DT_INCLUCAO = :DATA1');
   QMovimentacao.SQL.Add('AND SITUACAO = '+#39+'A'+#39);
   QMovimentacao.ParamByName('DATA1').AsDate := Date;
   QMovimentacao.Open;
   cxMaskEdit1.SetFocus;

   cxMaskEdit1.Clear;
   JvDBLookupCombo1.ClearValue;
   cxTextEdit1.Clear;
   cxCalcEdit1.Clear;
   cxCalcEdit2.Clear;
   cxListBox1.Clear;
   cxListBox1.Items.Add('Tempo: 00:00 ');
   cxListBox1.Items.Add('');
   cxListBox1.Items.Add('');
   cxListBox1.Items.Add('');
   cxListBox1.Items.Add('');
   cxListBox1.Items.Add('');
   cxListBox1.Items.Add('');
   cxListBox1.Items.Add('');
   cxListBox1.Items.Add('');
   cxListBox1.Items.Add('');
   cxListBox1.Items.Add('');
   cxListBox1.Items.Add('Total: 0.00' );
   cxMaskEdit1.SetFocus;
end;

procedure TFMovimentacao.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
const
  IPula   = #13;       //Pula 1 linha
  IEspac1 = #27#48;    //Define espa?amento entre linhas de 1/8"
  IEspac2 = #27#49;    //Define espa?amento entre linhas de 7/72"
  IEspac3 = #27#50;    //Define espa?amento entre linhas de 1/6"
  IEject  = #12;       //Ejeta p?gina
  I80car  = #27#80#18; //Imprime com 80 colunas
  I96car  = #27#77#18; //Imprime com 96 colunas
  I137car = #27#80#15; //Imprime com 137 colunas
  I160car = #27#77#15; //Imprime com 160 colunas
  IDuploG = #27#14#18; //Imprime em caracter grande largura dupla
  IDuploP = #27#14#15; //Imprime em caracter pequeno largura dupla
  IDuploC = #27#20;    //Cancela largura dupla
  INegAti = #27#71;    //Imprime em negrito
  INegDes = #27#72;    //Cancela modo negrito
  IItaAti = #27#52;    //Imprime em It?lico
  IItaDes = #27#53;    //Cancela modo It?lico
var
  iniConf: TIniFile;
  Arquivo : TextFile;
  sPorta: String;
  vlrquizeminutos, vlrtrintaminutos, vlrprimeiromin, vlrhora, vlrpagar: Currency;
  totalhora:string;
begin
   if QMovimentacao.FindField('TIPO_CLIENTE').Value = 'M' then
   begin
      //grava para fazder o calculo da hora conforme solicita??o
      QMovimentacao.Edit;
      QMovimentacao.FindField('HORA_SAIDA').Value := FormatDateTime('dd/mm/yyyy hh:nn:ss',now);
      QMovimentacao.FindField('SITUACAO'  ).Value := 'P';
      QMovimentacao.Post;

      QMovimentacao.Close;
      QMovimentacao.SQL.Clear;
      QMovimentacao.SQL.Add('SELECT * FROM TB_MOVIMENTACAO');
      QMovimentacao.SQL.Add('WHERE DT_INCLUCAO = :DATA1');
      QMovimentacao.SQL.Add('AND SITUACAO = '+#39+'A'+#39);
      QMovimentacao.ParamByName('DATA1').AsDate := Date;
      QMovimentacao.Open;

      cxMaskEdit1.Clear;
      JvDBLookupCombo1.ClearValue;
      cxTextEdit1.Clear;
      cxMaskEdit1.SetFocus;
   end
   else
   begin
      //grava para fazder o calculo da hora conforme solicita??o
      QMovimentacao.Edit;
      QMovimentacao.FindField('HORA_SAIDA').Value := FormatDateTime('dd/mm/yyyy hh:nn:ss',now);
      QMovimentacao.FindField('SITUACAO'  ).Value := 'P';
      QMovimentacao.Post;
      //calculo da hora para efetura a cobran?a
      QCalculaHora.Close;
      QCalculaHora.SQL.Clear;
      QCalculaHora.SQL.Add('SELECT CODIGO, ');
      QCalculaHora.SQL.Add('SUM(CEILING((TIMESTAMPDIFF(MINUTE,HORA_ENTRADA,HORA_SAIDA)/60))) AS HORACHEIA,');
      QCalculaHora.SQL.Add('FLOOR(TIMESTAMPDIFF(SECOND,HORA_ENTRADA,HORA_SAIDA) / 3600) AS HORAS,');
      QCalculaHora.SQL.Add('FLOOR((TIMESTAMPDIFF(SECOND,HORA_ENTRADA,HORA_SAIDA)-((FLOOR(TIMESTAMPDIFF(SECOND, HORA_ENTRADA, HORA_SAIDA) / 3600)) * 3600))  / 60) as Minutos,');
      QCalculaHora.SQL.Add('SEC_TO_TIME( TIMESTAMPDIFF(SECOND, HORA_ENTRADA,HORA_SAIDA)) AS SEGUNDO');
      QCalculaHora.SQL.Add('FROM TB_MOVIMENTACAO');
      QCalculaHora.SQL.Add('WHERE CODIGO ='+#39+QMovimentacao.FieldByName('CODIGO').Text+#39);
      QCalculaHora.SQL.Add('GROUP BY CODIGO');
      QCalculaHora.Open;
      //Localiza o ?tipo de ve?culo para efetuar a cobran?a
      QLocalizatipo.Close;
      QLocalizatipo.SQL.Clear;
      QLocalizatipo.SQL.Add('SELECT * FROM TB_TIPOVEICULO');
      QLocalizatipo.SQL.Add('WHERE CODIGO ='+#39+QMovimentacao.FindField('TIPOVEICULO').Text+#39);
      QLocalizatipo.Open;
      //recebe os dados para poder fazer o recebimento
      totalhora              := QCalculaHora.FieldByName('SEGUNDO').Text;
      cxMaskEdit1.Text       := QMovimentacao.FindField('PLACA'      ).Value;
      JvDBLookupCombo1.Value := QMovimentacao.FindField('TIPOVEICULO').Value;
      cxTextEdit1.Text       := QMovimentacao.FindField('DESCRICAO'  ).Value;
      //verifica se o cliente ? diarista
      if QMovimentacao.FindField('TIPO_CLIENTE').Value = 'D' then
      begin
         QVerificaPlano.Close;
         QVerificaPlano.SQL.Clear;
         QVerificaPlano.SQL.Add('SELECT * FROM TB_PLANO');
         QVerificaPlano.SQL.Add('WHERE CODIGO ='+#39+QMovimentacao.FieldByName('IDPLANO').Text+#39);
         QVerificaPlano.Open;
         vlrhora := QVerificaPlano.FindField('VALOR_PLANO').Value;
         cxListBox1.Clear;
         cxListBox1.Items.Add('Tempo: ' +totalhora);
         cxListBox1.Items.Add('');
         cxListBox1.Items.Add('');
         cxListBox1.Items.Add('');
         cxListBox1.Items.Add('');
         cxListBox1.Items.Add('');
         cxListBox1.Items.Add('');
         cxListBox1.Items.Add('');
         cxListBox1.Items.Add('');
         cxListBox1.Items.Add('');
         cxListBox1.Items.Add('');
         cxListBox1.Items.Add('Total: ' +FormatFloat('###,###,#0.00',vlrhora));
         //inicia a impress?o
         iniConf     := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Garagem.ini');
         sPorta    := iniConf.ReadString('Impressora','Porta','');
         AssignFile(Arquivo,sPorta);
         Rewrite(Arquivo);
         //inicia a impress?o da etiqueta
         Writeln(Arquivo,I80car+INegAti+'    '+QEmpresa.FieldByName('RAZAO_SOCIAL').Text+INegDes);
         Writeln(Arquivo,I96car+'    '+QEmpresa.FieldByName('CNPJ'               ).Text);
         Writeln(Arquivo,I96car+'_____________________________________________');
         Writeln(Arquivo,I96car+'    '+'OBRIGADO, VOLTE SEMPRE!');
         Writeln(Arquivo,I96car+'    '+QEmpresa.FieldByName('TELEFONE'           ).Text);
         Writeln(Arquivo,I96car+'_____________________________________________');
         Writeln(Arquivo,IDuploG+INegAti+'    '+QMovimentacao.FieldByName('PLACA'    ).Text+INegDes+IDuploC);
         Writeln(Arquivo,IDuploP+INegAti+'    '+QMovimentacao.FieldByName('DESCRICAO').Text+INegDes+IDuploC);
         Writeln(Arquivo,I96car+'    '+'Tipo......: ' + QTipoVeiculo.FieldByName('DESCRICAO').Text);
         Writeln(Arquivo,I96car+'    '+'Ticket....: ' + QMovimentacao.FieldByName('CODIGO'  ).Text);
         Writeln(Arquivo,I96car+'    '+'Data/Hora.: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',QMovimentacao.FieldByName('HORA_ENTRADA').AsDateTime));
         Writeln(Arquivo,I96car+'    '+'Data/Sa?da: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',QMovimentacao.FieldByName('HORA_SAIDA'  ).AsDateTime));
         Writeln(Arquivo,I96car+'    '+'Total Horas: '+ totalhora);
         Writeln(Arquivo,I137car+'   '+'Valor a Pagar: ' + FormatFloat('###,###,#0.00',vlrhora));
         Writeln(Arquivo,I96car+'_____________________________________________');
         WriteLn(Arquivo,IPula);
         Writeln(Arquivo,I96car+'    '+QEmpresa.FieldByName('FUNCIONAMENTO').Text);
         Writeln(Arquivo,I96car+'_____________________________________________');
         WriteLn(Arquivo,IPula);
         WriteLn(Arquivo,IPula);
         WriteLn(Arquivo,IPula);
         WriteLn(Arquivo,IPula);
         WriteLn(Arquivo,IPula);
         WriteLn(Arquivo,IPula);
         WriteLn(Arquivo,IPula);
         WriteLn(Arquivo,IPula);
         WriteLn(Arquivo,IPula);
         cxCalcEdit1.SetFocus;
         CloseFile(Arquivo);
         cxCalcEdit1.SetFocus;
         cxCalcEdit2.Value := vlrhora;
         Abort;
      end
      else
      begin
          //verifica as informa??es sobre a cortesia
          if QLocalizatipo.FindField('CORTESIA').Value <> '00:00:00' then
          begin
             if  (QCalculaHora.FindField('SEGUNDO').Value <= QLocalizatipo.FindField('CORTESIA').Value)  then
             begin
                Application.MessageBox('Cliente cortesia.','CORTESIA', MB_ICONINFORMATION+MB_OK);
                cxListBox1.Clear;
                cxListBox1.Items.Add('Tempo: ' +totalhora);
                cxListBox1.Items.Add('');
                cxListBox1.Items.Add('');
                cxListBox1.Items.Add('');
                cxListBox1.Items.Add('');
                cxListBox1.Items.Add('');
                cxListBox1.Items.Add('');
                cxListBox1.Items.Add('');
                cxListBox1.Items.Add('');
                cxListBox1.Items.Add('');
                cxListBox1.Items.Add('');
                cxListBox1.Items.Add('Total: 0.00' );
                //imprimir o cupom cortesia para o cliente
                iniConf     := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Garagem.ini');
                sPorta    := iniConf.ReadString('Impressora','Porta','');
                AssignFile(Arquivo,sPorta);
                Rewrite(Arquivo);
                //inicia a impress?o da etiqueta
                Writeln(Arquivo,I80car+INegAti+'    '+QEmpresa.FieldByName('RAZAO_SOCIAL').Text+INegDes);
                Writeln(Arquivo,I96car+'    '+QEmpresa.FieldByName('CNPJ'               ).Text);
                Writeln(Arquivo,I96car+'_____________________________________________');
                Writeln(Arquivo,I96car+'    '+'OBRIGADO, VOLTE SEMPRE!');
                Writeln(Arquivo,I96car+'    '+QEmpresa.FieldByName('TELEFONE'           ).Text);
                Writeln(Arquivo,I96car+'_____________________________________________');
                Writeln(Arquivo,IDuploG+INegAti+'    '+QMovimentacao.FieldByName('PLACA'    ).Text+INegDes+IDuploC);
                Writeln(Arquivo,IDuploP+INegAti+'    '+QMovimentacao.FieldByName('DESCRICAO').Text+INegDes+IDuploC);
                Writeln(Arquivo,I96car+'    '+'Tipo......: ' + QTipoVeiculo.FieldByName('DESCRICAO').Text);
                Writeln(Arquivo,I96car+'    '+'Ticket....: ' + QMovimentacao.FieldByName('CODIGO'  ).Text);
                Writeln(Arquivo,I96car+'    '+'Data/Hora.: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',QMovimentacao.FieldByName('HORA_ENTRADA').AsDateTime));
                Writeln(Arquivo,I96car+'    '+'Data/Sa?da: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',QMovimentacao.FieldByName('HORA_SAIDA'  ).AsDateTime));
                Writeln(Arquivo,I137car+'    '+'Voc? n?o atingiu o tempo m?nimo para cobran?a');
                Writeln(Arquivo,I96car+'_____________________________________________');
                WriteLn(Arquivo,IPula);
                Writeln(Arquivo,I96car+'    '+QEmpresa.FieldByName('FUNCIONAMENTO').Text);
                Writeln(Arquivo,I96car+'_____________________________________________');
                WriteLn(Arquivo,IPula);
                WriteLn(Arquivo,IPula);
                WriteLn(Arquivo,IPula);
                WriteLn(Arquivo,IPula);
                WriteLn(Arquivo,IPula);
                WriteLn(Arquivo,IPula);
                WriteLn(Arquivo,IPula);
                WriteLn(Arquivo,IPula);
                WriteLn(Arquivo,IPula);
                CloseFile(Arquivo);
                QMovimentacao.Edit;
                QMovimentacao.FindField('SITUACAO'  ).Value := 'R';
                QMovimentacao.Post;

                cxMaskEdit1.Clear;
                JvDBLookupCombo1.ClearValue;
                cxTextEdit1.Clear;
                cxMaskEdit1.SetFocus;
                QMovimentacao.Close;
                QMovimentacao.SQL.Clear;
                QMovimentacao.SQL.Add('SELECT * FROM TB_MOVIMENTACAO');
                QMovimentacao.SQL.Add('WHERE DT_INCLUCAO = :DATA1');
                QMovimentacao.SQL.Add('AND SITUACAO = '+#39+'A'+#39);
                QMovimentacao.ParamByName('DATA1').AsDate := Date;
                QMovimentacao.Open;

                Abort;
             end;
          end;
          //verifica os valores de 15 minutos
          if (QLocalizatipo.FindField('VALOR_QUIZEMINUTOS').Value <> 0) then
          begin
             if  (QCalculaHora.FindField('SEGUNDO').Value   <= StrToTime('00:15:00'))  then
             begin
                vlrquizeminutos := QLocalizatipo.FindField('VALOR_QUIZEMINUTOS').Value;
                cxListBox1.Clear;
                cxListBox1.Items.Add('Tempo: ' +totalhora);
                cxListBox1.Items.Add('');
                cxListBox1.Items.Add('');
                cxListBox1.Items.Add('');
                cxListBox1.Items.Add('');
                cxListBox1.Items.Add('');
                cxListBox1.Items.Add('');
                cxListBox1.Items.Add('');
                cxListBox1.Items.Add('');
                cxListBox1.Items.Add('');
                cxListBox1.Items.Add('');
                cxListBox1.Items.Add('Total: ' +FormatFloat('###,###,#0.00',vlrquizeminutos));
                //inicia a impress?o
                iniConf     := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Garagem.ini');
                sPorta    := iniConf.ReadString('Impressora','Porta','');
                AssignFile(Arquivo,sPorta);
                Rewrite(Arquivo);
                //inicia a impress?o da etiqueta
                Writeln(Arquivo,I80car+INegAti+'    '+QEmpresa.FieldByName('RAZAO_SOCIAL').Text+INegDes);
                Writeln(Arquivo,I96car+'    '+QEmpresa.FieldByName('CNPJ'               ).Text);
                Writeln(Arquivo,I96car+'_____________________________________________');
                Writeln(Arquivo,I96car+'    '+'OBRIGADO, VOLTE SEMPRE!');
                Writeln(Arquivo,I96car+'    '+QEmpresa.FieldByName('TELEFONE'           ).Text);
                Writeln(Arquivo,I96car+'_____________________________________________');
                Writeln(Arquivo,IDuploG+INegAti+'    '+QMovimentacao.FieldByName('PLACA'    ).Text+INegDes+IDuploC);
                Writeln(Arquivo,IDuploP+INegAti+'    '+QMovimentacao.FieldByName('DESCRICAO').Text+INegDes+IDuploC);
                Writeln(Arquivo,I96car+'    '+'Tipo......: ' + QTipoVeiculo.FieldByName('DESCRICAO').Text);
                Writeln(Arquivo,I96car+'    '+'Ticket....: ' + QMovimentacao.FieldByName('CODIGO'  ).Text);
                Writeln(Arquivo,I96car+'    '+'Data/Hora.: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',QMovimentacao.FieldByName('HORA_ENTRADA').AsDateTime));
                Writeln(Arquivo,I96car+'    '+'Data/Sa?da: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',QMovimentacao.FieldByName('HORA_SAIDA'  ).AsDateTime));
                Writeln(Arquivo,I96car+'    '+'Total Horas: '+ totalhora);
                Writeln(Arquivo,I137car+'   '+'Valor a Pagar: ' + FormatFloat('###,###,#0.00',vlrquizeminutos));
                Writeln(Arquivo,I96car+'_____________________________________________');
                WriteLn(Arquivo,IPula);
                Writeln(Arquivo,I96car+'    '+QEmpresa.FieldByName('FUNCIONAMENTO').Text);
                Writeln(Arquivo,I96car+'_____________________________________________');
                WriteLn(Arquivo,IPula);
                WriteLn(Arquivo,IPula);
                WriteLn(Arquivo,IPula);
                WriteLn(Arquivo,IPula);
                WriteLn(Arquivo,IPula);
                WriteLn(Arquivo,IPula);
                WriteLn(Arquivo,IPula);
                WriteLn(Arquivo,IPula);
                WriteLn(Arquivo,IPula);
                CloseFile(Arquivo);
                cxCalcEdit1.SetFocus;
                cxCalcEdit2.Value := vlrquizeminutos;
                Abort;
             end;
          end;
          if (QLocalizatipo.FindField('VALOR_TRINTAMINUTOS').Value <> 0) then
          begin
             if (QCalculaHora.FindField('SEGUNDO').Value   <= StrToTime('00:30:00')) then
             begin
                vlrtrintaminutos := QLocalizatipo.FindField('VALOR_TRINTAMINUTOS'  ).Value;
                cxListBox1.Clear;
                cxListBox1.Items.Add('Tempo: ' +totalhora);
                cxListBox1.Items.Add('');
                cxListBox1.Items.Add('');
                cxListBox1.Items.Add('');
                cxListBox1.Items.Add('');
                cxListBox1.Items.Add('');
                cxListBox1.Items.Add('');
                cxListBox1.Items.Add('');
                cxListBox1.Items.Add('');
                cxListBox1.Items.Add('');
                cxListBox1.Items.Add('');
                cxListBox1.Items.Add('Total: ' +FormatFloat('###,###,#0.00',vlrtrintaminutos));
                //inicia a impress?o
                iniConf     := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Garagem.ini');
                sPorta    := iniConf.ReadString('Impressora','Porta','');
                AssignFile(Arquivo,sPorta);
                Rewrite(Arquivo);
                //inicia a impress?o da etiqueta
                Writeln(Arquivo,I80car+INegAti+'    '+QEmpresa.FieldByName('RAZAO_SOCIAL').Text+INegDes);
                Writeln(Arquivo,I96car+'    '+QEmpresa.FieldByName('CNPJ'               ).Text);
                Writeln(Arquivo,I96car+'_____________________________________________');
                Writeln(Arquivo,I96car+'    '+'OBRIGADO, VOLTE SEMPRE!');
                Writeln(Arquivo,I96car+'    '+QEmpresa.FieldByName('TELEFONE'           ).Text);
                Writeln(Arquivo,I96car+'_____________________________________________');
                Writeln(Arquivo,IDuploG+INegAti+'    '+QMovimentacao.FieldByName('PLACA'    ).Text+INegDes+IDuploC);
                Writeln(Arquivo,IDuploP+INegAti+'    '+QMovimentacao.FieldByName('DESCRICAO').Text+INegDes+IDuploC);
                Writeln(Arquivo,I96car+'    '+'Tipo......: ' + QTipoVeiculo.FieldByName('DESCRICAO').Text);
                Writeln(Arquivo,I96car+'    '+'Ticket....: ' + QMovimentacao.FieldByName('CODIGO'  ).Text);
                Writeln(Arquivo,I96car+'    '+'Data/Hora.: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',QMovimentacao.FieldByName('HORA_ENTRADA').AsDateTime));
                Writeln(Arquivo,I96car+'    '+'Data/Sa?da: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',QMovimentacao.FieldByName('HORA_SAIDA'  ).AsDateTime));
                Writeln(Arquivo,I96car+'    '+'Total Horas: '+ totalhora);
                Writeln(Arquivo,I137car+'   '+'Valor a Pagar: ' + FormatFloat('###,###,#0.00',vlrtrintaminutos));
                Writeln(Arquivo,I96car+'_____________________________________________');
                WriteLn(Arquivo,IPula);
                Writeln(Arquivo,I96car+'    '+QEmpresa.FieldByName('FUNCIONAMENTO').Text);
                Writeln(Arquivo,I96car+'_____________________________________________');
                WriteLn(Arquivo,IPula);
                WriteLn(Arquivo,IPula);
                WriteLn(Arquivo,IPula);
                WriteLn(Arquivo,IPula);
                WriteLn(Arquivo,IPula);
                WriteLn(Arquivo,IPula);
                WriteLn(Arquivo,IPula);
                WriteLn(Arquivo,IPula);
                WriteLn(Arquivo,IPula);
                CloseFile(Arquivo);
                cxCalcEdit1.SetFocus;
                cxCalcEdit2.Value := vlrtrintaminutos;
                Abort;
             end;
          end;
          if QLocalizatipo.FindField('VALOR_HORA').Value <> 0 then
          begin
             vlrhora := (QCalculaHora.FindField('HORACHEIA').Value * QLocalizatipo.FindField('VALOR_HORA').Value);
             cxListBox1.Clear;
             cxListBox1.Items.Add('Tempo: ' +totalhora);
             cxListBox1.Items.Add('');
             cxListBox1.Items.Add('');
             cxListBox1.Items.Add('');
             cxListBox1.Items.Add('');
             cxListBox1.Items.Add('');
             cxListBox1.Items.Add('');
             cxListBox1.Items.Add('');
             cxListBox1.Items.Add('');
             cxListBox1.Items.Add('');
             cxListBox1.Items.Add('');
             cxListBox1.Items.Add('Total: ' +FormatFloat('###,###,#0.00',vlrhora));
             //inicia a impress?o
             iniConf     := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Garagem.ini');
             sPorta    := iniConf.ReadString('Impressora','Porta','');
             AssignFile(Arquivo,sPorta);
             Rewrite(Arquivo);
             //inicia a impress?o da etiqueta
             Writeln(Arquivo,I80car+INegAti+'    '+QEmpresa.FieldByName('RAZAO_SOCIAL').Text+INegDes);
             Writeln(Arquivo,I96car+'    '+QEmpresa.FieldByName('CNPJ'               ).Text);
             Writeln(Arquivo,I96car+'_____________________________________________');
             Writeln(Arquivo,I96car+'    '+'OBRIGADO, VOLTE SEMPRE!');
             Writeln(Arquivo,I96car+'    '+QEmpresa.FieldByName('TELEFONE'           ).Text);
             Writeln(Arquivo,I96car+'_____________________________________________');
             Writeln(Arquivo,IDuploG+INegAti+'    '+QMovimentacao.FieldByName('PLACA'    ).Text+INegDes+IDuploC);
             Writeln(Arquivo,IDuploP+INegAti+'    '+QMovimentacao.FieldByName('DESCRICAO').Text+INegDes+IDuploC);
             Writeln(Arquivo,I96car+'    '+'Tipo......: ' + QTipoVeiculo.FieldByName('DESCRICAO').Text);
             Writeln(Arquivo,I96car+'    '+'Ticket....: ' + QMovimentacao.FieldByName('CODIGO'  ).Text);
             Writeln(Arquivo,I96car+'    '+'Data/Hora.: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',QMovimentacao.FieldByName('HORA_ENTRADA').AsDateTime));
             Writeln(Arquivo,I96car+'    '+'Data/Sa?da: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',QMovimentacao.FieldByName('HORA_SAIDA'  ).AsDateTime));
             Writeln(Arquivo,I96car+'    '+'Total Horas: '+ totalhora);
             Writeln(Arquivo,I137car+'   '+'Valor a Pagar: ' + FormatFloat('###,###,#0.00',vlrhora));
             Writeln(Arquivo,I96car+'_____________________________________________');
             WriteLn(Arquivo,IPula);
             Writeln(Arquivo,I96car+'    '+QEmpresa.FieldByName('FUNCIONAMENTO').Text);
             Writeln(Arquivo,I96car+'_____________________________________________');
             WriteLn(Arquivo,IPula);
             WriteLn(Arquivo,IPula);
             WriteLn(Arquivo,IPula);
             WriteLn(Arquivo,IPula);
             WriteLn(Arquivo,IPula);
             WriteLn(Arquivo,IPula);
             WriteLn(Arquivo,IPula);
             WriteLn(Arquivo,IPula);
             WriteLn(Arquivo,IPula);
             cxCalcEdit1.SetFocus;
             CloseFile(Arquivo);
             cxCalcEdit1.SetFocus;
             cxCalcEdit2.Value := vlrhora;
             Abort;
          end;
      end;
   end;
   QMovimentacao.Close;
   QMovimentacao.SQL.Clear;
   QMovimentacao.SQL.Add('SELECT * FROM TB_MOVIMENTACAO');
   QMovimentacao.SQL.Add('WHERE DT_INCLUCAO = :DATA1');
   QMovimentacao.SQL.Add('AND SITUACAO = '+#39+'A'+#39);
   QMovimentacao.ParamByName('DATA1').AsDate := Date;
   QMovimentacao.Open;
end;

procedure TFMovimentacao.cxMaskEdit1Exit(Sender: TObject);
const
  IPula   = #13;       //Pula 1 linha
  IEspac1 = #27#48;    //Define espa?amento entre linhas de 1/8"
  IEspac2 = #27#49;    //Define espa?amento entre linhas de 7/72"
  IEspac3 = #27#50;    //Define espa?amento entre linhas de 1/6"
  IEject  = #12;       //Ejeta p?gina
  I80car  = #27#80#18; //Imprime com 80 colunas
  I96car  = #27#77#18; //Imprime com 96 colunas
  I137car = #27#80#15; //Imprime com 137 colunas
  I160car = #27#77#15; //Imprime com 160 colunas
  IDuploG = #27#14#18; //Imprime em caracter grande largura dupla
  IDuploP = #27#14#15; //Imprime em caracter pequeno largura dupla
  IDuploC = #27#20;    //Cancela largura dupla
  INegAti = #27#71;    //Imprime em negrito
  INegDes = #27#72;    //Cancela modo negrito
  IItaAti = #27#52;    //Imprime em It?lico
  IItaDes = #27#53;    //Cancela modo It?lico
var
  mensalista, mensalistainad, mensagemanotacao: string;
  iniConf: TIniFile;
  Arquivo : TextFile;
  sPorta: String;
  imprimi: Integer;
begin
   imprimi := 0;
   if cxMaskEdit1.Text <> '   -    ' then
   begin
      if QEmpresa.FindField('BLOQ_HORA_WINDOWS').Value = 'S' then
      begin
         Application.MessageBox('SISTEMA ESTA BLOQUEADO E SER? FECHADO.','CONSULTE ADMINISTRADOR', MB_ICONINFORMATION+MB_OK);
         Close;
      end;
      //verifica se tem anota??es
      QVerificaAnotacao.Close;
      QVerificaAnotacao.SQL.Clear;
      QVerificaAnotacao.SQL.Add('SELECT * FROM TB_ANOTACAO');
      QVerificaAnotacao.SQL.Add('WHERE PLACA ='+#39+cxMaskEdit1.Text+#39);
      QVerificaAnotacao.Open;

      if not QVerificaAnotacao.IsEmpty then
      begin
         if QVerificaAnotacao.FindField('PERMITE_ENTRADA').Value = 'S' then
         begin
            mensagemanotacao := 'Entrada n?o permitida ' +#13+
                                'Motivo: ' +QVerificaAnotacao.FindField('MENSAGEM').Value;

            Application.MessageBox(PCHAR(mensagemanotacao),'BLOQUEIA ENTRADA', MB_ICONINFORMATION+MB_OK);
            cxMaskEdit1.SetFocus;
            Abort;
         end
         else
         begin
            QVerificaMovimentacao.Close;
            QVerificaMovimentacao.SQL.Clear;
            QVerificaMovimentacao.SQL.Add('SELECT * FROM TB_MOVIMENTACAO');
            QVerificaMovimentacao.SQL.Add('WHERE PLACA ='+#39+QVerificaAnotacao.FieldByName('PLACA').Text+#39);
            QVerificaMovimentacao.Open;

            QMovimentacao.Append;
            QMovimentacao.FindField('DT_INCLUCAO' ).Value := Date;
            QMovimentacao.FindField('HORA_ENTRADA').Value := FormatDateTime('dd/mm/yyyy hh:nn:ss',now);
            QMovimentacao.FindField('PLACA'       ).Value := QVerificaMovimentacao.FieldByName('PLACA'    ).Text;
            QMovimentacao.FindField('TIPOVEICULO' ).Value := QVerificaMovimentacao.FindField('TIPOVEICULO').Value;
            QMovimentacao.FindField('SITUACAO'    ).Value := 'A';
            QMovimentacao.FindField('DESCRICAO'   ).Value := QVerificaMovimentacao.FieldByName('DESCRICAO').Text;
            QMovimentacao.FindField('TIPO_CLIENTE').Value := 'I';
            QMovimentacao.Post;
            cxMaskEdit1.Clear;
            imprimi := 1;
         end;
         cxMaskEdit1.Clear;
         JvDBLookupCombo1.ClearValue;
         cxTextEdit1.Clear;
         cxMaskEdit1.SetFocus;
      end
      else
      begin
         //verifica se ? mensalsta
         QVerificaMensalista.Close;
         QVerificaMensalista.SQL.Clear;
         QVerificaMensalista.SQL.Add('SELECT A.*, B.DT_VALIDADE, B.NOME, B.IDPLANO, C.DESCRICAO, C.VALOR_PLANO');
         QVerificaMensalista.SQL.Add('FROM TB_VEICULOCLIENTE A');
         QVerificaMensalista.SQL.Add('INNER JOIN TB_CLIENTE B ON (A.CODCLIENTE = B.CODIGO)');
         QVerificaMensalista.SQL.Add('INNER JOIN TB_PLANO   C ON (B.IDPLANO    = C.CODIGO)');
         QVerificaMensalista.SQL.Add('WHERE PLACA ='+#39+cxMaskEdit1.Text+#39);
         QVerificaMensalista.Open;

         if not QVerificaMensalista.IsEmpty then
         begin
            mensalista :=  QVerificaMensalista.FieldByName('NOME').Text + #13+
                           'Plano: ' + QVerificaMensalista.FieldByName('DESCRICAO').Text ;

            mensalistainad :=  QVerificaMensalista.FieldByName('NOME').Text + #13+
                               'Plano.....: ' + QVerificaMensalista.FieldByName('DESCRICAO').Text +#13+
                               'Vencimento: ' + DateToStr(QVerificaMensalista.FieldByName('DT_VALIDADE').AsDateTime);

            if QVerificaMensalista.FindField('DT_VALIDADE').Value < Date then
               Application.MessageBox(PCHAR(mensalistainad),'VERIFICA??O', MB_ICONINFORMATION+MB_OK)
            else
               Application.MessageBox(PCHAR(mensalista),'VERIFICA??O', MB_ICONINFORMATION+MB_OK);

            QMovimentacao.Append;
            QMovimentacao.FindField('DT_INCLUCAO' ).Value := Date;
            QMovimentacao.FindField('HORA_ENTRADA').Value :=  FormatDateTime('dd/mm/yyyy hh:nn:ss',now);
            QMovimentacao.FindField('PLACA'       ).Value := QVerificaMensalista.FindField('PLACA'        ).Value;
            QMovimentacao.FindField('TIPOVEICULO' ).Value := QVerificaMensalista.FindField('IDTIPOVEICULO').Value;
            QMovimentacao.FindField('SITUACAO'    ).Value := 'A';
            QMovimentacao.FindField('DESCRICAO'   ).Value := QVerificaMensalista.FindField('VEICULO'      ).Value;
            QMovimentacao.FindField('TIPO_CLIENTE').Value := 'M';
            QMovimentacao.Post;

            cxMaskEdit1.Clear;
            JvDBLookupCombo1.ClearValue;
            cxTextEdit1.Clear;
            cxMaskEdit1.SetFocus;

            imprimi := 0;
         end
         else
         begin
            //verifica se ja passou pela movimentacao
            QVerificaMovimentacao.Close;
            QVerificaMovimentacao.SQL.Clear;
            QVerificaMovimentacao.SQL.Add('SELECT * FROM TB_MOVIMENTACAO');
            QVerificaMovimentacao.SQL.Add('WHERE PLACA ='+#39+cxMaskEdit1.Text+#39);
            QVerificaMovimentacao.SQL.Add('AND SITUACAO <> '+#39+'C'+#39);
            QVerificaMovimentacao.Open;

            if not QVerificaMovimentacao.IsEmpty then
            begin
                QMovimentacao.Append;
                QMovimentacao.FindField('DT_INCLUCAO' ).Value := Date;
                QMovimentacao.FindField('HORA_ENTRADA').Value := FormatDateTime('dd/mm/yyyy hh:nn:ss',now);
                QMovimentacao.FindField('PLACA'       ).Value := QVerificaMovimentacao.FindField('PLACA'        ).Value;
                QMovimentacao.FindField('TIPOVEICULO' ).Value := QVerificaMovimentacao.FindField('TIPOVEICULO'  ).Value;
                QMovimentacao.FindField('SITUACAO'    ).Value := 'A';
                QMovimentacao.FindField('DESCRICAO'   ).Value := QVerificaMovimentacao.FindField('DESCRICAO'      ).Value;
                QMovimentacao.FindField('TIPO_CLIENTE').Value := 'A';
                QMovimentacao.Post;
                imprimi := 1;
            end;
         end;
         if imprimi = 1 then
         begin
             //abre o arquivo ini para verificar a porta da impressora
             iniConf     := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Garagem.ini');
             sPorta    := iniConf.ReadString('Impressora','Porta','');
             AssignFile(Arquivo,sPorta);
             Rewrite(Arquivo);
             //inicia a impress?o da etiqueta
             Writeln(Arquivo,I80car+INegAti+'    '+QEmpresa.FieldByName('RAZAO_SOCIAL').Text+INegDes);
             Writeln(Arquivo,I96car+'    '+QEmpresa.FieldByName('CNPJ'               ).Text);
             Writeln(Arquivo,I96car+'_____________________________________________');
             Writeln(Arquivo,I96car+'    '+'OBRIGADO, VOLTE SEMPRE!');
             Writeln(Arquivo,I96car+'    '+QEmpresa.FieldByName('TELEFONE'           ).Text);
             Writeln(Arquivo,I96car+'_____________________________________________');
             Writeln(Arquivo,IDuploG+INegAti+'    '+QMovimentacao.FieldByName('PLACA'    ).Text+INegDes+IDuploC);
             Writeln(Arquivo,IDuploP+INegAti+'    '+QMovimentacao.FieldByName('DESCRICAO').Text+INegDes+IDuploC);
             Writeln(Arquivo,I96car+'    '+'Tipo.....: ' + QTipoVeiculo.FieldByName('DESCRICAO').Text);
             Writeln(Arquivo,I96car+'    '+'Ticket...: ' + QMovimentacao.FieldByName('CODIGO'  ).Text);
             Writeln(Arquivo,I96car+'    '+'Data/Hora: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',QMovimentacao.FieldByName('HORA_ENTRADA').AsDateTime));
             Writeln(Arquivo,I137car+'    '+'Indispensavel a apresentacao deste');
             Writeln(Arquivo,I137car+'    '+'cupom para a retirada do veiculo');
             if QVerificaAnotacao.FindField('IMPRIMI_CUPOM').Value = 'S' then
                Writeln(Arquivo,I137car+'    '+QVerificaAnotacao.FieldByName('MENSAGEM').Text);
             Writeln(Arquivo,I96car+'_____________________________________________');
             WriteLn(Arquivo,IPula);
             Writeln(Arquivo,I96car+'    '+QEmpresa.FieldByName('FUNCIONAMENTO').Text);
             Writeln(Arquivo,I96car+'_____________________________________________');
             WriteLn(Arquivo,IPula);
             WriteLn(Arquivo,IPula);
             WriteLn(Arquivo,IPula);
             WriteLn(Arquivo,IPula);
             WriteLn(Arquivo,IPula);
             WriteLn(Arquivo,IPula);
             WriteLn(Arquivo,IPula);
             WriteLn(Arquivo,IPula);
             WriteLn(Arquivo,IPula);
             CloseFile(Arquivo);
             cxMaskEdit1.Clear;
             JvDBLookupCombo1.ClearValue;
             cxTextEdit1.Clear;
             cxMaskEdit1.SetFocus;
         end;
      end;
   end;
end;

procedure TFMovimentacao.cxTextEdit1Exit(Sender: TObject);
const
  IPula   = #13;       //Pula 1 linha
  IEspac1 = #27#48;    //Define espa?amento entre linhas de 1/8"
  IEspac2 = #27#49;    //Define espa?amento entre linhas de 7/72"
  IEspac3 = #27#50;    //Define espa?amento entre linhas de 1/6"
  IEject  = #12;       //Ejeta p?gina
  I80car  = #27#80#18; //Imprime com 80 colunas
  I96car  = #27#77#18; //Imprime com 96 colunas
  I137car = #27#80#15; //Imprime com 137 colunas
  I160car = #27#77#15; //Imprime com 160 colunas
  IDuploG = #27#14#18; //Imprime em caracter grande largura dupla
  IDuploP = #27#14#15; //Imprime em caracter pequeno largura dupla
  IDuploC = #27#20;    //Cancela largura dupla
  INegAti = #27#71;    //Imprime em negrito
  INegDes = #27#72;    //Cancela modo negrito
  IItaAti = #27#52;    //Imprime em It?lico
  IItaDes = #27#53;    //Cancela modo It?lico
var
  iniConf: TIniFile;
  Arquivo : TextFile;
  sPorta: String;
begin
   if cxTextEdit1.Text = '' then
   begin
      Application.MessageBox('Favor informa a descri??o do ve?culo.','ATEN??O', MB_ICONEXCLAMATION+MB_OK);
      cxTextEdit1.SetFocus;
      Abort;
   end;
   if cxMaskEdit1.Text <> '   -    ' then
   begin
      if JvDBLookupCombo1.Text = '' then
      begin
         Application.MessageBox('Informe o tipo de ve?culo.','ATEN??O', MB_ICONEXCLAMATION+MB_OK);
         JvDBLookupCombo1.SetFocus;
         Abort;
      end
      else
      begin
         if cxTextEdit1.Text = '' then
         begin
            Application.MessageBox('Informe a descri??o do ve?culo.','ATEN??O', MB_ICONEXCLAMATION+MB_OK);
            cxTextEdit1.SetFocus;
            Abort;
         end
         else
         begin
            QMovimentacao.Append;
            QMovimentacao.FindField('DT_INCLUCAO' ).Value := Date;
            QMovimentacao.FindField('HORA_ENTRADA').Value := FormatDateTime('dd/mm/yyyy hh:nn:ss',now);
            QMovimentacao.FindField('PLACA'       ).Value := cxMaskEdit1.Text;
            QMovimentacao.FindField('TIPOVEICULO' ).Value := QTipoVeiculo.FindField('CODIGO').Value;
            QMovimentacao.FindField('SITUACAO'    ).Value := 'A';
            QMovimentacao.FindField('IDPLANO'     ).Value := QPlano.FindField('CODIGO').Value;

            if QMovimentacao.FindField('TIPO_CLIENTE').IsNull then
            begin
               if CheckBox1.State = cbChecked then
                  QMovimentacao.FindField('TIPO_CLIENTE').Value := 'D'
               else
                 QMovimentacao.FindField('TIPO_CLIENTE' ).Value := 'A';
            end;
            QMovimentacao.FindField('DESCRICAO'   ).Value := cxTextEdit1.Text;
            QMovimentacao.Post;
         end;
      end;
      //abre o arquivo ini para verificar a porta da impressora
      iniConf     := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Garagem.ini');
      sPorta    := iniConf.ReadString('Impressora','Porta','');
      AssignFile(Arquivo,sPorta);
      Rewrite(Arquivo);
      //inicia a impress?o da etiqueta
      Writeln(Arquivo,I80car+INegAti+'    '+QEmpresa.FieldByName('RAZAO_SOCIAL').Text+INegDes);
      Writeln(Arquivo,I96car+'     '+QEmpresa.FieldByName('CNPJ'               ).Text);
      Writeln(Arquivo,I96car+'_____________________________________________');
      Writeln(Arquivo,I96car+'    '+'OBRIGADO, VOLTE SEMPRE!');
      Writeln(Arquivo,I96car+'    '+QEmpresa.FieldByName('TELEFONE'           ).Text);
      Writeln(Arquivo,I96car+'_____________________________________________');
      Writeln(Arquivo,IDuploG+INegAti+'    '+QMovimentacao.FieldByName('PLACA'    ).Text+INegDes+IDuploC);
      Writeln(Arquivo,IDuploP+INegAti+'     '+QMovimentacao.FieldByName('DESCRICAO').Text+INegDes+IDuploC);
      Writeln(Arquivo,I96car+'    '+'Tipo.....: ' + QTipoVeiculo.FieldByName('DESCRICAO').Text);
      Writeln(Arquivo,I96car+'    '+'Ticket...: ' + QMovimentacao.FieldByName('CODIGO'  ).Text);
      Writeln(Arquivo,I96car+'    '+'Data/Hora: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',QMovimentacao.FieldByName('HORA_ENTRADA').AsDateTime));
      Writeln(Arquivo,I137car+'   '+'Indispensavel a apresentacao deste');
      Writeln(Arquivo,I137car+'   '+'cupom para a retirada do veiculo');
      Writeln(Arquivo,I96car+'_____________________________________________');
      WriteLn(Arquivo,IPula);
      Writeln(Arquivo,I96car+'    '+QEmpresa.FieldByName('FUNCIONAMENTO').Text);
      Writeln(Arquivo,I96car+'_____________________________________________');
      WriteLn(Arquivo,IPula);
      WriteLn(Arquivo,IPula);
      WriteLn(Arquivo,IPula);
      WriteLn(Arquivo,IPula);
      WriteLn(Arquivo,IPula);
      WriteLn(Arquivo,IPula);
      WriteLn(Arquivo,IPula);
      WriteLn(Arquivo,IPula);
      WriteLn(Arquivo,IPula);
      CloseFile(Arquivo);

      cxMaskEdit1.Clear;
      JvDBLookupCombo1.ClearValue;
      JvDBLookupCombo2.ClearValue;
      CheckBox1.State := cbUnchecked;
      cxTextEdit1.Clear;
      cxMaskEdit1.SetFocus;
   end;
end;

procedure TFMovimentacao.F9Voucher1Click(Sender: TObject);
begin
   Application.CreateForm(TFPesqVoucher, FPesqVoucher);
   FPesqVoucher.Tag := 1;
   FPesqVoucher.ShowModal;
   FPesqVoucher.Free;
end;

procedure TFMovimentacao.FormActivate(Sender: TObject);
begin
   //abre as tabelas
   QEmpresa.Open;
   QTipoVeiculo.Open;
end;

procedure TFMovimentacao.FormCreate(Sender: TObject);
begin
   if QEmpresa.FindField('BLOQ_HORA_WINDOWS').Value = 'S' then
   begin
      Application.MessageBox('Sistema bloqueado por motivo de seguran?a, comunique o administrador do sistema.','BLOQUEO', MB_ICONWARNING+MB_OK);
      Close;
   end
   else
   begin
      isTimeChangeEventShowing := false;
   end;
end;

procedure TFMovimentacao.FormShow(Sender: TObject);
begin
   QMovimentacao.Close;
   QMovimentacao.SQL.Clear;
   QMovimentacao.SQL.Add('SELECT * FROM TB_MOVIMENTACAO');
   QMovimentacao.SQL.Add('WHERE DT_INCLUCAO = :DATA1');
   QMovimentacao.SQL.Add('AND SITUACAO = '+#39+'A'+#39);
   QMovimentacao.ParamByName('DATA1').AsDate := Date;
   QMovimentacao.Open;
   cxMaskEdit1.SetFocus;
end;

procedure TFMovimentacao.JvDBLookupCombo1Enter(Sender: TObject);
begin
   JvDBLookupCombo1.Color := clGradientActiveCaption;
end;

procedure TFMovimentacao.JvDBLookupCombo1Exit(Sender: TObject);
begin
   JvDBLookupCombo1.Color := clWindow;
end;

procedure TFMovimentacao.Timer1Timer(Sender: TObject);
begin
   JvTimeEdit1.Time := Time;
end;

procedure TFMovimentacao.WMTimeChange(var Msg: TMessage);
var
  mensagem: string;
begin
   mensagem:= 'Foi detectada uma altera??o na data e hora do ' +#13+
              'sistema operacional o sistema ser? fechado. ' +#13+
              'Solicite a presen?a do administrador para desbloque?-lo';
   QEmpresa.Edit;
   QEmpresa.FindField('BLOQ_HORA_WINDOWS').Value := 'S';
   QEmpresa.Post;
   if not isTimeChangeEventShowing then
   begin
       isTimeChangeEventShowing := true;
       Application.MessageBox(PChar(mensagem),'PROTE??O DO SISTEMA', MB_ICONWARNING+MB_OK);
       isTimeChangeEventShowing := false;
       close;
    end;
end;

end.
