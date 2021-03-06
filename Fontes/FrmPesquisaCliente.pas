unit FrmPesquisaCliente;

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
  TFPesqCliente = class(TForm)
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
    DPesqCliente: TDataSource;
    QPesqCliente: TZQuery;
    QPesqClientecodigo: TIntegerField;
    QPesqClientetipo_pessoa: TWideStringField;
    QPesqClientecpf_cnpj: TWideStringField;
    QPesqClientenome: TWideStringField;
    QPesqClientecep: TWideStringField;
    QPesqClienteendereco: TWideStringField;
    QPesqClientebairro: TWideStringField;
    QPesqClientecidade: TWideStringField;
    QPesqClienteestado: TWideStringField;
    QPesqClientetelefone: TWideStringField;
    QPesqClientecelular: TWideStringField;
    QPesqClienteemail: TWideStringField;
    QPesqClienteidplano: TIntegerField;
    QPesqClientedt_validade: TDateField;
    QPesqClienteobservacao: TWideStringField;
    QPesqClienteinativo: TWideStringField;
    cxGrid1DBTableView1codigo: TcxGridDBColumn;
    cxGrid1DBTableView1tipo_pessoa: TcxGridDBColumn;
    cxGrid1DBTableView1cpf_cnpj: TcxGridDBColumn;
    cxGrid1DBTableView1nome: TcxGridDBColumn;
    cxGrid1DBTableView1cep: TcxGridDBColumn;
    cxGrid1DBTableView1endereco: TcxGridDBColumn;
    cxGrid1DBTableView1bairro: TcxGridDBColumn;
    cxGrid1DBTableView1cidade: TcxGridDBColumn;
    cxGrid1DBTableView1estado: TcxGridDBColumn;
    cxGrid1DBTableView1telefone: TcxGridDBColumn;
    cxGrid1DBTableView1celular: TcxGridDBColumn;
    cxGrid1DBTableView1email: TcxGridDBColumn;
    cxGrid1DBTableView1idplano: TcxGridDBColumn;
    cxGrid1DBTableView1dt_validade: TcxGridDBColumn;
    cxGrid1DBTableView1observacao: TcxGridDBColumn;
    cxGrid1DBTableView1inativo: TcxGridDBColumn;
    procedure cxButton4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPesqCliente: TFPesqCliente;

implementation

uses
  Dados, FrmCadastroCliente;

{$R *.dfm}

procedure TFPesqCliente.BitBtn1Click(Sender: TObject);
begin
   //faz a pesquisa
   QPesqCliente.Close;
   QPesqCliente.SQL.Clear;
   QPesqCliente.SQL.Add('SELECT * FROM TB_CLIENTE');
   QPesqCliente.SQL.Add('WHERE NOME LIKE'+#39+'%'+Edit1.Text+'%'+#39);
   if CheckBox1.State = cbChecked then
      QPesqCliente.SQL.Add('AND INATIVO ='+#39+'S'+#39)
   else
      QPesqCliente.SQL.Add('AND INATIVO ='+#39+'N'+#39);
   QPesqCliente.Open;
end;

procedure TFPesqCliente.cxButton3Click(Sender: TObject);
begin
   if not QPesqCliente.IsEmpty then
   begin
      FCadCliente.QCliente.Close;
      FCadCliente.QCliente.SQL.Clear;
      FCadCliente.QCliente.SQL.Add('SELECT * FROM TB_CLIENTE WHERE CODIGO ='+#39+QPesqCliente.FieldByName('CODIGO').Text+#39);
      FCadCliente.QCliente.Open;

      FCadCliente.Panel1.Enabled := True;
      FCadCliente.QCliente.Edit;
      close;
   end;
end;

procedure TFPesqCliente.cxButton4Click(Sender: TObject);
begin
   //fecha o formulario
   Close;
end;

procedure TFPesqCliente.Edit1Exit(Sender: TObject);
begin
   BitBtn1.Click;
end;

procedure TFPesqCliente.FormShow(Sender: TObject);
begin
   Edit1.SetFocus;
end;

end.
