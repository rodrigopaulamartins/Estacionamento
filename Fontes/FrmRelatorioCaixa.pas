unit FrmRelatorioCaixa;

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
  dxSkinXmas2008Blue, Menus, JvExControls, JvEnterTab, ExtCtrls, StdCtrls,
  cxButtons, cxGroupBox, ImgList, ActnList, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, RpBase, RpSystem, RpDefine, RpRave, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, RpRender, RpRenderPDF, RpCon,
  RpConDS;

type
  TFRelCaixa = class(TForm)
    Botoes: TActionList;
    AcNovo: TAction;
    AcSalvar: TAction;
    AcPesquisa: TAction;
    ImgHabilita: TImageList;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    cxGroupBox1: TcxGroupBox;
    cxButton4: TcxButton;
    cxButton1: TcxButton;
    cxGroupBox2: TcxGroupBox;
    cxButton3: TcxButton;
    ImageList1: TImageList;
    Panel1: TPanel;
    JvEnterAsTab1: TJvEnterAsTab;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    cxComboBox1: TcxComboBox;
    RvRelCaixa: TRvProject;
    RvSystem1: TRvSystem;
    RvDataSetCaixa: TRvDataSetConnection;
    RvRenderPDF1: TRvRenderPDF;
    QCaixa: TZQuery;
    QCaixaCODIGO: TIntegerField;
    QCaixaDT_ENTRADA: TDateField;
    QCaixaFECHADO: TWideStringField;
    QCaixaTIPO: TWideStringField;
    QCaixaTIPOCLI: TWideStringField;
    QCaixaENTRADAS: TFloatField;
    QCaixaSAIDAS: TFloatField;
    QEmpresa: TZQuery;
    RvDataSetEmpresa: TRvDataSetConnection;
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
    QEmpresafuncionamento: TWideStringField;
    QCaixaDESCRICAO: TWideStringField;
    QSoma: TZQuery;
    QSomaENTRADA: TFloatField;
    QSomaSAIDA: TFloatField;
    procedure cxButton4Click(Sender: TObject);
    procedure cxDateEdit2Exit(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelCaixa: TFRelCaixa;

implementation

uses
  Dados;

{$R *.dfm}

procedure TFRelCaixa.cxButton3Click(Sender: TObject);
VAR
 vlrEntSaida: Currency;
begin
   if cxDateEdit1.Text = '' then
   begin
      Application.MessageBox('Informe a data inicial para a pesquisa.','ATEN??O', MB_ICONEXCLAMATION+ MB_OK);
      cxDateEdit1.SetFocus;
      Abort;
   end
   else
   begin
      if cxDateEdit2.Text = '' then
      begin
         Application.MessageBox('Informe a data final para a pesquisa.','ATEN??O', MB_ICONEXCLAMATION+ MB_OK);
         cxDateEdit2.SetFocus;
         Abort;
      end
      else
      begin
         QEmpresa.Open;

         QCaixa.Close;
         QCaixa.SQL.Clear;
         QCaixa.SQL.Add('SELECT CODIGO, DT_ENTRADA, FECHADO, TIPO, DESCRICAO,');
         QCaixa.SQL.Add('CASE TIPO');
         QCaixa.SQL.Add('WHEN '+#39+'A'+#39+' THEN '+#39+'AVULSO'+#39);
         QCaixa.SQL.Add('WHEN '+#39+'I'+#39+' THEN '+#39+'INADIMPLENTE'+#39);
         QCaixa.SQL.Add('WHEN '+#39+'M'+#39+' THEN '+#39+'MENSAL/DIARIA/PERNOITE'+#39);
         QCaixa.SQL.Add('ELSE '+#39+'OUTROS'+#39);
         QCaixa.SQL.Add('END AS TIPOCLI,');
         QCaixa.SQL.Add('sum(case when valor_pago then valor_pago else 0 end ) AS ENTRADAS,');
         QCaixa.SQL.Add('sum(case when valor_saida then valor_saida else 0 end ) AS SAIDAS');
         QCaixa.SQL.Add('FROM TB_CAIXA');

         QSoma.Close;
         QSoma.SQL.Clear;
         QSoma.SQL.Add('SELECT SUM(VALOR_PAGO) as ENTRADA, SUM(VALOR_SAIDA) as SAIDA FROM TB_CAIXA');

         if cxComboBox1.ItemIndex = 0 then
         begin
           QCaixa.SQL.Add('WHERE FECHADO ='+#39+'A'+#39);
           QSoma.SQL.Add('WHERE FECHADO ='+#39+'A'+#39);
         end;

         if cxComboBox1.ItemIndex = 1 then
         begin
           QCaixa.SQL.Add('WHERE FECHADO ='+#39+'F'+#39);
           QSoma.SQL.Add('WHERE FECHADO ='+#39+'F'+#39);
         end;
         QSoma.SQL.Add('AND DT_ENTRADA BETWEEN :DATA1 AND :DATA2');
         QSoma.ParamByName('DATA1').AsDate := cxDateEdit1.Date;
         QSoma.ParamByName('DATA2').AsDate := cxDateEdit2.Date;

         QCaixa.SQL.Add('AND DT_ENTRADA BETWEEN :DATA1 AND :DATA2');
         QCaixa.ParamByName('DATA1').AsDate := cxDateEdit1.Date;
         QCaixa.ParamByName('DATA2').AsDate := cxDateEdit2.Date;
         QCaixa.SQL.Add('GROUP BY CODIGO');
         QCaixa.SQL.Add('ORDER BY CODIGO ASC');
         QCaixa.Open;
         QSoma.Open;

         vlrEntSaida := (QSoma.FieldByName('ENTRADA').AsFloat - QSoma.FieldByName('SAIDA').AsFloat);

         RvRelCaixa.Close;
         RvRelCaixa.Open;
         RvRelCaixa.SelectReport('RCaixa',True);
         RvRelCaixa.SetParam('DataIni',   cxDateEdit1.Text);
         RvRelCaixa.SetParam('DataFim',   cxDateEdit2.Text);
         RvRelCaixa.SetParam('Situac',    cxComboBox1.Text);
         RvRelCaixa.SetParam('Diferenca', FormatFloat('###,###,#0.00',vlrEntSaida));
         RvRelCaixa.Execute;
      end;
   end;
end;

procedure TFRelCaixa.cxButton4Click(Sender: TObject);
begin
   //fecha o formulario
   Close;
end;

procedure TFRelCaixa.cxDateEdit2Exit(Sender: TObject);
begin
   if cxDateEdit2.Date < cxDateEdit1.Date then
   begin
      Application.MessageBox('Data final menor que a inicial, verifique.','ATEN??O', MB_ICONEXCLAMATION+ MB_OK);
      cxDateEdit2.SetFocus;
      Abort;
   end;
end;

end.
