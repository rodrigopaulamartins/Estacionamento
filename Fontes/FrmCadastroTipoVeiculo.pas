unit FrmCadastroTipoVeiculo;

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
  dxSkinXmas2008Blue, Menus, cxCheckBox, cxDBEdit, cxMaskEdit, cxTextEdit,
  StdCtrls, ExtCtrls, ImgList, cxButtons, cxGroupBox, ActnList, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, JvExControls, JvEnterTab;

type
  TFCadTipoVeiculo = class(TForm)
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
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBCheckBox1: TcxDBCheckBox;
    DTipoVeiculo: TDataSource;
    QTipoVeiculo: TZQuery;
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
    cxDBTextEdit4: TcxDBTextEdit;
    Label6: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    Label5: TLabel;
    cxDBTextEdit6: TcxDBTextEdit;
    Label7: TLabel;
    cxDBTextEdit7: TcxDBTextEdit;
    Label8: TLabel;
    cxDBTextEdit8: TcxDBTextEdit;
    Bevel1: TBevel;
    Label9: TLabel;
    cxDBTextEdit9: TcxDBTextEdit;
    Label10: TLabel;
    cxDBTextEdit10: TcxDBTextEdit;
    Bevel2: TBevel;
    Label11: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    Label12: TLabel;
    cxDBTextEdit11: TcxDBTextEdit;
    Label13: TLabel;
    cxDBTextEdit12: TcxDBTextEdit;
    Label14: TLabel;
    cxDBTextEdit13: TcxDBTextEdit;
    JvEnterAsTab1: TJvEnterAsTab;
    QTipoVeiculocortesia: TTimeField;
    procedure cxButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AcNovoExecute(Sender: TObject);
    procedure AcSalvarExecute(Sender: TObject);
    procedure AcPesquisaExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadTipoVeiculo: TFCadTipoVeiculo;

implementation

uses
  Dados, FrmPesquisaTipoVeiculo;

{$R *.dfm}

procedure TFCadTipoVeiculo.AcNovoExecute(Sender: TObject);
begin
   //habila o painel dos edits
   Panel1.Enabled := True;
   //abre a tabela TB_CONTABANCARIA
   QTipoVeiculo.Open;
   //incluis?o de um novo registro
   QTipoVeiculo.Append;
   //joga o campo inativo = N
   QTipoVeiculo.FindField('INATIVO').Value := 'N';
   //Edit da agencia recebe o focus
   cxDBTextEdit1.SetFocus;
end;

procedure TFCadTipoVeiculo.AcPesquisaExecute(Sender: TObject);
begin
   Application.CreateForm(TFPesqTpoVeiculo, FPesqTpoVeiculo);
   FPesqTpoVeiculo.ShowModal;
   FPesqTpoVeiculo.Free;
end;

procedure TFCadTipoVeiculo.AcSalvarExecute(Sender: TObject);
begin
   //verifica se os campos est?o preenchidos
   if cxDBTextEdit1.Text = '' then
   begin
      Application.MessageBox('Informe a descri??o do plano.','ATEN??O', MB_ICONEXCLAMATION+MB_OK);
      cxDBTextEdit1.SetFocus;
      Abort;
   end
   else
   begin
      QTipoVeiculo.Post;
      Application.MessageBox('Registro salvo com sucesso!!!.','CONFIRMA??O', MB_ICONINFORMATION+MB_OK);
      //fecha a tabela
      QTipoVeiculo.Close;
      Panel1.Enabled := False;
   end;
end;

procedure TFCadTipoVeiculo.cxButton4Click(Sender: TObject);
begin
   //fecha o formulario
   Close;
end;

procedure TFCadTipoVeiculo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     //verifica se n?o esta fazendo inclus?o ou altera??o do registro
   if DTipoVeiculo.State in [dsInsert, dsEdit] then
   begin
      if Application.MessageBox('Tem certeza que deseja cancelar a Altera??o ou Inclus?o?','AVISO', MB_ICONQUESTION+MB_YESNO)= IDYES then
      begin
         QTipoVeiculo.Cancel;
         Close;
      end
      else
      begin
         Abort;
      end;
   end;
end;

end.
