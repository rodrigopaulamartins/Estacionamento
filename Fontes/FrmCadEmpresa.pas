unit FrmCadEmpresa;

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
  cxCheckBox, cxDBEdit, cxTextEdit, JvExControls, JvEnterTab, StdCtrls,
  ExtCtrls, ImgList, cxButtons, cxGroupBox, ActnList, ACBrBase, ACBrValidador,
  Mask, DBCtrls;

type
  TFCadEmpresa = class(TForm)
    actlstBotoes: TActionList;
    actAcNovo: TAction;
    actAcSalvar: TAction;
    actAcPesquisa: TAction;
    cxGroupBox1: TcxGroupBox;
    cxButton4: TcxButton;
    cxButton1: TcxButton;
    cxGroupBox2: TcxGroupBox;
    cxButton5: TcxButton;
    ilImgHabilita: TImageList;
    pnl1: TPanel;
    lbl1: TLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBCheckBox1: TcxDBCheckBox;
    dsDEmpresa: TDataSource;
    QEmpresa: TZQuery;
    intgrfldQEmpresacodigo: TIntegerField;
    wdstrngfldQEmpresacnpj: TWideStringField;
    wdstrngfldQEmpresarazao_social: TWideStringField;
    wdstrngfldQEmpresaendereco: TWideStringField;
    wdstrngfldQEmpresacidade: TWideStringField;
    wdstrngfldQEmpresabairro: TWideStringField;
    wdstrngfldQEmpresacep: TWideStringField;
    wdstrngfldQEmpresauf: TWideStringField;
    wdstrngfldQEmpresabloq_hora_windows: TWideStringField;
    wdstrngfldQEmpresatelefone: TWideStringField;
    wdstrngfldQEmpresatelefone1: TWideStringField;
    cxDBTextEdit2: TcxDBTextEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    lbl5: TLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    lbl6: TLabel;
    cxDBTextEdit6: TcxDBTextEdit;
    lbl7: TLabel;
    cxDBTextEdit7: TcxDBTextEdit;
    lbl8: TLabel;
    lbl9: TLabel;
    ACBrValidador1: TACBrValidador;
    dbedttelefone: TDBEdit;
    dbedttelefone1: TDBEdit;
    dbedtcep: TDBEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    Label1: TLabel;
    QEmpresafuncionamento: TWideStringField;
    QEmpresasenhaadm: TWideStringField;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    procedure cxButton4Click(Sender: TObject);
    procedure cxDBTextEdit1Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actAcSalvarExecute(Sender: TObject);
    procedure dbedttelefoneExit(Sender: TObject);
    procedure dbedttelefoneEnter(Sender: TObject);
    procedure dbedttelefone1Enter(Sender: TObject);
    procedure dbedttelefone1Exit(Sender: TObject);
    procedure dbedtcepEnter(Sender: TObject);
    procedure dbedtcepExit(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadEmpresa: TFCadEmpresa;

implementation

uses
  Dados;

{$R *.dfm}

procedure TFCadEmpresa.actAcSalvarExecute(Sender: TObject);
begin
   QEmpresa.Post;
   QEmpresa.Edit;
end;

procedure TFCadEmpresa.cxButton4Click(Sender: TObject);
begin
   //fecha o formulario
   close;
end;

procedure TFCadEmpresa.cxDBTextEdit1Exit(Sender: TObject);
begin
    if cxDBTextEdit1.Text <> '' then
   begin
      //validar o cpf do cliente
      ACBrValidador1.TipoDocto :=docCNPJ;
      ACBrValidador1.Documento := cxDBTextEdit1.Text;
      if not (ACBrValidador1.Validar) then
      begin
         //caso o cpf for digitado errado ocorre a mensagem de erro
         cxDBTextEdit1.Text := ACBrValidador1.Formatar;
         ShowMessage('O n?mero do CNPJ  ' + cxDBTextEdit1.Text + ' ? inv?lido');
         cxDBTextEdit1.SetFocus;
         Abort;
      end;
      //caso o cpf for digitado errado ocorre a mensagem de erro
      cxDBTextEdit1.Text := ACBrValidador1.Formatar;

   end;
end;

procedure TFCadEmpresa.DBEdit1Enter(Sender: TObject);
begin
   DBEdit1.Color := clGradientActiveCaption;
end;

procedure TFCadEmpresa.DBEdit1Exit(Sender: TObject);
begin
   DBEdit1.Color := clWindow;
end;

procedure TFCadEmpresa.dbedtcepEnter(Sender: TObject);
begin
   dbedtcep.Color := clGradientActiveCaption;
end;

procedure TFCadEmpresa.dbedtcepExit(Sender: TObject);
begin
   dbedtcep.Color := clWindow;
end;

procedure TFCadEmpresa.dbedttelefone1Enter(Sender: TObject);
begin
   dbedttelefone1.Color := clGradientActiveCaption;
end;

procedure TFCadEmpresa.dbedttelefone1Exit(Sender: TObject);
begin
   dbedttelefone1.Color := clWindow;
end;

procedure TFCadEmpresa.dbedttelefoneEnter(Sender: TObject);
begin
   dbedttelefone.Color := clGradientActiveCaption;
end;

procedure TFCadEmpresa.dbedttelefoneExit(Sender: TObject);
begin
   dbedttelefone.Color := clWindow;
end;

procedure TFCadEmpresa.FormActivate(Sender: TObject);
begin
   //activa a tabela de empresa
   QEmpresa.Close;
   QEmpresa.SQL.Clear;
   QEmpresa.SQL.Add('SELECT * FROM TB_EMPRESA');
   QEmpresa.Open;

   if QEmpresa.IsEmpty then
   begin
      QEmpresa.Append;
      QEmpresa.FindField('BLOQ_HORA_WINDOWS').Value := 'N';
   end
   else
   begin
      QEmpresa.Edit;
   end;
end;

end.
