unit FrmCaixa;

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
  dxSkinXmas2008Blue, Menus, JvExControls, JvEnterTab, ExtCtrls, ImgList,
  StdCtrls, cxButtons, cxGroupBox, ActnList, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ZAbstractRODataset, ZAbstractDataset, ZDataset, IniFiles;

type
  TFCaixa = class(TForm)
    actlstBotoes: TActionList;
    actAcNovo: TAction;
    actAcPesquisa: TAction;
    cxGroupBox1: TcxGroupBox;
    cxButton4: TcxButton;
    cxButton1: TcxButton;
    cxGroupBox2: TcxGroupBox;
    cxButton3: TcxButton;
    cxButton2: TcxButton;
    ilImgHabilita: TImageList;
    pnl1: TPanel;
    JvEnterAsTab1: TJvEnterAsTab;
    pnl2: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxgrdbclmnGrid1DBTableView1codigo: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1descricao: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1tipo: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1valor_pago: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1fechado: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1dt_entrada: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1valor_saida: TcxGridDBColumn;
    QSangria: TZQuery;
    QSCaixa: TZQuery;
    QSCaixacodigo: TIntegerField;
    QSCaixadescricao: TWideStringField;
    QSCaixatipo: TWideStringField;
    QSCaixavalor_pago: TFloatField;
    QSCaixafechado: TWideStringField;
    QSCaixadt_entrada: TDateField;
    QSCaixavalor_saida: TFloatField;
    QSCaixaENTRADA: TFloatField;
    QSCaixaSAIDA: TFloatField;
    QSCaixaEMCAIXA: TFloatField;
    Label1: TLabel;
    Label2: TLabel;
    QSangriaDT_ENTRADA: TDateField;
    QSangriaFECHADO: TWideStringField;
    QSangriaVLRPAGO: TFloatField;
    QSangriaVLRSAIDA: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure actAcNovoExecute(Sender: TObject);
    procedure actAcPesquisaExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCaixa: TFCaixa;

implementation

uses
  FrmMovimentacao, FrmLancamentoCaixa, Dados, FrmPrincipal;

{$R *.dfm}

procedure TFCaixa.actAcNovoExecute(Sender: TObject);
begin
   Application.CreateForm(TFLancamento, FLancamento);
   FMovimentacao.QCaixa.Open;
   FMovimentacao.QCaixa.Append;
   FMovimentacao.QCaixa.FindField('FECHADO'   ).Value := 'A';
   FMovimentacao.QCaixa.FindField('DT_ENTRADA').Value := Now;
   FMovimentacao.QCaixa.FindField('TIPO'      ).Value := 'L';
   FLancamento.ShowModal;
   FLancamento.Free;
end;

procedure TFCaixa.actAcPesquisaExecute(Sender: TObject);
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
  vlrsangria: Currency;
