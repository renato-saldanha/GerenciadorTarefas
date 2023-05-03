unit uDmCadUsuarios;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr;

type
  TDmCadUsuarios = class(TDataModule)
    qryAux: TSQLQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function ExcluirUsuario(CodUsuario: string): Integer;
    function InserirUsuario(Nome, Direito, Senha: string): Integer;
    function AlterarUsuario(Codigo, Nome, Direito, Senha: string): Integer;
  end;

var
  DmCadUsuarios: TDmCadUsuarios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDm, Uteis;

{$R *.dfm}

{ TDmCadUsuarios }

function TDmCadUsuarios.ExcluirUsuario(CodUsuario: string): Integer;
begin
  try
    qryAux.Close;
    qryAux.SQLConnection:= dmCon.con;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('DELETE FROM USUARIOS WHERE CODIGO = ' + CodUsuario);
    Result:= qryAux.ExecSQL();
  except on E: Exception do
    MsgErroConexao(qryAux);
  end;
end;

function TDmCadUsuarios.InserirUsuario(Nome, Direito, Senha: string): Integer;
begin
  try
    sSQL:= ' INSERT INTO USUARIOS (NOME, DIREITO, SENHA) ' +
           ' VALUES(' + QuotedStr(Nome) +
           ',' + Direito +
           ',' + QuotedStr(Senha) + ')';

    qryAux.Close;
    qryAux.SQLConnection:= dmCon.con;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(sSQL);
    Result:= qryAux.ExecSQL();
  except on E: Exception do
    MsgErroConexao(qryAux);
  end;
end;

function TDmCadUsuarios.AlterarUsuario(Codigo, Nome, Direito, Senha: string): Integer;
begin
  try
    sSQL:= ' UPDATE USUARIOS SET ' +
           ' NOME = ' + QuotedStr(Nome) +
           ', DIREITO = ' + Direito +
           ', SENHA = ' + Senha +
           ' WHERE CODIGO = ' + Codigo;

    qryAux.Close;
    qryAux.SQLConnection:= dmCon.con;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(sSQL);
    Result:= qryAux.ExecSQL();
  except on E: Exception do
    MsgErroConexao(qryAux);
  end;
end;

end.
