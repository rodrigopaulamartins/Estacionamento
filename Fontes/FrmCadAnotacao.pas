unit FrmCadAnotacao;

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
  cxCheckBox, cxDBEdit, cxMaskEdit, cxTextEdit, JvExControls, JvEnterTab,
  StdCtrls, ExtCtrls, ImgList, cxButtons, cxGroupBox, ActnList;

type
  TFCadAnotacao = class(TForm)
    actlstBotoes: TActionList;
    actAcNovo: TAction;
    actAcSalvar: TAction;
    actAcPesquisa: TAction;
    cxGroupBox1: TcxGroupBox;
    cxButton4: TcxButton;
    cxButton1: TcxButton;
    cxGroupBox2: TcxGroupBox;
    cxButton3: TcxButton;
    cxButton2: TcxButton;
    cxButton5: TcxButton;
    ilImgHabilita: TImageList;
    pnl1: TPanel;
    lbl1: TLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBCheckBox1: TcxDBCheckBox;
    QAnotacao: TZQuery;
    dsDAnotacao: TDataSource;
    intgrfldQAnotacaocodigo: TIntegerField;
    intgrfldQAnotacaocod_cliente: TIntegerField;
    wdstrngfldQAnotacaoplaca: TWideStringField;
    wdstrngfldQAnotacaomensagem: TWideStringField;
    wdstrngfldQAnotacaopermite_entrada: TWideStringField;
    wdstrngfldQAnotacaoimprimi_cupom: TWideStringField;
    cxDBMaskEdit1: TcxDBMaskEdit;
    lbl2: TLabel;
    cxDBCheckBox2: TcxDBCheckBox;
    cxDBCheckBox3: TcxDBCheckBox;
    wdstrngfldQAnotacaoinativo: TWideStringField;
    QAnotacaoidmovimentacao: TIntegerField;
    procedure cxButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure actAcNovoExecute(Sender: TObject);
    procedure actAcSalvarExecute(Sender: TObject);
    procedure actAcPesquisaExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadAnotacao: TFCadAnotacao;

implementation

uses
  Dados, FrmPesquisaAnotacao, FrmMovimentacao;

{$R *.dfm}

procedure TFCadAnotacao.actAcNovoExecute(Sender: TObject);
begin
   //habila o painel dos edits
   pnl1.Enabled := True;
   //abre a tabela TB_CONTABANCARIA
   QAnotacao.Open;
   //incluis?o de um novo registro
   QAnotacao.Append;
   //joga valor de N
   QAnotacao.FindField('PERMITE_ENTRADA').Value := 'N';
   QAnotacao.FindField('IMPRIMI_CUPOM'  ).Value := 'N';
   QAnotacao.FindField('INATIVO'        ).Value := 'N';

   //Edit da agencia recebe o focus
   cxDBTextEdit1.SetFocus;
end;

procedure TFCadAnotacao.actAcPesquisaExecute(Sender: TObject);
begin
   //abre o formulario de pequisa de anota??o
   Application.CreateForm(TFPesqAnotacao, FPesqAnotacao);
   FPesqAnotacao.ShowModal;
   FPesqAnotacao.Free;
end;

procedure TFCadAnotacao.actAcSalvarExecute(Sender: TObject);
begin
   //verifica se os campos est?o preenchidos
   if cxDBMaskEdit1.Text = '' then
   begin
      Application.MessageBox('Informe a placa.','ATEN??O', MB_ICONEXCLAMATION+MB_OK);
      cxDBMaskEdit1.SetFocus;
      Abort;
   end
   else
   begin
      if cxDBTextEdit1.Text = '  :  ' then
      begin
         Application.MessageBox('Informe a mensagem.','ATEN??O', MB_ICONEXCLAMATION+MB_OK);
         cxDBTextEdit1.SetFocus;
         Abort;
      end
      else
      begin
         QAnotacao.Post;
         Application.MessageBox('Registro salvo com sucesso!!!.','CONFIRMA??O', MB_ICONINFORMATION+MB_OK);
         //fecha a tabela
         QAnotacao.Close;
         pnl1.Enabled := False;
      end;
   end;
end;

procedure TFCadAnotacao.cxButton4Click(Sender: TObject);
begin
   //fecha o formulario de anot???o
   if Tag = 1 then
   begin
      FMovimentacao.QMovimentacao.Close;
      FMovimentacao.QMovimentacao.SQL.Clear;
      FMovimentacao.QMovimentacao.SQL.Add('SELECT * FROM TB_MOVIMENTACAO');
      FMovimentacao.QMovimentacao.SQL.Add('WHERE DT_INCLUCAO = :DATA1');
      FMovimentacao.QMovimentacao.SQL.Add('AND SITUACAO = '+#39+'A'+#39);
      FMovimentacao.QMovimentacao.ParamByName('DATA1').AsDate := Date;
      FMovimentacao.QMovimentacao.Open;
      FMovimentacao.cxMaskEdit1.SetFocus;
   end;
   Close;
end;

procedure TFCadAnotacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     //verifica se n?o esta fazendo inclus?o ou altera??o do registro
   if dsDAnotacao.State in [dsInsert, dsEdit] then
   begin
      if Application.MessageBox('Tem certeza que deseja cancelar a Altera??o ou Inclus?o?','AVISO', MB_ICONQUESTION+MB_YESNO)= IDYES then
      begin
         QAnotacao.Cancel;
         Close;
      end
      else
      begin
         Abort;
      end;
   end;
end;

procedure TFCadAnotacao.FormShow(Sender: TObject);
begin
    if Tag = 1 then
    begin
        pnl1.Enabled := True;
        QAnotacao.Open;
        QAnotacao.Append;
        QAnotacao.FindField('INATIVO'        ).Value := 'N';
        QAnotacao.FindField('PERMITE_ENTRADA').Value := 'N';
        QAnotacao.FindField('IMPRIMI_CUPOM'  ).Value := 'N';
        QAnotacao.FindField('IDMOVIMENTACAO' ).Value := FMovimentacao.QMovimentacao.FindField('CODIGO').Value;;

        QAnotacao.FindField('PLACA'          ).Value := FMovimentacao.QMovimentacao.FindField('PLACA').Value;
        //Edit da agencia recebe o focus
        cxDBTextEdit1.SetFocus;
    end
    else
    begin
       //desativa os campos edits para n?o deixar alterar
       pnl1.Enabled := False;
    end;
end;

end.
