unit FrmCadConvenio;

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
  dxSkinXmas2008Blue, Menus, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  cxCheckBox, cxDBEdit, cxMaskEdit, cxTextEdit, StdCtrls, ExtCtrls, ImgList,
  cxButtons, cxGroupBox, ActnList, cxDropDownEdit, JvExControls, JvEnterTab,
  JvExStdCtrls, JvCombobox, JvDBCombobox;

type
  TFCadConvenio = class(TForm)
    Botoes: TActionList;
    AcNovo: TAction;
    AcSalvar: TAction;
    AcPesquisa: TAction;
    cxGroupBox1: TcxGroupBox;
    cxButton4: TcxButton;
    cxButton1: TcxButton;
    cxGroupBox2: TcxGroupBox;
    cxButton3: TcxButton;
    cxButton2: TcxButton;
    cxButton5: TcxButton;
    ImgHabilita: TImageList;
    Panel1: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBCheckBox1: TcxDBCheckBox;
    DConvenio: TDataSource;
    QConvenio: TZQuery;
    QConveniocodigo: TIntegerField;
    QConveniodescricao: TWideStringField;
    QConveniotipo_desconto: TWideStringField;
    QConveniovalor_desconto: TFloatField;
    QConveniocobrar_cliente: TWideStringField;
    QConvenioinativo: TWideStringField;
    Label2: TLabel;
    cxDBCheckBox2: TcxDBCheckBox;
    JvEnterAsTab1: TJvEnterAsTab;
    JvDBComboBox1: TJvDBComboBox;
    procedure cxButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure AcNovoExecute(Sender: TObject);
    procedure AcSalvarExecute(Sender: TObject);
    procedure AcPesquisaExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadConvenio: TFCadConvenio;

implementation

uses
  Dados, FrmPesquisaConvenio;

{$R *.dfm}

procedure TFCadConvenio.AcNovoExecute(Sender: TObject);
begin
   //habila o painel dos edits
   Panel1.Enabled := True;
   //abre a tabela TB_CONTABANCARIA
   QConvenio.Open;
   //incluis?o de um novo registro
   QConvenio.Append;
   QConvenio.FindField('INATIVO'       ).Value := 'N';
   QConvenio.FindField('COBRAR_CLIENTE').Value := 'N';
   //Edit da agencia recebe o focus
   cxDBTextEdit1.SetFocus;
end;

procedure TFCadConvenio.AcPesquisaExecute(Sender: TObject);
begin
   Application.CreateForm(TFPesqConvenio, FPesqConvenio);
   FPesqConvenio.ShowModal;
   FPesqConvenio.Free;
end;

procedure TFCadConvenio.AcSalvarExecute(Sender: TObject);
begin
   //verifica se os campos est?o preenchidos
   if cxDBTextEdit1.Text = '' then
   begin
      Application.MessageBox('Informe a descri??o.','ATEN??O', MB_ICONEXCLAMATION+MB_OK);
      cxDBTextEdit1.SetFocus;
      Abort;
   end
   else
   begin
      if JvDBComboBox1.Text = '' then
      begin
         Application.MessageBox('Informe o tipo de desconto.','ATEN??O', MB_ICONEXCLAMATION+MB_OK);
         JvDBComboBox1.SetFocus;
         Abort;
      end
      else
      begin
         if cxDBTextEdit3.Text = '' then
         begin
            Application.MessageBox('Informe o valor do conv?nio.','ATEN??O', MB_ICONEXCLAMATION+MB_OK);
            cxDBTextEdit3.SetFocus;
            Abort;
         end
         else
         begin
            QConvenio.Post;
            Application.MessageBox('Registro salvo com sucesso!!!.','CONFIRMA??O', MB_ICONINFORMATION+MB_OK);
            //fecha a tabela
            QConvenio.Close;
            Panel1.Enabled := False;
         end;
      end;
   end;
end;

procedure TFCadConvenio.cxButton4Click(Sender: TObject);
begin
   //fecha o formulario
   Close;
end;

procedure TFCadConvenio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     //verifica se n?o esta fazendo inclus?o ou altera??o do registro
   if DConvenio.State in [dsInsert, dsEdit] then
   begin
      if Application.MessageBox('Tem certeza que deseja cancelar a Altera??o ou Inclus?o?','AVISO', MB_ICONQUESTION+MB_YESNO)= IDYES then
      begin
         QConvenio.Cancel;
         Close;
      end
      else
      begin
         Abort;
      end;
   end;
end;

procedure TFCadConvenio.FormShow(Sender: TObject);
begin
   //desativa os campos edits para n?o deixar alterar
   Panel1.Enabled := False;
end;

end.
