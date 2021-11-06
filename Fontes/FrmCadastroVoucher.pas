unit FrmCadastroVoucher;

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
  dxSkinXmas2008Blue, Menus, cxMaskEdit, cxDropDownEdit, cxDBEdit, cxCheckBox,
  cxTextEdit, StdCtrls, ExtCtrls, ImgList, cxButtons, cxGroupBox, ActnList, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, JvExControls, JvEnterTab,
  Mask, DBCtrls;

type
  TFCadVouchers = class(TForm)
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
    Label2: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    DVoucher: TDataSource;
    QVoucher: TZQuery;
    QVouchercodigo: TIntegerField;
    QVoucherdescricao: TWideStringField;
    QVoucherplaca: TWideStringField;
    QVouchersaldo_atual: TFloatField;
    QVouchersaldo_inicial: TFloatField;
    QVouchercodvoucher: TIntegerField;
    cxDBTextEdit1: TcxDBTextEdit;
    Label3: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    Label4: TLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    JvEnterAsTab1: TJvEnterAsTab;
    dbedtplaca: TDBEdit;
    procedure cxButton4Click(Sender: TObject);
    procedure AcNovoExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure AcSalvarExecute(Sender: TObject);
    procedure AcPesquisaExecute(Sender: TObject);
    procedure dbedtplacaEnter(Sender: TObject);
    procedure dbedtplacaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadVouchers: TFCadVouchers;

implementation

uses
  Dados, FrmPesquisaVoucher;

{$R *.dfm}

procedure TFCadVouchers.AcNovoExecute(Sender: TObject);
begin
   //habila o painel dos edits
   Panel1.Enabled := True;
   //abre a tabela TB_CONTABANCARIA
   QVoucher.Open;
   //incluisão de um novo registro
   QVoucher.Append;
   //Edit da agencia recebe o focus
   cxDBTextEdit1.SetFocus;
end;

procedure TFCadVouchers.AcPesquisaExecute(Sender: TObject);
begin
   Application.CreateForm(TFPesqVoucher, FPesqVoucher);
   FPesqVoucher.ShowModal;
   FPesqVoucher.Free;
end;

procedure TFCadVouchers.AcSalvarExecute(Sender: TObject);
begin
   //verifica se os campos estão preenchidos
   if cxDBTextEdit1.Text = '' then
   begin
      Application.MessageBox('Informe o código do Voucher.','ATENÇÃO', MB_ICONEXCLAMATION+MB_OK);
      cxDBTextEdit1.SetFocus;
      Abort;
   end
   else
   begin
      if cxDBTextEdit2.Text = '  :  ' then
      begin
         Application.MessageBox('Informe a descrição.','ATENÇÃO', MB_ICONEXCLAMATION+MB_OK);
         cxDBTextEdit2.SetFocus;
         Abort;
      end
      else
      begin
         if dbedtplaca.Text = '   -    ' then
         begin
            Application.MessageBox('Informe a placa do veículo.','ATENÇÃO', MB_ICONEXCLAMATION+MB_OK);
            dbedtplaca.SetFocus;
            Abort;
         end
         else
         begin
            if cxDBTextEdit4.Text = '' then
            begin
               Application.MessageBox('Informe o saldo inicial.','ATENÇÃO', MB_ICONEXCLAMATION+MB_OK);
               cxDBTextEdit4.SetFocus;
               Abort;
            end
            else
            begin
               QVoucher.Post;
               Application.MessageBox('Registro salvo com sucesso!!!.','CONFIRMAÇÃO', MB_ICONINFORMATION+MB_OK);
               //fecha a tabela
               QVoucher.Close;
               Panel1.Enabled := False;
            end;
         end;
      end;
   end;
end;

procedure TFCadVouchers.cxButton4Click(Sender: TObject);
begin
   //fecha o formulario
   Close;
end;

procedure TFCadVouchers.dbedtplacaEnter(Sender: TObject);
begin
   dbedtplaca.Color := clGradientActiveCaption;
end;

procedure TFCadVouchers.dbedtplacaExit(Sender: TObject);
begin
   dbedtplaca.Color := clWindow;
end;

procedure TFCadVouchers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     //verifica se não esta fazendo inclusão ou alteração do registro
   if DVoucher.State in [dsInsert, dsEdit] then
   begin
      if Application.MessageBox('Tem certeza que deseja cancelar a Alteração ou Inclusão?','AVISO', MB_ICONQUESTION+MB_YESNO)= IDYES then
      begin
         QVoucher.Cancel;
         Close;
      end
      else
      begin
         Abort;
      end;
   end;
end;

procedure TFCadVouchers.FormShow(Sender: TObject);
begin
   //desativa os campos edits para não deixar alterar
   Panel1.Enabled := False;
end;

end.
