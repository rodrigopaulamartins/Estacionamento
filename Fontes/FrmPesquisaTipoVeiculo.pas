unit FrmPesquisaTipoVeiculo;

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
  cxFilter, cxData, cxDataStorage, DB, cxDBData, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, StdCtrls, Buttons, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, JvExControls, JvEnterTab, ExtCtrls, ImgList,
  cxButtons, cxGroupBox;

type
  TFPesqTpoVeiculo = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxButton4: TcxButton;
    cxButton1: TcxButton;
    cxGroupBox2: TcxGroupBox;
    cxButton3: TcxButton;
    ImgHabilita: TImageList;
    Panel1: TPanel;
    JvEnterAsTab1: TJvEnterAsTab;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    QPesqTipoVeiculo: TZQuery;
    DPesqTipoVeiculo: TDataSource;
    QPesqTipoVeiculocodigo: TIntegerField;
    QPesqTipoVeiculodescricao: TWideStringField;
    QPesqTipoVeiculolotacao: TIntegerField;
    QPesqTipoVeiculovalor_quizeminutos: TFloatField;
    QPesqTipoVeiculovalor_quinzeseguintes: TFloatField;
    QPesqTipoVeiculovalor_trintaminutos: TFloatField;
    QPesqTipoVeiculovalor_trintaminutos_seguinte: TFloatField;
    QPesqTipoVeiculoprimeiros_minutos: TIntegerField;
    QPesqTipoVeiculovalor_primeiros_minutos: TFloatField;
    QPesqTipoVeiculovalor_hora: TFloatField;
    QPesqTipoVeiculovalor_hora_seguinte: TFloatField;
    QPesqTipoVeiculovalor_pernoite: TFloatField;
    QPesqTipoVeiculovalor_diaria: TFloatField;
    QPesqTipoVeiculoinativo: TWideStringField;
    cxGrid1DBTableView1codigo: TcxGridDBColumn;
    cxGrid1DBTableView1descricao: TcxGridDBColumn;
    cxGrid1DBTableView1lotacao: TcxGridDBColumn;
    cxGrid1DBTableView1cortesia: TcxGridDBColumn;
    cxGrid1DBTableView1valor_quizeminutos: TcxGridDBColumn;
    cxGrid1DBTableView1valor_quinzeseguintes: TcxGridDBColumn;
    cxGrid1DBTableView1valor_trintaminutos: TcxGridDBColumn;
    cxGrid1DBTableView1valor_trintaminutos_seguinte: TcxGridDBColumn;
    cxGrid1DBTableView1primeiros_minutos: TcxGridDBColumn;
    cxGrid1DBTableView1valor_primeiros_minutos: TcxGridDBColumn;
    cxGrid1DBTableView1valor_hora: TcxGridDBColumn;
    cxGrid1DBTableView1valor_hora_seguinte: TcxGridDBColumn;
    cxGrid1DBTableView1valor_pernoite: TcxGridDBColumn;
    cxGrid1DBTableView1valor_diaria: TcxGridDBColumn;
    cxGrid1DBTableView1inativo: TcxGridDBColumn;
    QPesqTipoVeiculocortesia: TTimeField;
    procedure cxButton4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPesqTpoVeiculo: TFPesqTpoVeiculo;

implementation

uses
  Dados, FrmCadastroTipoVeiculo;

{$R *.dfm}

procedure TFPesqTpoVeiculo.BitBtn1Click(Sender: TObject);
begin
   //faz a pesquisa
   QPesqTipoVeiculo.Close;
   QPesqTipoVeiculo.SQL.Clear;
   QPesqTipoVeiculo.SQL.Add('SELECT * FROM TB_TIPOVEICULO');
   QPesqTipoVeiculo.SQL.Add('WHERE DESCRICAO LIKE'+#39+'%'+Edit1.Text+'%'+#39);
   if CheckBox1.State = cbChecked then
      QPesqTipoVeiculo.SQL.Add('AND INATIVO ='+#39+'S'+#39)
   else
      QPesqTipoVeiculo.SQL.Add('AND INATIVO ='+#39+'N'+#39);
      QPesqTipoVeiculo.SQL.Add('ORDER BY DESCRICAO');
   QPesqTipoVeiculo.Open;
end;

procedure TFPesqTpoVeiculo.cxButton3Click(Sender: TObject);
begin
   if not QPesqTipoVeiculo.IsEmpty then
   begin
      FCadTipoVeiculo.QTipoVeiculo.Close;
      FCadTipoVeiculo.QTipoVeiculo.SQL.Clear;
      FCadTipoVeiculo.QTipoVeiculo.SQL.Add('SELECT * FROM TB_TIPOVEICULO WHERE CODIGO ='+#39+QPesqTipoVeiculo.FieldByName('CODIGO').Text+#39);
      FCadTipoVeiculo.QTipoVeiculo.Open;

      FCadTipoVeiculo.Panel1.Enabled := True;
      FCadTipoVeiculo.QTipoVeiculo.Edit;
      close;
   end;
end;

procedure TFPesqTpoVeiculo.cxButton4Click(Sender: TObject);
begin
   //fecha o formulario
   close;
end;

procedure TFPesqTpoVeiculo.Edit1Exit(Sender: TObject);
begin
   BitBtn1.Click;
end;

end.
