unit FrmPesquisaAnotacao;

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
  dxSkinXmas2008Blue, Menus, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, DB, cxDBData, Buttons, StdCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, JvExControls, JvEnterTab, ExtCtrls, ImgList,
  cxButtons, cxGroupBox, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFPesqAnotacao = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxButton4: TcxButton;
    cxButton1: TcxButton;
    cxGroupBox2: TcxGroupBox;
    cxButton3: TcxButton;
    ilImgHabilita: TImageList;
    pnl1: TPanel;
    JvEnterAsTab1: TJvEnterAsTab;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cbb1: TComboBox;
    edt1: TEdit;
    btn1: TBitBtn;
    dsDAnotacao: TDataSource;
    QPesqAnotacao: TZQuery;
    intgrfldQPesqAnotacaocodigo: TIntegerField;
    intgrfldQPesqAnotacaocod_cliente: TIntegerField;
    wdstrngfldQPesqAnotacaoplaca: TWideStringField;
    wdstrngfldQPesqAnotacaomensagem: TWideStringField;
    wdstrngfldQPesqAnotacaopermite_entrada: TWideStringField;
    wdstrngfldQPesqAnotacaoimprimi_cupom: TWideStringField;
    wdstrngfldQPesqAnotacaoinativo: TWideStringField;
    chk1: TCheckBox;
    cxgrdbclmnGrid1DBTableView1placa: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1mensagem: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1permite_entrada: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1imprimi_cupom: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1inativo: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1codigo: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1cod_cliente: TcxGridDBColumn;
    procedure cxButton4Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure edt1Exit(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPesqAnotacao: TFPesqAnotacao;

implementation

uses
  Dados, FrmCadAnotacao;

{$R *.dfm}

procedure TFPesqAnotacao.btn1Click(Sender: TObject);
begin
   //faz a pesquisa
   QPesqAnotacao.Close;
   QPesqAnotacao.SQL.Clear;
   QPesqAnotacao.SQL.Add('SELECT * FROM TB_ANOTACAO');
   QPesqAnotacao.SQL.Add('WHERE MENSAGEM LIKE'+#39+'%'+edt1.Text+'%'+#39);
   if chk1.State = cbChecked then
      QPesqAnotacao.SQL.Add('AND INATIVO ='+#39+'S'+#39)
   else
      QPesqAnotacao.SQL.Add('AND INATIVO ='+#39+'N'+#39);
   QPesqAnotacao.Open;
end;

procedure TFPesqAnotacao.cxButton3Click(Sender: TObject);
begin
   if not QPesqAnotacao.IsEmpty then
   begin
      FCadAnotacao.QAnotacao.Close;
      FCadAnotacao.QAnotacao.SQL.Clear;
      FCadAnotacao.QAnotacao.SQL.Add('SELECT * FROM TB_ANOTACAO WHERE CODIGO ='+#39+QPesqAnotacao.FieldByName('CODIGO').Text+#39);
      FCadAnotacao.QAnotacao.Open;

      FCadAnotacao.pnl1.Enabled := True;
      FCadAnotacao.QAnotacao.Edit;
      close;
   end;
end;

procedure TFPesqAnotacao.cxButton4Click(Sender: TObject);
begin
   //fecha o formulario
   Close;
end;

procedure TFPesqAnotacao.edt1Exit(Sender: TObject);
begin
   btn1.Click;
end;

end.
