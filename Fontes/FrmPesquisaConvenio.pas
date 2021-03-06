unit FrmPesquisaConvenio;

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
  cxFilter, cxData, cxDataStorage, DB, cxDBData, StdCtrls, Buttons, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, JvExControls, JvEnterTab, ExtCtrls, ImgList,
  cxButtons, cxGroupBox, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFPesqConvenio = class(TForm)
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
    DPesqConvenio: TDataSource;
    QPesqConvenio: TZQuery;
    QPesqConveniocodigo: TIntegerField;
    QPesqConveniodescricao: TWideStringField;
    QPesqConveniotipo_desconto: TWideStringField;
    QPesqConveniovalor_desconto: TFloatField;
    QPesqConveniocobrar_cliente: TWideStringField;
    QPesqConvenioinativo: TWideStringField;
    cxGrid1DBTableView1codigo: TcxGridDBColumn;
    cxGrid1DBTableView1descricao: TcxGridDBColumn;
    cxGrid1DBTableView1tipo_desconto: TcxGridDBColumn;
    cxGrid1DBTableView1valor_desconto: TcxGridDBColumn;
    cxGrid1DBTableView1cobrar_cliente: TcxGridDBColumn;
    cxGrid1DBTableView1inativo: TcxGridDBColumn;
    procedure cxButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPesqConvenio: TFPesqConvenio;

implementation

uses
  Dados, FrmCadConvenio;

{$R *.dfm}

procedure TFPesqConvenio.BitBtn1Click(Sender: TObject);
begin
   //faz a pesquisa
   QPesqConvenio.Close;
   QPesqConvenio.SQL.Clear;
   QPesqConvenio.SQL.Add('SELECT * FROM TB_CONVENIO');
   QPesqConvenio.SQL.Add('WHERE DESCRICAO LIKE'+#39+'%'+Edit1.Text+'%'+#39);
   if CheckBox1.State = cbChecked then
      QPesqConvenio.SQL.Add('AND INATIVO ='+#39+'S'+#39)
   else
      QPesqConvenio.SQL.Add('AND INATIVO ='+#39+'N'+#39);
   QPesqConvenio.Open;

end;

procedure TFPesqConvenio.cxButton3Click(Sender: TObject);
begin
   if not QPesqConvenio.IsEmpty then
   begin
      FCadConvenio.QConvenio.Close;
      FCadConvenio.QConvenio.SQL.Clear;
      FCadConvenio.QConvenio.SQL.Add('SELECT * FROM TB_CONVENIO WHERE CODIGO ='+#39+QPesqConvenio.FieldByName('CODIGO').Text+#39);
      FCadConvenio.QConvenio.Open;

      FCadConvenio.Panel1.Enabled := True;
      FCadConvenio.QConvenio.Edit;
      close;
   end;
end;

procedure TFPesqConvenio.cxButton4Click(Sender: TObject);
begin
   //fecha o formulario
   Close;
end;

procedure TFPesqConvenio.Edit1Exit(Sender: TObject);
begin
   BitBtn1.Click;
end;

procedure TFPesqConvenio.FormShow(Sender: TObject);
begin
   Edit1.SetFocus;
end;

end.
