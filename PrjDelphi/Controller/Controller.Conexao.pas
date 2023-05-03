unit Controller.Conexao;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, Data.DBXFirebird,
  Regra.Interfaces, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  Uteis;

type
  TControllerConexao = class(TInterfacedObject, iControllerConexao)
  private
    { Private declarations }
    FConexao: TFDConnection;
  public
    { Public declarations }
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerConexao;

    function AbrirQuery(aQry: TFDQuery; aSQL: string): iControllerConexao;
    function ConfigurarConexao(): iControllerConexao;
    function EfetuarConsultaAuxiliar(aQryAux: TFDQuery; aSQL: String): Integer;

    property Conexao : TFDConnection read FConexao write FConexao;
  end;

var
  ControllerConexao: TControllerConexao;

implementation

{$R *.dfm}

constructor TControllerConexao.Create;
begin
//  FConexao := Self.Create;
end;

destructor TControllerConexao.Destroy;
begin

  inherited;
end;

class function TControllerConexao.New: iControllerConexao;
begin
  if not (Assigned(ControllerConexao))  then
    ControllerConexao := Self.Create;

  Result := ControllerConexao;
end;

function TControllerConexao.ConfigurarConexao: iControllerConexao;
begin
  try
    Conexao                 := TFDConnection.Create(nil);
    Conexao.Connected       := False;
    Conexao.Name            := 'con';
    Conexao.LoginPrompt     := False;
    Conexao.DriverName      := 'PG';
    Conexao.Params.Database := ExtractFilePath(GetCurrentDir);
    Conexao.Params.Password := 'FTI@pg#1800';
    Conexao.Connected       := True;
  except on E: Exception do
    raise Exception.Create('Erro ao configrar a conexão: ' + e.Message);
  end;


end;

function TControllerConexao.EfetuarConsultaAuxiliar(aQryAux: TFDQuery; aSQL: String): Integer;
begin
  try
    aQryAux             := TFDQuery.Create(nil);
    aQryAux.Connection  := ControllerConexao.Conexao;
    aQryAux.Close;
    aQryAux.SQL.Clear;
    Result              := aQryAux.ExecSQL(VPSQL);
  except on E: Exception do
    MsgErroConexao(aQryAux);
  end;
end;

function TControllerConexao.AbrirQuery(aQry: TFDQuery; aSQL: string): iControllerConexao;
begin
  Result := Self;
  try
    aQry.Close;
    aQry.SQL.Clear;
    aQry.SQL.Text := aSQL;
    aQry.Open;
  except
    on E: Exception do
      MsgErroConexao(aQry);
  end;
end;

end.
