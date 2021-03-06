unit FrmLancamentoCaixa;

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
  dxSkinXmas2008Blue, Menus, StdCtrls, JvExControls, JvEnterTab, ExtCtrls,
  cxButtons, cxGroupBox, ActnList, cxTextEdit, cxDBEdit;

type
  TFLancamento = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxButton4: TcxButton;
    cxButton1: TcxButton;
    cxGroupBox2: TcxGroupBox;
    pnl1: TPanel;
    JvEnterAsTab1: TJvEnterAsTab;
    actlst1: TActionList;
    act1: TAction;
    actAcSalvarM: TAction;
    actAcExcluir: TAction;
    cxButton3: TcxButton;
    lbl1: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    lbl2: TLabel;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    lbl3: TLabel;
    procedure cxButton4Click(Sender: TObject);
    procedure actAcSalvarMExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLancamento: TFLancamento;

implementation

uses
  FrmMovimentacao, FrmCaixa;

{$R *.dfm}

procedure TFLancamento.actAcSalvarMExecute(Sender: TObject);
begin
   if cxDBTextEdit2.Text = '' then
   begin
      Application.MessageBox('Informe a descri??o.','ATEN??O', MB_ICONEXCLAMATION+MB_OK);
      cxDBTextEdit2.SetFocus;
      Abort;
   end
   else
   begin
      FMovimentacao.QCaixa.Post;

       FCaixa.QSCaixa.Close;
       FCaixa.QSCaixa.SQL.Clear;
       FCaixa.QSCaixa.SQL.Add('SELECT *, SUM(VALOR_PAGO) AS ENTRADA, SUM(VALOR_SAIDA) AS SAIDA, SUM(VALOR_PAGO - VALOR_SAIDA) AS EMCAIXA FROM TB_CAIXA');
       FCaixa.QSCaixa.SQL.Add('WHERE FECHADO ='+#39+'A'+#39);
       FCaixa.QSCaixa.SQL.Add('AND DT_ENTRADA = :DATA1');
       FCaixa.QSCaixa.ParamByName('DATA1').AsDate := Date;
       FCaixa.QSCaixa.SQL.Add('GROUP BY DT_ENTRADA');
       FCaixa.QSCaixa.Open;
       if not FCaixa.QSCaixa.IsEmpty then
       begin
          FCaixa.lbl3.Caption    := IntToStr(FCaixa.QSCaixa.RecordCount);
          FCaixa.lbl4.Caption    := FormatFloat('###,###,#0.00',FCaixa.QSCaixa.FieldByName('ENTRADA').AsFloat);
          FCaixa.Label2.Caption  := FormatFloat('###,###,#0.00',FCaixa.QSCaixa.FieldByName('SAIDA'  ).AsFloat);

       end;
          Close;
       end;
end;

procedure TFLancamento.cxButton4Click(Sender: TObject);
begin
   //fecha o formulario
   Close;
end;

end.
