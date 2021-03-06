unit FrmCadastroVeiculoCliente;

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
  cxGridDBTableView, cxGrid, cxTextEdit, cxDBEdit, cxMaskEdit, cxCheckBox,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, JvDBLookup;

type
  TFVeiculosCliente = class(TForm)
    Botoes: TActionList;
    AcNovo: TAction;
    AcSalvar: TAction;
    AcPesquisa: TAction;
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
    cxGrid1DBTableView1codigo: TcxGridDBColumn;
    cxGrid1DBTableView1codcliente: TcxGridDBColumn;
    cxGrid1DBTableView1placa: TcxGridDBColumn;
    cxGrid1DBTableView1veiculo: TcxGridDBColumn;
    Label3: TLabel;
    cxMaskEdit1: TcxMaskEdit;
    cxTextEdit1: TcxTextEdit;
    Label1: TLabel;
    cxButton7: TcxButton;
    JvEnterAsTab2: TJvEnterAsTab;
    Label12: TLabel;
    QTipoVeiculo: TZQuery;
    DTipoVe?culo: TDataSource;
    QTipoVeiculocodigo: TIntegerField;
    QTipoVeiculodescricao: TWideStringField;
    QTipoVeiculolotacao: TIntegerField;
    QTipoVeiculovalor_quizeminutos: TFloatField;
    QTipoVeiculovalor_quinzeseguintes: TFloatField;
    QTipoVeiculovalor_trintaminutos: TFloatField;
    QTipoVeiculovalor_trintaminutos_seguinte: TFloatField;
    QTipoVeiculoprimeiros_minutos: TIntegerField;
    QTipoVeiculovalor_primeiros_minutos: TFloatField;
    QTipoVeiculovalor_hora: TFloatField;
    QTipoVeiculovalor_hora_seguinte: TFloatField;
    QTipoVeiculovalor_pernoite: TFloatField;
    QTipoVeiculovalor_diaria: TFloatField;
    QTipoVeiculoinativo: TWideStringField;
    JvDBLookupCombo1: TJvDBLookupCombo;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxButton2: TcxButton;
    QTipoVeiculocortesia: TTimeField;
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton7Click(Sender: TObject);
    procedure AcNovoExecute(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure JvDBLookupCombo1Enter(Sender: TObject);
    procedure JvDBLookupclGradientActiveCaptionCombo1Exit(Sender: TObject);
    procedure AcPesquisaExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVeiculosCliente: TFVeiculosCliente;

implementation

uses
  FrmCadastroCliente, Dados;

{$R *.dfm}

procedure TFVeiculosCliente.AcNovoExecute(Sender: TObject);
var
  verificaqtde: Integer;
begin
   verificaqtde := FCadCliente.QVeiculo.RecordCount;


   if (verificaqtde < FCadCliente.QPesqPlano.FindField('NUM_VAGAS').Value) then
   begin
      FCadCliente.QVeiculo.Append;
      FCadCliente.QVeiculo.FindField('CODCLIENTE').Value := FCadCliente.QCliente.FindField('CODIGO').Value;
      FCadCliente.QVeiculo.FindField('INATIVO'   ).Value := 'N';
      cxMaskEdit1.Enabled      := True;
      cxTextEdit1.Enabled      := True;
      JvDBLookupCombo1.Enabled := True;
      cxMaskEdit1.SetFocus;
   end
   else
   begin
      Application.MessageBox('Quantidade superior ao permitido, verifique.','ATEN??O', MB_ICONSTOP+MB_OK);
      Abort;
   end;
end;

procedure TFVeiculosCliente.AcPesquisaExecute(Sender: TObject);
begin
   //verifica se deseja escluir o registro
   if FCadCliente.QVeiculo.IsEmpty then
   begin
      Application.MessageBox('Nenhum registro selecionado.','ATEN??O', MB_ICONEXCLAMATION+MB_OK);
      Abort;
   end;
   //faz a exlcus?o caso necessaro
   if Application.MessageBox('Tem certeza que deseja excluir o registro?','ATEN??O', MB_ICONQUESTION+MB_YESNO)=IDYES then
   begin
       FCadCliente.QVeiculo.Delete;
   end;
end;

procedure TFVeiculosCliente.cxButton4Click(Sender: TObject);
begin
   //fecha o formulario
   Close;
end;

procedure TFVeiculosCliente.cxButton7Click(Sender: TObject);
begin
   FCadCliente.QVeiculo.FindField('IDTIPOVEICULO'  ).Value := QTipoVeiculo.FindField('CODIGO').Value;
   FCadCliente.QVeiculo.FindField('PLACA'          ).Value := cxMaskEdit1.Text;
   FCadCliente.QVeiculo.FindField('VEICULO'        ).Value := cxTextEdit1.Text;
   FCadCliente.QVeiculo.Post;

   cxMaskEdit1.Clear;
   cxTextEdit1.Clear;
   JvDBLookupCombo1.ClearValue;
   cxMaskEdit1.Enabled      := False;
   cxTextEdit1.Enabled      := false;
   JvDBLookupCombo1.Enabled := False;
end;

procedure TFVeiculosCliente.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
   cxMaskEdit1.Enabled      := True;
   cxTextEdit1.Enabled      := True;
   JvDBLookupCombo1.Enabled := True;
   cxMaskEdit1.SetFocus;

    FCadCliente.QVeiculo.Edit;
    cxMaskEdit1.Text       := FCadCliente.QVeiculo.FindField('PLACA'        ).Value;
    cxTextEdit1.Text       := FCadCliente.QVeiculo.FindField('VEICULO'      ).Value;
    JvDBLookupCombo1.Value := FCadCliente.QVeiculo.FindField('IDTIPOVEICULO').Value;
end;

procedure TFVeiculosCliente.FormActivate(Sender: TObject);
begin
   QTipoVeiculo.Open;
end;

procedure TFVeiculosCliente.JvDBLookupCombo1Enter(Sender: TObject);
begin
   JvDBLookupCombo1.Color := clGradientActiveCaption;
end;

procedure TFVeiculosCliente.JvDBLookupclGradientActiveCaptionCombo1Exit(Sender: TObject);
begin
    JvDBLookupCombo1.Color := clWindow;
end;

end.
