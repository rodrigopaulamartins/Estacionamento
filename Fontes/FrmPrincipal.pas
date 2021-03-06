unit FrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, ImgList, cxLookAndFeels, dxSkinsForm, cxLocalization,
  ComCtrls, ExtCtrls, IniFiles, XPMan, UCBase, UCDataConnector, UCZEOSConn, jpeg,
  ToolWin;

type
  TFPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Timer1: TTimer;
    stat_Principal: TStatusBar;
    cxLocalizer1: TcxLocalizer;
    dxSkinController1: TdxSkinController;
    ImageList1: TImageList;
    Cadastros1: TMenuItem;
    Sair1: TMenuItem;
    Ferramentas1: TMenuItem;
    Usurios1: TMenuItem;
    MudarSenha1: TMenuItem;
    N3: TMenuItem;
    rocarUsurio1: TMenuItem;
    XPManifest1: TXPManifest;
    UcMyControl: TUserControl;
    MyConn: TUCZEOSConn;
    Cliente1: TMenuItem;
    Plano1: TMenuItem;
    Convenio1: TMenuItem;
    Voucher1: TMenuItem;
    ipodeVeculo1: TMenuItem;
    N1: TMenuItem;
    ImageList2: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton4: TToolButton;
    Image1: TImage;
    Movimentao1: TMenuItem;
    Estacionamento1: TMenuItem;
    ToolButton6: TToolButton;
    Empresa1: TMenuItem;
    btn1: TToolButton;
    Anotao1: TMenuItem;
    btn2: TToolButton;
    Relatrios1: TMenuItem;
    Caixa1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure stat_PrincipalDrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure FormDestroy(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure Convenio1Click(Sender: TObject);
    procedure Plano1Click(Sender: TObject);
    procedure ipodeVeculo1Click(Sender: TObject);
    procedure Voucher1Click(Sender: TObject);
    procedure Estacionamento1Click(Sender: TObject);
    procedure Empresa1Click(Sender: TObject);
    procedure Anotao1Click(Sender: TObject);
    procedure Caixa1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    function  LerIni: boolean;
  end;

var
  FPrincipal: TFPrincipal;

implementation

uses Dados, FrmCadastroCliente, FrmCadConvenio, FrmCadastroPlano, FrmCadastroTipoVeiculo, FrmCadastroVoucher, FrmMovimentacao, FrmCadEmpresa, FrmCadAnotacao, FrmRelatorioCaixa;

{$R *.dfm}
//Fun??o-Controle de Vers?o do sistema implementado em 17.01.2013 as 222:06
function GetVersaoArq: string;
var
   VerInfoSize: DWORD;
   VerInfo: Pointer;
   VerValueSize: DWORD;
   VerValue: PVSFixedFileInfo;
   Dummy: DWORD;
begin
   VerInfoSize := GetFileVersionInfoSize(PChar(
   ParamStr(0)), Dummy);
   GetMem(VerInfo, VerInfoSize);
   GetFileVersionInfo(PChar(ParamStr(0)), 0,
   VerInfoSize, VerInfo);
   VerQueryValue(VerInfo, '\', Pointer(VerValue),
   VerValueSize);
   with VerValue^ do
   begin
      Result := IntToStr(dwFileVersionMS shr 16);
      Result := Result + '.' + IntToStr(
      dwFileVersionMS and $FFFF);
      Result := Result + '.' + IntToStr(
      dwFileVersionLS shr 16);
      Result := Result + '.' + IntToStr(
      dwFileVersionLS and $FFFF);
   end;
   FreeMem(VerInfo, VerInfoSize);
end;

procedure TFPrincipal.Anotao1Click(Sender: TObject);
begin
   Application.CreateForm(TFCadAnotacao, FCadAnotacao);
   FCadAnotacao.ShowModal;
   FCadAnotacao.Free;
end;

procedure TFPrincipal.Caixa1Click(Sender: TObject);
begin
   Application.CreateForm(TFRelCaixa, FRelCaixa);
   FRelCaixa.ShowModal;
   FRelCaixa.Free;
end;

procedure TFPrincipal.Cliente1Click(Sender: TObject);
begin
   Application.CreateForm(TFCadCliente, FCadCliente);
   FCadCliente.ShowModal;
   FCadCliente.Free;
end;

procedure TFPrincipal.Convenio1Click(Sender: TObject);
begin
   Application.CreateForm(TFCadConvenio, FCadConvenio);
   FCadConvenio.ShowModal;
   FCadConvenio.Free;
end;

procedure TFPrincipal.Empresa1Click(Sender: TObject);
begin
   Application.CreateForm(TFCadEmpresa, FCadEmpresa);
   FCadEmpresa.ShowModal;
   FCadEmpresa.Free;
end;

procedure TFPrincipal.Estacionamento1Click(Sender: TObject);
begin
   Application.CreateForm(TFMovimentacao, FMovimentacao);
   FMovimentacao.ShowModal;
   FMovimentacao.Free;
end;

procedure TFPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   //confirma saida do sistema
   if Application.MessageBox('Deseja sair do Sistema?','Confirma Sa?da', MB_ICONQUESTION+MB_YESNO)=IDNO then
   Application.Run;
end;

procedure TFPrincipal.FormCreate(Sender: TObject);
begin
   //verifica se o caminho do banco de dados esta correto caso errado fecha o sistema
   LerIni;

   //define da data que deve permanecer no sistema em dia mes e ano com 4 digitos
   ShortDateFormat := 'dd/mm/yyyy';

   //inicia a tela de senha para o usuario
   UcMyControl.StartLogin;

   //mostra o usu?rio que esta logao no momento
   stat_Principal.Panels[3].Text := UcMyControl.CurrentUser.UserName;

   // VERIFICA SE EXISTE O ARQUIVO DENTRO DA PASTA
   if FileExists(ExtractFilePath(Application.ExeName)+'TraducaoBr.ini') then
   begin
      cxLocalizer1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'TraducaoBr.ini');
      cxLocalizer1.LanguageIndex := 1;
      cxLocalizer1.Active := TRUE;
   end;