begin
   //fecha o caixa e emitir o comprovante do valor a ser fechado
   if Application.MessageBox('Tem certeza que deseja fechar o caixa?','PROCESSO IRREVERSIVEL',MB_ICONQUESTION+MB_YESNO)=IDYES then
   begin
      //faz a sa?da da sangria
      QSangria.Close;
      QSangria.SQL.Clear;
      QSangria.SQL.Add('SELECT DT_ENTRADA, FECHADO, SUM(VALOR_PAGO) as VLRPAGO, SUM(VALOR_SAIDA)  as VLRSAIDA');
      QSangria.SQL.Add('FROM TB_CAIXA');
      QSangria.SQL.Add('WHERE FECHADO = '+#39+'A'+#39);
      QSangria.SQL.Add('AND DT_ENTRADA = :DATA1');
      QSangria.ParamByName('DATA1').AsDate := Now;
      QSangria.SQL.Add('GROUP BY DT_ENTRADA');
      QSangria.Open;
      vlrsangria := (QSangria.FieldByName('VLRPAGO').AsFloat - QSangria.FieldByName('VLRSAIDA').AsFloat);

      FMovimentacao.QCaixa.First;
      while not FMovimentacao.QCaixa.Eof do
      begin
         FMovimentacao.QCaixa.Edit;
         FMovimentacao.QCaixa.FindField('FECHADO').Value := 'F';
         FMovimentacao.QCaixa.Post;
         Application.ProcessMessages;
         FMovimentacao.QCaixa.Next;
      end;
      //abre o arquivo ini para verificar a porta da impressora
      iniConf     := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Garagem.ini');
      sPorta    := iniConf.ReadString('Impressora','Porta','');
      AssignFile(Arquivo,sPorta);
      Rewrite(Arquivo);
      //inicia a impress?o da etiqueta
      Writeln(Arquivo,I80car+INegAti+'    '+FMovimentacao.QEmpresa.FieldByName('RAZAO_SOCIAL').Text+INegDes);
      Writeln(Arquivo,I96car+'    '+FMovimentacao.QEmpresa.FieldByName('CNPJ'               ).Text);
      Writeln(Arquivo,I96car+'_____________________________________________');
      Writeln(Arquivo,I96car+'          '+'SAIDA DO CAIXA                  ');
      Writeln(Arquivo,I96car+'          '+FMovimentacao.QEmpresa.FieldByName('TELEFONE'           ).Text);
      Writeln(Arquivo,I96car+'_____________________________________________');
      Writeln(Arquivo,I96car+'    '+'Data/Hora.....: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',Now));
      WriteLn(Arquivo,IPula);
      Writeln(Arquivo,I137car+'   '+'Valor da Sa?da: ' + FormatFloat('###,###,#0.00',vlrsangria));
      WriteLn(Arquivo,IPula);
      WriteLn(Arquivo,IPula);
      WriteLn(Arquivo,IPula);
      Writeln(Arquivo,I96car+'______________________________________________');
      WriteLn(Arquivo,I96car+  FPrincipal.UcMyControl.CurrentUser.UserName   );
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
   //abre a tabela de caixa
   FMovimentacao.QCaixa.Close;
   FMovimentacao.QCaixa.SQL.Clear;
   FMovimentacao.QCaixa.SQL.Add('SELECT * FROM TB_CAIXA');
   FMovimentacao.QCaixa.SQL.Add('WHERE FECHADO ='+#39+'A'+#39);
   FMovimentacao.QCaixa.SQL.Add('AND DT_ENTRADA = :DATA1');
   FMovimentacao.QCaixa.ParamByName('DATA1').AsDate := Date;
   FMovimentacao.QCaixa.Open;

   lbl3.Caption    := '0';
   lbl4.Caption    := '0';
   Label2.Caption  := '0';
   Application.MessageBox('Caixa fechado com sucesso!!!','CONFIRMA??O', MB_ICONINFORMATION+MB_OK);

end;

procedure TFCaixa.cxButton4Click(Sender: TObject);
begin
   //fecha o formulario
   close;
end;

procedure TFCaixa.FormShow(Sender: TObject);
begin
   //abre a tabela de caixa
   FMovimentacao.QCaixa.Close;
   FMovimentacao.QCaixa.SQL.Clear;
   FMovimentacao.QCaixa.SQL.Add('SELECT * FROM TB_CAIXA');
   FMovimentacao.QCaixa.SQL.Add('WHERE FECHADO ='+#39+'A'+#39);
   FMovimentacao.QCaixa.SQL.Add('AND DT_ENTRADA = :DATA1');
   FMovimentacao.QCaixa.ParamByName('DATA1').AsDate := Date;
   FMovimentacao.QCaixa.Open;

   QSCaixa.Close;
   QSCaixa.SQL.Clear;
   QSCaixa.SQL.Add('SELECT *, SUM(VALOR_PAGO) AS ENTRADA, SUM(VALOR_SAIDA) AS SAIDA, SUM(VALOR_PAGO - VALOR_SAIDA) AS EMCAIXA FROM TB_CAIXA');
   QSCaixa.SQL.Add('WHERE FECHADO ='+#39+'A'+#39);
   QSCaixa.SQL.Add('AND DT_ENTRADA = :DATA1');
   QSCaixa.ParamByName('DATA1').AsDate := Date;
   QSCaixa.SQL.Add('GROUP BY DT_ENTRADA');
   QSCaixa.Open;
   if not QSCaixa.IsEmpty then
   begin
      lbl3.Caption     := IntToStr(QSCaixa.RecordCount);
      lbl4.Caption    := FormatFloat('###,###,#0.00',QSCaixa.FieldByName('ENTRADA').AsFloat);
      Label2.Caption  := FormatFloat('###,###,#0.00',QSCaixa.FieldByName('SAIDA'  ).AsFloat);

   end;
end;

end.
