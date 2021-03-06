unit FrmCadMensalidade;

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
  cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, JvExControls, JvEnterTab, ExtCtrls, StdCtrls,
  cxButtons, cxGroupBox, ImgList, ActnList, cxTextEdit, cxDBEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxRadioGroup, Buttons,DateUtils,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, IniFiles;

type
  TFCadMensalidades = class(TForm)
    Botoes: TActionList;
    AcNovo: TAction;
    AcSalvar: TAction;
    AcPesquisa: TAction;
    ImgHabilita: TImageList;
    ActionList1: TActionList;
    Action1: TAction;
    AcSalvarM: TAction;
    AcExcluir: TAction;
    cxGroupBox1: TcxGroupBox;
    cxButton4: TcxButton;
    cxButton1: TcxButton;
    cxGroupBox2: TcxGroupBox;
    cxButton3: TcxButton;
    ImageList1: TImageList;
    Panel1: TPanel;
    JvEnterAsTab1: TJvEnterAsTab;
    JvEnterAsTab2: TJvEnterAsTab;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1codigo: TcxGridDBColumn;
    cxGrid1DBTableView1codcliente: TcxGridDBColumn;
    cxGrid1DBTableView1dt_vencimento: TcxGridDBColumn;
    cxGrid1DBTableView1vlr_pagar: TcxGridDBColumn;
    cxGrid1DBTableView1dt_pagamento: TcxGridDBColumn;
    cxGrid1DBTableView1vlr_pago: TcxGridDBColumn;
    cxGrid1DBTableView1situacao: TcxGridDBColumn;
    cxGrid1DBTableView1historico: TcxGridDBColumn;
    cxDBTextEdit2: TcxDBTextEdit;
    Label6: TLabel;
    Label13: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    Label8: TLabel;
    cxDBTextEdit6: TcxDBTextEdit;
    Label1: TLabel;
    cxDBDateEdit2: TcxDBDateEdit;
    Label2: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxButton5: TcxButton;
    cxButton2: TcxButton;
    cxRadioGroup1: TcxRadioGroup;
    AcBaixar: TAction;
    cxDBDateEdit3: TcxDBDateEdit;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    Label4: TLabel;
    Edit1: TEdit;
    QEmpresa: TZQuery;
    QEmpresacodigo: TIntegerField;
    QEmpresacnpj: TWideStringField;
    QEmpresarazao_social: TWideStringField;
    QEmpresaendereco: TWideStringField;
    QEmpresacidade: TWideStringField;
    QEmpresabairro: TWideStringField;
    QEmpresacep: TWideStringField;
    QEmpresauf: TWideStringField;
    QEmpresabloq_hora_windows: TWideStringField;
    QEmpresatelefone: TWideStringField;
    QEmpresatelefone1: TWideStringField;
    QEmpresafuncionamento: TWideStringField;
    QEmpresasenhaadm: TWideStringField;
    QVerMensalidade: TZQuery;
    QVerMensalidadecodigo: TIntegerField;
    QVerMensalidadecodcliente: TIntegerField;
    QVerMensalidadedt_vencimento: TDateField;
    QVerMensalidadevlr_pagar: TFloatField;
    QVerMensalidadedt_pagamento: TDateField;
    QVerMensalidadevlr_pago: TFloatField;
    QVerMensalidadesituacao: TWideStringField;
    QVerMensalidadehistorico: TWideStringField;
    QVerMensalidadedt_final: TDateField;
    QVerMensalidadefechado: TWideStringField;
    BitBtn4: TBitBtn;
    QPlano: TZQuery;
    QPlanocodigo: TIntegerField;
    QPlanodescricao: TWideStringField;
    QPlanohorario_inicial: TTimeField;
    QPlanohora_final: TTimeField;
    QPlanonum_vagas: TIntegerField;
    QPlanovalor_plano: TFloatField;
    QPlanoinativo: TWideStringField;
    QPlanocob_valor: TWideStringField;
    QCaixa: TZQuery;
    intgrfldQCaixacodigo: TIntegerField;
    wdstrngfldQCaixadescricao: TWideStringField;
    wdstrngfldQCaixatipo: TWideStringField;
    QCaixavalor_pago: TFloatField;
    wdstrngfldQCaixafechado: TWideStringField;
    QCaixadt_entrada: TDateField;
    QCaixavalor_saida: TFloatField;
    QCaixaidmovimentacao: TIntegerField;
    procedure AcExcluirExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxRadioGroup1Click(Sender: TObject);
    procedure AcSalvarMExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cxButton4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cxDBDateEdit1Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  FCadMensalidades: TFCadMensalidades;
  inclusao: Integer;

