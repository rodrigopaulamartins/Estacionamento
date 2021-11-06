unit Dados;

interface

uses
  SysUtils, Classes, ZConnection;

type
  TDM = class(TDataModule)
    Conexao: TZConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
