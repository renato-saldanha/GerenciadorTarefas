unit Controller.Usuario;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Vcl.StdCtrls,   Regra.Interfaces, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  Uteis,
  Controller.Conexao, Vcl.Dialogs, Model.Usuario;

type
  TControllerUsuario = class(TInterfacedObject, iControllerUsuario)
    QryUsuarios: TFDQuery;
    QryAux: TFDQuery;
  private
    { Private declarations }
    FSQL: String;

  public
    { Public declarations }
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerUsuario;

    function ExcluirUsuario(aCodigo: string): Integer;
    function InserirUsuario(aNome, aDireito, aSenha: string): Integer;
    function AlterarUsuario(aCodigo, aNome, aDireito, aSenha: string): Integer;

    function ConsultarUsuarios(aSQL, aSQLWhere: String; aEdtCodigo, aEdtNome: TCustomEdit): Boolean;
    function GetNomeUsuario(aCodigo: String): String;
    function ListarTiposUsuarios(aComboBox: TComboBox): Integer;

    procedure CriarADM;
  end;

var
  ControllerUsuario: TControllerUsuario;

implementation

{$R *.dfm}

{ TDmCadUsuarios }

constructor TControllerUsuario.Create;
begin

end;

destructor TControllerUsuario.Destroy;
begin

  inherited;
end;

class function TControllerUsuario.New: iControllerUsuario;
begin

end;

function TControllerUsuario.ListarTiposUsuarios(aComboBox: TComboBox): Integer;
var
  Lista: TStringList;
begin
  try
    Lista:= TStringList.Create;

    QryAux.Close;
    QryAux.Connection:= ControllerConexao.Conexao;
    QryAux.SQL.Clear;
    QryAux.ExecSQL(' SELECT  ''TODOS'' SITUACAO FROM RDB$DATABASE   ' +
                   ' UNION ALL                                      ' +
                   ' SELECT  ''DI�RIO'' SITUACAO FROM RDB$DATABASE   ' +
                   ' UNION ALL                                      ' +
                   ' SELECT ''SEMANAL'' FROM RDB$DATABASE           ' +
                   ' UNION ALL                                      ' +
                   ' SELECT ''QUINZENAL'' FROM RDB$DATABASE         ' +
                   ' UNION ALL                                      ' +
                   ' SELECT ''MENSAL'' FROM RDB$DATABASE            ');

    if not (QryAux.IsEmpty) then
    begin
      QryAux.First;
      while not (QryAux.Eof) do
      begin
        aComboBox.AddItem(QryAux.FieldByName('SITUACAO').AsString, nil);
        QryAux.Next;
      end;

      Result:= Lista.Count;
    end
    else
      Result:= 0;

  except on E: Exception do
    begin
      Result:= 0;
      MsgErroConexao(QryAux);
    end;
  end;
end;

function TControllerUsuario.ConsultarUsuarios(aSQL, aSQLWhere: String; aEdtCodigo, aEdtNome: TCustomEdit): Boolean;
var
  Usuario: TModelUsuario;
begin
  Result:= False;

  try
    QryUsuarios.Close;
    QryUsuarios.SQL.Clear;
    QryUsuarios.Connection:= ControllerConexao.Conexao;
    QryUsuarios.SQL.Add(aSQL);
    QryUsuarios.Open;

    if (QryUsuarios.IsEmpty) then
      raise Exception.Create('A busca n�o retornou registros!')
    else
    begin
      Usuario         := TModelUsuario.Create;
      Usuario.Codigo  := QryUsuarios.FieldByName('CODIGO').AsString;
      Usuario.Nome    := QryUsuarios.FieldByName('NOME').AsString;
      Result          := (aEdtNome = nil) and (aEdtNome = nil) and (aSQLWhere = '');
    end;
  except on E: Exception do
    begin
      Result:= False;
      MsgErroConexao(QryUsuarios);
    end;
  end;
end;

function TControllerUsuario.GetNomeUsuario(aCodigo: String): String;
begin
  try
    QryUsuarios.Close;
    QryUsuarios.SQL.Clear;
    QryUsuarios.Connection:= ControllerConexao.Conexao;
    QryUsuarios.SQL.Add('SELECT NOME FROM USUARIOS WHERE CODIGO = ' + aCodigo);
    QryUsuarios.Open;

    if not (QryUsuarios.IsEmpty) then
      Result:= QryUsuarios.FieldByName('NOME').AsString
    else
      Result:= USUARIO_INEXISTENTE;

  except on E: Exception do
    begin
      Result:= '';
      MsgErroConexao(QryUsuarios);
    end;
  end;
end;

function TControllerUsuario.ExcluirUsuario(aCodigo: string): Integer;
begin
  try
    QryUsuarios.Close;
    QryUsuarios.SQL.Clear;
    QryUsuarios.Connection:= ControllerConexao.Conexao;
    Result:= QryUsuarios.ExecSQL('DELETE FROM USUARIOS WHERE CODIGO = ' + aCodigo);
  except on E: Exception do
    MsgErroConexao(QryUsuarios);
  end;
end;

function TControllerUsuario.InserirUsuario(aNome, aDireito, aSenha: string): Integer;
begin
  try
    FSQL:= ' INSERT INTO USUARIOS (NOME, DIREITO, SENHA) ' +
           ' VALUES(' + QuotedStr(aNome) +
           ',' + aDireito +
           ',' + QuotedStr(aSenha) + ')';

    QryUsuarios.Close;
    QryUsuarios.SQL.Clear;
    QryUsuarios.Connection:= ControllerConexao.Conexao;
    Result:= QryUsuarios.ExecSQL(FSQL);
  except on E: Exception do
    MsgErroConexao(QryUsuarios);
  end;
end;

function TControllerUsuario.AlterarUsuario(aCodigo, aNome, aDireito, aSenha: string): Integer;
begin
  try
    FSQL:= ' UPDATE USUARIOS SET ' +
           ' NOME = ' + QuotedStr(aNome) +
           ', DIREITO = ' + aDireito +
           ', SENHA = ' + aSenha +
           ' WHERE CODIGO = ' + aCodigo;

    QryUsuarios.Close;
    QryUsuarios.SQL.Clear;
    QryUsuarios.Connection:= ControllerConexao.Conexao;
    Result:= QryUsuarios.ExecSQL(FSQL);
  except on E: Exception do
    MsgErroConexao(QryUsuarios);
  end;
end;

procedure TControllerUsuario.CriarADM();
begin
  try
    QryUsuarios.Close;
    QryUsuarios.SQL.Clear;
    QryUsuarios.Connection:= ControllerConexao.Conexao;
    QryUsuarios.ExecSQL('INSERT INTO USUARIOS(CODIGO, NOME, SENHA, DIREITO) VALUES(0, ''ADM'', ''123'', 0)');;
  except on E: Exception do
    MsgErroConexao(QryUsuarios);
  end;
end;

end.