implementation

uses
  FrmCadastroCliente, Dados;

{$R *.dfm}

procedure TFCadMensalidades.AcExcluirExecute(Sender: TObject);
begin
   if FCadCliente.QMensalidade.FindField('SITUACAO').Value = 'P' then
   begin
      Application.MessageBox('Mensalidade baixada n?o pode ser cancelada?','ATEN??O', MB_ICONEXCLAMATION+MB_OK);
      Abort;
   end;
   //apenas faz o cancelamento do titulo
   if Application.MessageBox('Tem certeza que deseja cancelar a mensalidade?','ATEN??O', MB_ICONQUESTION+MB_YESNO)=IDYES then
   begin
      FCadCliente.QMensalidade.Edit;
      FCadCliente.QMensalidade.FindField('SITUACAO').Value := 'C';
      FCadCliente.QMensalidade.Post;
   end;
   FCadCliente.QMensalidade.Close;
   FCadCliente.QMensalidade.SQL.Clear;
   FCadCliente.QMensalidade.SQL.Add('SELECT * FROM TB_MENSALIDADE');
   FCadCliente.QMensalidade.SQL.Add('WHERE CODCLIENTE =:CODIGO');

   if cxRadioGroup1.ItemIndex = 0 then
   begin
      FCadCliente.QMensalidade.SQL.Add('AND SITUACAO ='+#39+'A'+#39);
   end;

   if cxRadioGroup1.ItemIndex = 1 then
   begin
      FCadCliente.QMensalidade.SQL.Add('AND SITUACAO ='+#39+'P'+#39);
   end;

   if cxRadioGroup1.ItemIndex = 2 then
   begin
      FCadCliente.QMensalidade.SQL.Add('AND SITUACAO ='+#39+'C'+#39);
   end;
   FCadCliente.QMensalidade.SQL.Add('ORDER BY DT_VENCIMENTO DESC');
   FCadCliente.QMensalidade.Open;

end;

procedure TFCadMensalidades.Action1Execute(Sender: TObject);
begin
   inclusao:= 1;
   FCadCliente.QMensalidade.Append;
   FCadCliente.QMensalidade.FindField('CODCLIENTE').Value := FCadCliente.QCliente.FindField('CODIGO').Value;
   FCadCliente.QMensalidade.FindField('SITUACAO'  ).Value := 'A';
   //acha o plano do cliente
   QPlano.Close;
   QPlano.SQL.Clear;
   QPlano.SQL.Add('SELECT * FROM TB_PLANO');
   QPlano.SQL.Add('WHERE CODIGO ='+#39+FCadCliente.QCliente.FieldByName('IDPLANO').Text+#39);
   QPlano.Open;

   FCadCliente.QMensalidade.FindField('VLR_PAGAR' ).Value := QPlano.FindField('VALOR_PLANO').Value;
   FCadCliente.QMensalidade.FindField('HISTORICO' ).Value := QPlano.FindField('DESCRICAO'  ).Value;
   FCadCliente.QMensalidade.FindField('FECHADO'   ).Value := 'N';

   cxDBTextEdit1.Enabled := False;
   cxDBTextEdit2.SetFocus;
end;

procedure TFCadMensalidades.BitBtn1Click(Sender: TObject);
var
  qtddias, qtddiastot: Integer;
  vlrpago: Currency;
  dt_inicial : TDate;
begin
   //baixa do registro
   if FCadCliente.QMensalidade.FindField('SITUACAO').Value= 'P' then
   begin
      Application.MessageBox('Mensalidade j? est? paga.','ATEN??O', MB_ICONINFORMATION+MB_OK);
      Abort;
   end;

   if cxDBDateEdit3.Text = '' then
   begin
      Application.MessageBox('Informe a data de pagameto.','ATEN??O', MB_ICONINFORMATION+MB_OK);
      cxDBDateEdit3.SetFocus;
      Abort;
   end;
   //verifica se data de pagamento ? menor que a data inicial
   if cxDBDateEdit3.Date < cxDBDateEdit1.Date then
   begin
      Application.MessageBox('Data do pagamento ? menor que a data inicial, verifique.','ATEN??O', MB_ICONINFORMATION+MB_OK);
      cxDBDateEdit3.SetFocus;
      Abort;
   end;
   //efetuao calculo para fazer o pagamento
   if FCadCliente.QPesqPlano.FindField('COB_VALOR').Value = 'S' then
   begin
      vlrpago    :=  (FCadCliente.QPesqPlano.FindField('VALOR_PLANO').Value);
   end
   else
   begin
      dt_inicial := StartOfTheMonth(cxDBDateEdit1.Date);
      qtddiastot :=  DaysBetween(cxDBDateEdit2.Date, cxDBDateEdit1.Date) + 1;
      qtddias    :=  DaysBetween(dt_inicial,cxDBDateEdit3.Date)+ 1;
      vlrpago    :=  (FCadCliente.QPesqPlano.FindField('VALOR_PLANO').Value / qtddiastot ) * qtddias ;
   end;
   FCadCliente.QMensalidade.Edit;
   FCadCliente.QMensalidade.FindField('SITUACAO').Value := 'P';
   FCadCliente.QMensalidade.FindField('FECHADO' ).Value := 'S';
   FCadCliente.QMensalidade.FindField('VLR_PAGO').Value := vlrpago;
   FCadCliente.QMensalidade.Post;
   FCadCliente.QMensalidade.Edit;
end;

procedure TFCadMensalidades.BitBtn2Click(Sender: TObject);
begin
   //informar a senha de administrador para revers?o
   if FCadCliente.QMensalidade.FindField('SITUACAO').Value = 'P' then
   begin
      if Application.MessageBox('Mensalidade j? est? paga. Para reverter informar a senha de administrador.','ATEN??O', MB_ICONQUESTION+MB_YESNO)=IDYES then
      begin
         Label4.Visible := True;
         Edit1.Visible  := True;
         BitBtn4.Visible:= True;
         Edit1.SetFocus;
      end
      else
      begin
        Abort;
      end;
   end;

end;

procedure TFCadMensalidades.BitBtn3Click(Sender: TObject);
const
  IPula   = #13;       //Pula 1 linha
  IEspac1 = #27#48;    //Define espa?amento entre linhas de 1/8"
  IEspac2 = #27#49;    //Define espa?amento entre linhas de 7/72"
  IEspac3 = #27#50;    //Define espa?amento entre linhas de 1/6"
  IEject  = #12;       //Ejeta p?gina
  I80car  = #27#80#18; //Imprime com 80 colunas
  I96car  = #27#77#18; //Imprime com 96 colunas
  I137car = #27#80#15; //Imprime com 137 colunas
  I160car = #27#77#15; //Imprime com 160 colunas
  IDuploG = #27#14#18; //Imprime em caracter grande largura dupla
  IDuploP = #27#14#15; //Imprime em caracter pequeno largura dupla
  IDuploC = #27#20;    //Cancela largura dupla
  INegAti = #27#71;    //Imprime em negrito
  INegDes = #27#72;    //Cancela modo negrito
  IItaAti = #27#52;    //Imprime em It?lico
  IItaDes = #27#53;    //Cancela modo It?lico
var
   iniConf: TIniFile;
   Arquivo : TextFile;
   sPorta: String;
   diaspagos: Integer;
   dt_inicial: TDate;
begin
   diaspagos    :=  DaysBetween(cxDBDateEdit2.Date, cxDBDateEdit1.Date) + 1;

   //abre o arquivo ini para verificar a porta da impressora
   iniConf     := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Garagem.ini');
   sPorta    := iniConf.ReadString('Impressora','Porta','');

   AssignFile(Arquivo,sPorta);
   Rewrite(Arquivo);
   //inicia a impress?o da etiqueta
   Writeln(Arquivo,I80car+INegAti+'    '+QEmpresa.FieldByName('RAZAO_SOCIAL').Text+INegDes);
   Writeln(Arquivo,I96car+'    '+QEmpresa.FieldByName('CNPJ'               ).Text);
   Writeln(Arquivo,I96car+'_____________________________________________');
   Writeln(Arquivo,I96car+'    '+'OBRIGADO, VOLTE SEMPRE!');
   Writeln(Arquivo,I96car+'    '+QEmpresa.FieldByName('TELEFONE'           ).Text);
   Writeln(Arquivo,I96car+'_____________________________________________');
   Writeln(Arquivo,I96car+'    '+'    ESTACIONAMENTO     ');
   Writeln(Arquivo,I96car+'_____________________________________________');
   Writeln(Arquivo,I96car+INegAti+'CPF......: '+FCadCliente.QCliente.FieldByName('CPF_CNPJ'         ).Text+INegDes);
   Writeln(Arquivo,I96car+INegAti+'NOME.....: '+FCadCliente.QCliente.FieldByName('NOME'             ).Text+INegDes);
   Writeln(Arquivo,I96car+''+'PLANO......: '+FCadCliente.QMensalidade.FieldByName('HISTORICO'      ).Text);
   Writeln(Arquivo,I96car+''+'PERIODO....: '+FCadCliente.QMensalidade.FieldByName('DT_VENCIMENTO').Text + ' AT? ' + FCadCliente.QMensalidade.FieldByName('DT_FINAL').Text);
   Writeln(Arquivo,I137car+''+'VALOR PLANO: '+FormatFloat('###,###,#0.00',FCadCliente.QMensalidade.FieldByName('VLR_PAGAR').AsFloat));
   Writeln(Arquivo,I137car+''+'VALOR PAGO.: '+FormatFloat('###,###,#0.00',FCadCliente.QMensalidade.FieldByName('VLR_PAGO' ).AsFloat));
   Writeln(Arquivo,I137car+''+'PERIODO PAGO: '+IntToStr(diaspagos) + '  dia(s)');
   Writeln(Arquivo,I96car+'_____________________________________________');
   Writeln(Arquivo,I96car+'    '+QEmpresa.FieldByName('FUNCIONAMENTO').Text);
   Writeln(Arquivo,I96car+'_____________________________________________');
   WriteLn(Arquivo,IPula);
   WriteLn(Arquivo,IPula);
   WriteLn(Arquivo,IPula);
   WriteLn(Arquivo,IPula);
   WriteLn(Arquivo,IPula);
   WriteLn(Arquivo,IPula);
   WriteLn(Arquivo,IPula);
   WriteLn(Arquivo,IPula);
   WriteLn(Arquivo,IPula);
   CloseFile(Arquivo);
end;

procedure TFCadMensalidades.BitBtn4Click(Sender: TObject);
begin
   //verifica a senha
   if (QEmpresa.FindField('SENHAADM').IsNull) OR (QEmpresa.FindField('SENHAADM').Value = '') then
   begin
      Application.MessageBox('Senha de administrador n?o cadastrada, imposs?vel reverter.','ATEN??O', MB_ICONINFORMATION+MB_OK);
      Edit1.SetFocus;
      Abort;
   end
   else
   begin
      if QEmpresa.FindField('SENHAADM').Value = Edit1.Text then
      begin
         FCadCliente.QMensalidade.Edit;
         FCadCliente.QMensalidade.FindField('SITUACAO'    ).Value := 'A';
         FCadCliente.QMensalidade.FindField('FECHADO'     ).Value := 'N';
         FCadCliente.QMensalidade.FindField('VLR_PAGO'    ).Clear;
         FCadCliente.QMensalidade.FindField('DT_PAGAMENTO').Clear;
         FCadCliente.QMensalidade.Post;

         Application.MessageBox('Revers?o efetuada com sucesso!!!','CONFIRMA??O', MB_ICONINFORMATION+MB_OK);

         Label4.Visible := False;
         Edit1.Visible  := False;
         BitBtn4.Visible:= False;
         Edit1.Clear;
      end
      else
      begin
         Application.MessageBox('Senha n?o confere, digite novamente.','ATEN??O', MB_ICONERROR+MB_OK);
         Edit1.Clear;
         Edit1.SetFocus;
         Abort;
      end;
   end;
end;

procedure TFCadMensalidades.AcSalvarMExecute(Sender: TObject);
begin
   //grava a mensalidade
   //verifica se os campos est?o preenchidos
   if cxDBTextEdit2.Text = '' then
   begin
      Application.MessageBox('Informe o hist?rico.','ATEN??O', MB_ICONEXCLAMATION+MB_OK);
      cxDBTextEdit2.SetFocus;
      Abort;
   end
   else
   begin
      if cxDBDateEdit1.Text = '' then
      begin
         Application.MessageBox('Informe a data de vencimento.','ATEN??O', MB_ICONEXCLAMATION+MB_OK);
         cxDBDateEdit1.SetFocus;
         Abort;
      end
      else
      begin
          if cxDBTextEdit6.Text = '' then
          begin
             Application.MessageBox('Informe o valor a pagar.','ATEN??O', MB_ICONEXCLAMATION+MB_OK);
             cxDBTextEdit6.SetFocus;
             Abort;
          end
          else
          begin
             FCadCliente.QMensalidade.Post;
             Application.MessageBox('Registro salvo com sucesso!!!','CONFIRMA??O', MB_ICONINFORMATION+MB_OK);
              if inclusao = 1 then
             begin
                FCadCliente.QCliente.Edit;
                FCadCliente.QCliente.FindField('DT_VALIDADE').Value := cxDBDateEdit2.Date;
                FCadCliente.QCliente.Post;
                FCadCliente.QCliente.Edit;
              end;
          end;
      end;
   end;
end;

procedure TFCadMensalidades.cxButton4Click(Sender: TObject);
begin
   //fecha o formulario
   close;
end;

procedure TFCadMensalidades.cxDBDateEdit1Exit(Sender: TObject);
var
   dt_final: TDate;
begin
   //primeiro verifica se a mensalidade ja existe
   if FCadCliente.DMensalidade.State in [dsInsert] then
   begin
      dt_final := EndOfTheMonth(cxDBDateEdit1.Date);
      QVerMensalidade.Close;
      QVerMensalidade.SQL.Clear;
      QVerMensalidade.SQL.Add('SELECT * FROM TB_MENSALIDADE');
      QVerMensalidade.SQL.Add('WHERE SITUACAO <> '+#39+'C'+#39);
      QVerMensalidade.SQL.Add('AND CODCLIENTE ='+#39+FCadCliente.QMensalidade.FieldByName('CODCLIENTE').Text+#39);
      QVerMensalidade.SQL.Add('AND DT_VENCIMENTO BETWEEN :DATA1 AND :DATA2');
      QVerMensalidade.ParamByName('DATA1').AsDate := cxDBDateEdit1.Date;
      QVerMensalidade.ParamByName('DATA2').AsDate := dt_final;
      QVerMensalidade.Open;

      if QVerMensalidade.IsEmpty then
      begin
          if FCadCliente.QPesqPlano.FindField('COB_VALOR').Value = 'S'  then
             FCadCliente.QMensalidade.FindField('DT_FINAL').Value := cxDBDateEdit1.Date
          else
             //faz o calculo do dia final
             FCadCliente.QMensalidade.FindField('DT_FINAL').Value :=   EndOfTheMonth(cxDBDateEdit1.Date);
      end
      else
      begin
         Application.MessageBox('Mensalidade no m?s informado j? existe, verifique.','ATEN??O',MB_ICONINFORMATION+MB_OK);
         cxDBDateEdit1.SetFocus;
         Abort;
      end;
   end;
end;

procedure TFCadMensalidades.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
   //quando pago pinta de verde
   if AViewInfo.GridRecord.Values[TcxGridDBTableView(Sender).GetColumnByFieldName('SITUACAO').Index] = 'C' then
   begin
      ACanvas.Brush.Color := clRed;
      ACanvas.Font.Color  := clBlack;
      ACanvas.Font.Style  := [fsBold];
   end;
   //quando pago pinta de verde
   if AViewInfo.GridRecord.Values[TcxGridDBTableView(Sender).GetColumnByFieldName('SITUACAO').Index] = 'P' then
   begin
      ACanvas.Brush.Color := clMoneyGreen;
      ACanvas.Font.Color  := clBlack;
      ACanvas.Font.Style  := [fsBold];
   end;

end;

procedure TFCadMensalidades.cxRadioGroup1Click(Sender: TObject);
begin
   FCadCliente.QMensalidade.Close;
   FCadCliente.QMensalidade.SQL.Clear;
   FCadCliente.QMensalidade.SQL.Add('SELECT * FROM TB_MENSALIDADE');
   FCadCliente.QMensalidade.SQL.Add('WHERE CODCLIENTE =:CODIGO');

   if cxRadioGroup1.ItemIndex = 0 then
   begin
      FCadCliente.QMensalidade.SQL.Add('AND SITUACAO ='+#39+'A'+#39);
   end;

   if cxRadioGroup1.ItemIndex = 1 then
   begin
      FCadCliente.QMensalidade.SQL.Add('AND SITUACAO ='+#39+'P'+#39);
   end;

   if cxRadioGroup1.ItemIndex = 2 then
   begin
      FCadCliente.QMensalidade.SQL.Add('AND SITUACAO ='+#39+'C'+#39);
   end;
   FCadCliente.QMensalidade.SQL.Add('ORDER BY DT_VENCIMENTO DESC');
   FCadCliente.QMensalidade.Open;
end;


procedure TFCadMensalidades.FormActivate(Sender: TObject);
begin
   QEmpresa.Open;
end;

procedure TFCadMensalidades.FormShow(Sender: TObject);
begin
   FCadCliente.QMensalidade.Close;
   FCadCliente.QMensalidade.SQL.Clear;
   FCadCliente.QMensalidade.SQL.Add('SELECT * FROM TB_MENSALIDADE');
   FCadCliente.QMensalidade.SQL.Add('WHERE CODCLIENTE =:CODIGO');

   if cxRadioGroup1.ItemIndex = 0 then
   begin
      FCadCliente.QMensalidade.SQL.Add('AND SITUACAO ='+#39+'A'+#39);
   end;

   if cxRadioGroup1.ItemIndex = 1 then
   begin
      FCadCliente.QMensalidade.SQL.Add('AND SITUACAO ='+#39+'P'+#39);
   end;

   if cxRadioGroup1.ItemIndex = 2 then
   begin
      FCadCliente.QMensalidade.SQL.Add('AND SITUACAO ='+#39+'C'+#39);
   end;
   FCadCliente.QMensalidade.SQL.Add('ORDER BY DT_VENCIMENTO DESC');
   FCadCliente.QMensalidade.Open;
end;

end.
