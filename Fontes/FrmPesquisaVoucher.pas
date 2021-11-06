unit FrmPesquisaVoucher;

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
  TFPesqVoucher = class(TForm)
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
    QPesqVoucher: TZQuery;
    DPesqVoucher: TDataSource;
    QPesqVouchercodigo: TIntegerField;
    QPesqVoucherdescricao: TWideStringField;
    QPesqVoucherplaca: TWideStringField;
    QPesqVouchersaldo_atual: TFloatField;
    QPesqVouchersaldo_inicial: TFloatField;
    QPesqVouchercodvoucher: TIntegerField;
    cxGrid1DBTableView1codigo: TcxGridDBColumn;
    cxGrid1DBTableView1codvoucher: TcxGridDBColumn;
    cxGrid1DBTableView1descricao: TcxGridDBColumn;
    cxGrid1DBTableView1placa: TcxGridDBColumn;
    cxGrid1DBTableView1saldo_atual: TcxGridDBColumn;
    cxGrid1DBTableView1saldo_inicial: TcxGridDBColumn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPesqVoucher: TFPesqVoucher;

implementation

uses
  Dados, FrmCadastroVoucher;

{$R *.dfm}

procedure TFPesqVoucher.BitBtn1Click(Sender: TObject);
begin
   //faz a pesquisa
   QPesqVoucher.Close;
   QPesqVoucher.SQL.Clear;
   QPesqVoucher.SQL.Add('SELECT * FROM TB_VOUCHERS');
   if ComboBox1.ItemIndex = 0 then
      QPesqVoucher.SQL.Add('WHERE DESCRICAO LIKE'+#39+'%'+Edit1.Text+'%'+#39)
   else
      QPesqVoucher.SQL.Add('WHERE CODVOUCHER LIKE'+#39+'%'+Edit1.Text+'%'+#39);
      QPesqVoucher.SQL.Add('ORDER BY DESCRICAO');
   QPesqVoucher.Open;
end;

procedure TFPesqVoucher.cxButton3Click(Sender: TObject);
begin
   if not QPesqVoucher.IsEmpty then
   begin
      FCadVouchers.QVoucher.Close;
      FCadVouchers.QVoucher.SQL.Clear;
      FCadVouchers.QVoucher.SQL.Add('SELECT * FROM TB_VOUCHERS WHERE CODIGO ='+#39+QPesqVoucher.FieldByName('CODIGO').Text+#39);
      FCadVouchers.QVoucher.Open;

      FCadVouchers.Panel1.Enabled := True;
      FCadVouchers.QVoucher.Edit;
      close;
   end;
end;

procedure TFPesqVoucher.Edit1Exit(Sender: TObject);
begin
   BitBtn1.Click;
end;

procedure TFPesqVoucher.FormShow(Sender: TObject);
begin
   Edit1.SetFocus;
end;

end.
