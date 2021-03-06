unit FrmConferencia;

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
  ActnList, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, Buttons, JvExControls, JvEnterTab;

type
  TFConferencia = class(TForm)
    Botoes: TActionList;
    AcNovo: TAction;
    AcSalvar: TAction;
    AcPesquisa: TAction;
    AcincluirVeiculo: TAction;
    AcMensal: TAction;
    cxGroupBox1: TcxGroupBox;
    cxButton4: TcxButton;
    cxButton1: TcxButton;
    cxGroupBox2: TcxGroupBox;
    ImgHabilita: TImageList;
    Panel1: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxgrdbclmnGrid1DBTableView1codigo: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1hora_entrada: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1placa: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1descricao: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1tipo_cliente: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1situacao: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1dt_inclucao: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1hora_saida: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1valor_cobrado: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1valor_pago: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1total_hora: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    QMovimentacao: TZQuery;
    intgrfldQMovimentacaocodigo: TIntegerField;
    wdstrngfldQMovimentacaoplaca: TWideStringField;
    wdstrngfldQMovimentacaodescricao: TWideStringField;
    wdstrngfldQMovimentacaotipo_cliente: TWideStringField;
    QMovimentacaohora_entrada: TDateTimeField;
    wdstrngfldQMovimentacaosituacao: TWideStringField;
    QMovimentacaodt_inclucao: TDateField;
    QMovimentacaohora_saida: TDateTimeField;
    QMovimentacaovalor_cobrado: TFloatField;
    QMovimentacaovalor_pago: TFloatField;
    intgrfldQMovimentacaototal_hora: TIntegerField;
    QMovimentacaotipoveiculo: TIntegerField;
    intgrfldQMovimentacaocodconvenio: TIntegerField;
    QMovimentacaovalor_desconto: TFloatField;
    dsDMovimentacao: TDataSource;
    Panel2: TPanel;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    Label1: TLabel;
    cxComboBox1: TcxComboBox;
    Label2: TLabel;
    cxComboBox2: TcxComboBox;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    JvEnterAsTab1: TJvEnterAsTab;
    PopupMenu1: TPopupMenu;
    Reverter1: TMenuItem;
    QDelCaixa: TZQuery;
    QDelAnotacao: TZQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure cxDateEdit2Exit(Sender: TObject);
    procedure Reverter1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConferencia: TFConferencia;

implementation

uses
  FrmMovimentacao, Dados;

{$R *.dfm}

procedure TFConferencia.BitBtn1Click(Sender: TObject);
begin
   if cxDateEdit1.Text = '' then
   begin
      Application.MessageBox('Informe a data inicial para a pesquisa.','ATEN??O', MB_ICONEXCLAMATION+ MB_OK);
      cxDateEdit1.SetFocus;
      Abort;
   end
   else
   begin
      if cxDateEdit2.Text = '' then
      begin
         Application.MessageBox('Informe a data final para a pesquisa.','ATEN??O', MB_ICONEXCLAMATION+ MB_OK);
         cxDateEdit2.SetFocus;
         Abort;
      end
      else
      begin
         QMovimentacao.Close;
         QMovimentacao.SQL.Clear;
         QMovimentacao.SQL.Add('SELECT * FROM TB_MOVIMENTACAO');
         QMovimentacao.SQL.Add('WHERE DT_INCLUCAO BETWEEN :DATA1 AND :DATA2');
         QMovimentacao.ParamByName('DATA1').AsDate := cxDateEdit1.Date;
         QMovimentacao.ParamByName('DATA2').AsDate := cxDateEdit2.Date;

         if cxComboBox1.ItemIndex = 0 then
         begin
            QMovimentacao.SQL.Add('AND SITUACAO ='+#39+'P'+#39);
         end;

         if cxComboBox1.ItemIndex = 1 then
         begin
            QMovimentacao.SQL.Add('AND SITUACAO ='+#39+'N'+#39);
         end;

         if cxComboBox1.ItemIndex = 2 then
         begin
            QMovimentacao.SQL.Add('AND SITUACAO ='+#39+'C'+#39);
         end;

         if cxComboBox1.ItemIndex = 3 then
         begin
            QMovimentacao.SQL.Add('AND SITUACAO ='+#39+'R'+#39);
         end;

         if cxComboBox2.ItemIndex = 0 then
         begin
            QMovimentacao.SQL.Add('AND TIPO_CLIENTE ='+#39+'A'+#39);
         end;

         if cxComboBox2.ItemIndex = 1 then
         begin
            QMovimentacao.SQL.Add('AND TIPO_CLIENTE ='+#39+'I'+#39);
         end;

         if cxComboBox2.ItemIndex = 2 then
         begin
            QMovimentacao.SQL.Add('AND TIPO_CLIENTE ='+#39+'M'+#39);
         end;
         QMovimentacao.SQL.Add('ORDER BY DT_INCLUCAO DESC');
         QMovimentacao.Open;
      end;
   end;
end;

procedure TFConferencia.cxDateEdit2Exit(Sender: TObject);
begin
   if cxDateEdit2.Date < cxDateEdit1.Date then
   begin
      Application.MessageBox('Data final menor que a inicial, verifique.','ATEN??O', MB_ICONEXCLAMATION+ MB_OK);
      cxDateEdit2.SetFocus;
      Abort;
   end;
end;

procedure TFConferencia.Reverter1Click(Sender: TObject);
begin
   if QMovimentacao.FindField('SITUACAO').Value <> 'C' then
   begin
      if Application.MessageBox('Tem certeza que deseja reverter o ve?culo.','ATEN??O', MB_ICONQUESTION+MB_YESNO)=IDYES then
      begin
         QMovimentacao.Edit;
         QMovimentacao.FindField('SITUACAO').Value := 'A';
         QMovimentacao.Post;

         QDelCaixa.Close;
         QDelCaixa.SQL.Clear;
         QDelCaixa.SQL.Add('DELETE FROM TB_CAIXA');
         QDelCaixa.SQL.Add('WHERE IDMOVIMENTACAO ='+#39+QMovimentacao.FieldByName('CODIGO').Text+#39);
         QDelCaixa.ExecSQL;

         QDelAnotacao.Close;
         QDelAnotacao.SQL.Clear;
         QDelAnotacao.SQL.Add('DELETE FROM TB_ANOTACAO');
         QDelAnotacao.SQL.Add('WHERE IDMOVIMENTACAO ='+#39+QMovimentacao.FieldByName('CODIGO').Text+#39);
         QDelAnotacao.ExecSQL;

         FMovimentacao.QMovimentacao.Close;
         FMovimentacao.QMovimentacao.SQL.Clear;
         FMovimentacao.QMovimentacao.SQL.Add('SELECT * FROM TB_MOVIMENTACAO');
         FMovimentacao.QMovimentacao.SQL.Add('WHERE DT_INCLUCAO = :DATA1');
         FMovimentacao.QMovimentacao.SQL.Add('AND SITUACAO = '+#39+'A'+#39);
         FMovimentacao.QMovimentacao.ParamByName('DATA1').AsDate := Date;
         FMovimentacao.QMovimentacao.Open;
         Close;
      end;
   end;
end;

end.
