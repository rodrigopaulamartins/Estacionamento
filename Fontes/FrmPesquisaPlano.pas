unit FrmPesquisaPlano;

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
  TFPesquisaPlano = class(TForm)
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
    DPesqPlano: TDataSource;
    QPesqPlano: TZQuery;
    QPesqPlanocodigo: TIntegerField;
    QPesqPlanodescricao: TWideStringField;
    QPesqPlanohorario_inicial: TTimeField;
    QPesqPlanohora_final: TTimeField;
    QPesqPlanonum_vagas: TIntegerField;
    QPesqPlanovalor_plano: TFloatField;
    QPesqPlanoinativo: TWideStringField;
    cxGrid1DBTableView1codigo: TcxGridDBColumn;
    cxGrid1DBTableView1descricao: TcxGridDBColumn;
    cxGrid1DBTableView1horario_inicial: TcxGridDBColumn;
    cxGrid1DBTableView1hora_final: TcxGridDBColumn;
    cxGrid1DBTableView1num_vagas: TcxGridDBColumn;
    cxGrid1DBTableView1valor_plano: TcxGridDBColumn;
    cxGrid1DBTableView1inativo: TcxGridDBColumn;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPesquisaPlano: TFPesquisaPlano;

implementation

uses
  FrmCadastroPlano, Dados;

{$R *.dfm}

procedure TFPesquisaPlano.BitBtn1Click(Sender: TObject);
begin
   //faz a pesquisa
   QPesqPlano.Close;
   QPesqPlano.SQL.Clear;
   QPesqPlano.SQL.Add('SELECT * FROM TB_PLANO');
   QPesqPlano.SQL.Add('WHERE DESCRICAO LIKE'+#39+'%'+Edit1.Text+'%'+#39);
   if CheckBox1.State = cbChecked then
      QPesqPlano.SQL.Add('AND INATIVO ='+#39+'S'+#39)
   else
      QPesqPlano.SQL.Add('AND INATIVO ='+#39+'N'+#39);
   QPesqPlano.Open;

end;


procedure TFPesquisaPlano.cxButton3Click(Sender: TObject);
begin
   if not QPesqPlano.IsEmpty then
   begin
      FCadPlano.QPlano.Close;
      FCadPlano.QPlano.SQL.Clear;
      FCadPlano.QPlano.SQL.Add('SELECT * FROM TB_PLANO WHERE CODIGO ='+#39+QPesqPlano.FieldByName('CODIGO').Text+#39);
      FCadPlano.QPlano.Open;

      FCadPlano.Panel1.Enabled := True;
      FCadPlano.QPlano.Edit;
      close;
   end;
end;

procedure TFPesquisaPlano.cxButton4Click(Sender: TObject);
begin
   //fecha o formulario
   Close;
end;

procedure TFPesquisaPlano.Edit1Change(Sender: TObject);
begin
   BitBtn1.Click;
end;

procedure TFPesquisaPlano.FormShow(Sender: TObject);
begin
   Edit1.SetFocus;
end;

end.