end;

procedure TFPrincipal.FormDestroy(Sender: TObject);
var
  iniConf: TIniFile;
  dtExeAtual, dtExeNovo: TDateTime;
  sPastaLocal, sPastaRede, sArqLocal, sArqRede, sArqTemp, sNomeExe: String;
begin
   //verifica se existe atualiza??o
   //come?a a configuracao do arquivo ini
   iniConf     := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Garagem.ini');
   sPastaLocal := ExtractFilePath(Application.ExeName);
   sPastaRede  := iniConf.ReadString('ATUALIZA','Caminho','');

   sNomeExe  := 'Garagem.exe';
   sArqLocal := sPastaLocal + sNomeExe;
   sArqRede  := sPastaRede  + sNomeExe;
   sArqTemp  := sPastaLocal + 'OLD-'+sNomeExe;

   if FileExists(sArqRede) then
   begin
      dtExeAtual := FileDateToDateTime(FileAge(sArqLocal));
      dtExeNovo  := FileDateToDateTime(FileAge(sArqRede));

      if (dtExeNovo >  dtExeAtual) then
      begin
         DeleteFile(sArqTemp);
         RenameFile(sArqLocal, sArqTemp);
         CopyFile(pchar(sArqRede), pchar(sArqLocal), false);
         Application.MessageBox('Vers?o Atualizada Com Sucesso!!!','CONFIRMA??O', MB_ICONINFORMATION+MB_OK);
      end;
   end;
end;

procedure TFPrincipal.FormShow(Sender: TObject);
begin
   //StatusBar panels[1] nome da aplica??o
   stat_Principal.Panels[0].Text := 'Contato - (16)99754-4359';

   //StatusBar panels[1] mostra a vers?o
   stat_Principal.Panels[1].Text := 'Vers?o:    ' +GetVersaoArq;
end;

procedure TFPrincipal.ipodeVeculo1Click(Sender: TObject);
begin
   Application.CreateForm(TFCadTipoVeiculo, FCadTipoVeiculo);
   FCadTipoVeiculo.ShowModal;
   FCadTipoVeiculo.Free;
end;

function TFPrincipal.LerIni: boolean;
var
   iniConf: TIniFile;
   sCaminho, sIpServidor, sVMysql, sSenha: String;
begin
   //come?a a configuracao do arquivo ini
   iniConf     := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Garagem.ini');
   sIPServidor := iniConf.ReadString('Banco_Dados','IP_Servidor','');
   sCaminho    := iniConf.ReadString('Banco_Dados','Database','');
   sVMysql     := iniConf.ReadString('Banco_Dados','Versao','');
   sSenha      := iniConf.ReadString('Banco_Dados','Senha','');

   // Depois de Ler as Chaves, vou configurar o IBDataBase
   try
     DM.Conexao.Connected := false;
     DM.Conexao.HostName  := sIpServidor;
     DM.Conexao.Database  := sCaminho;
     DM.Conexao.User      := 'root';
     DM.Conexao.Password  := 'rpmt123';
     DM.Conexao.Protocol  := sVMysql;
     DM.Conexao.Connected := True;
   except
     Application.MessageBox('Banco de Dados n?o Encontrado, ou Arquivo Garagem.ini n?o configurado.' +#13+
                            '" Sistema ser? Fechado."' ,'ERRO BANCO DE DADOS', MB_ICONASTERISK+MB_OK);
     Application.Terminate;
   end;

   if sIpServidor = '' then
      stat_Principal.Panels[6].Text  := 'Servidor: LOCALHOST ' + ' - ' + '[' + sCaminho + ']'
   else
      stat_Principal.Panels[6].Text  := 'Servidor:  ' +  sIpServidor + ' - ' + '[ ' +  sCaminho + ']';

   //resultado
   Result := True;
end;

procedure TFPrincipal.Plano1Click(Sender: TObject);
begin
   Application.CreateForm(TFCadPlano, FCadPlano);
   FCadPlano.ShowModal;
   FCadPlano.Free;
end;

procedure TFPrincipal.Sair1Click(Sender: TObject);
begin
   Close;
end;

procedure TFPrincipal.stat_PrincipalDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
Var
  bmp: TIcon;
begin
   {Index do panel que se deseja desenhar}
   if (Panel.Index=5) then
   begin
      bmp := TIcon.Create;
      try
        if StatusBar.Panels[3].Text = '' then
        begin
           ImageList1.GetIcon(0,bmp); // coloquei o bmp em um imagelist
           stat_Principal.Canvas.Draw(Rect.Left, Rect.Top, bmp);
        end
        else
        begin
           if StatusBar.Panels[3].Text <> '' then
           begin
              ImageList1.GetIcon(1,bmp); // coloquei o bmp em um imagelist
              stat_Principal.Canvas.Draw(Rect.Left, Rect.Top, bmp);
           end;
        end;
      finally
        bmp.Free;
      end;
   end;
end;

procedure TFPrincipal.Voucher1Click(Sender: TObject);
begin
   Application.CreateForm(TFCadVouchers, FCadVouchers);
   FCadVouchers.ShowModal;
   FCadVouchers.Free;
end;

end.
