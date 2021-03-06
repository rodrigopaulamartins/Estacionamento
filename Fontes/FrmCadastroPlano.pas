unit FrmCadastroPlano;

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
  dxSkinXmas2008Blue, Menus, ExtCtrls, ImgList, StdCtrls, cxButtons, cxGroupBox,
  ActnList, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, cxTextEdit,
  cxDBEdit, cxMaskEdit, cxCheckBox, JvExControls, JvEnterTab, Mask, DBCtrls;

type
  TFCadPlano = class(TForm)
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
    DPlano: TDataSource;
    QPlano: TZQuery;
    QPlanocodigo: TIntegerField;
    QPlanodescricao: TWideStringField;
    QPlanohorario_inicial: TTimeField;
    QPlanohora_final: TTimeField;
    QPlanonum_vagas: TIntegerField;
    QPlanovalor_plano: TFloatField;
    QPlanoinativo: TWideStringField;
    Label1: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    Label5: TLabel;
    cxDBCheckBox1: TcxDBCheckBox;
    JvEnterAsTab1: TJvEnterAsTab;
    cxDBTextEdit3: TcxDBTextEdit;
    dbedthorario_inicial: TDBEdit;
    dbedthora_final: TDBEdit;
    QPlanocob_valor: TWideStringField;
    cxDBCheckBox2: TcxDBCheckBox;
    procedure cxButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure AcNovoExecute(Sender: TObject);
    procedure AcSalvarExecute(Sender: TObject);
    procedure AcPesquisaExecute(Sender: TObject);
    procedure dbedthorario_inicialEnter(Sender: TObject);
    procedure dbedthorario_inicialExit(Sender: TObject);
    procedure dbedthora_finalEnter(Sender: TObject);
    procedure dbedthora_finalExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadPlano: TFCadPlano;

implementation

uses
  Dados, FrmPesquisaPlano;

{$R *.dfm}

procedure TFCadPlano.AcNovoExecute(Sender: TObject);
begin
   //habila o painel dos edits
   Panel1.Enabled := True;
   //abre a tabela TB_CONTABANCARIA
   QPlano.Open;
   //incluis?o de um novo registro
   QPlano.Append;
   //joga o campo inativo = N
   QPlano.FindField('INATIVO').Value := 'N';
   //Edit da agencia recebe o focus
   cxDBTextEdit1.SetFocus;
end;

procedure TFCadPlano.AcPesquisaExecute(Sender: TObject);
begin
   Application.CreateForm(TFPesquisaPlano, FPesquisaPlano);
   FPesquisaPlano.ShowModal;
   FPesquisaPlano.Free;
end;

procedure TFCadPlano.AcSalvarExecute(Sender: TObject);
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
      if dbedthorario_inicial.Text = '  :  ' then
      begin
         Application.MessageBox('Informe a hor?rio inicial.','ATEN??O', MB_ICONEXCLAMATION+MB_OK);
         dbedthorario_inicial.SetFocus;
         Abort;
      end
      else
      begin
         if dbedthora_final.Text = '  :  ' then
         begin
            Application.MessageBox('Informe a hor?rio final.','ATEN??O', MB_ICONEXCLAMATION+MB_OK);
            dbedthora_final.SetFocus;
            Abort;
         end
         else
         begin
            if cxDBTextEdit2.Text = '' then
            begin
               Application.MessageBox('Informe a quantidade de vagas.','ATEN??O', MB_ICONEXCLAMATION+MB_OK);
               cxDBTextEdit2.SetFocus;
               Abort;
            end
            else
            begin
               if cxDBTextEdit3.Text = '' then
               begin
                  Application.MessageBox('Informe o valor do plano.','ATEN??O', MB_ICONEXCLAMATION+MB_OK);
                  cxDBTextEdit3.SetFocus;
                  Abort;
               end
               else
               begin
                  QPlano.Post;
                  Application.MessageBox('Registro salvo com sucesso!!!.','CONFIRMA??O', MB_ICONINFORMATION+MB_OK);
                  //fecha a tabela
                  QPlano.Close;
                  Panel1.Enabled := False;
               end;
            end;
         end;
      end;
   end;
end;

procedure TFCadPlano.cxButton4Click(Sender: TObject);
begin
   //fecha o formulario de cadatro de plano
   Close;
end;

procedure TFCadPlano.dbedthorario_inicialEnter(Sender: TObject);
begin
   dbedthorario_inicial.Color := clGradientActiveCaption;
end;

procedure TFCadPlano.dbedthorario_inicialExit(Sender: TObject);
begin
   dbedthorario_inicial.Color := clWindow;
end;

procedure TFCadPlano.dbedthora_finalEnter(Sender: TObject);
begin
   dbedthora_final.Color := clGradientActiveCaption;
end;

procedure TFCadPlano.dbedthora_finalExit(Sender: TObject);
begin
   dbedthora_final.Color := clWindow;
end;

procedure TFCadPlano.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     //verifica se n?o esta fazendo inclus?o ou altera??o do registro
   if DPlano.State in [dsInsert, dsEdit] then
   begin
      if Application.MessageBox('Tem certeza que deseja cancelar a Altera??o ou Inclus?o?','AVISO', MB_ICONQUESTION+MB_YESNO)= IDYES then
      begin
         QPlano.Cancel;
         Close;
      end
      else
      begin
         Abort;
      end;
   end;
end;


procedure TFCadPlano.FormShow(Sender: TObject);
begin
   //desativa os campos edits para n?o deixar alterar
   Panel1.Enabled := False;
end;

end.
