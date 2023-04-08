unit uDmConsulta;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.Provider,
  Datasnap.DBClient, Data.DB, Data.SqlExpr, Vcl.StdCtrls;

type
  TdmConsulta = class(TDataModule)
    qryConsulta: TSQLQuery;
    cdsConsulta: TClientDataSet;
    dspConsulta: TDataSetProvider;
    qryAux: TSQLQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function ConsultarUsuarios(sSQL: String): Boolean;
    function GetNomeUsuario(CodUsuario: String): String;
    function ListarTiposUsuarios(comboBox: TComboBox): Integer;
    function TarefaExistente(CodTarefa: String): Boolean;
    function GetNomeTarefa(CodTarefa: String): String;
    function GetTipoTarefa(CodTarefa: String): Integer;
  end;

var
  dmConsulta: TdmConsulta;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDm, Uteis;

{$R *.dfm}

{ TdmConsulta }

function TdmConsulta.ConsultarUsuarios(sSQL: String): Boolean;
begin
  Result:= False;

  try
    qryConsulta.Close;
    cdsConsulta.Close;
    qryConsulta.SQLConnection:= dmCon.con;
    cdsConsulta.CommandText:= sSQL;
    cdsConsulta.Open;
  except on E: Exception do
    begin
      Result:= False;
      MsgErroConexao(cdsConsulta);
    end;
  end;
end;

function TdmConsulta.GetNomeUsuario(CodUsuario: String): String;
begin
  try
    qryAux.Close;
    qryAux.SQLConnection:= dmCon.con;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('SELECT NOME FROM USUARIOS WHERE CODIGO = ' + CodUsuario);
    qryAux.Open;

    if not (qryAux.IsEmpty) then
      Result:= qryAux.FieldByName('NOME').AsString
    else
      Result:= USUARIO_INEXISTENTE;

  except on E: Exception do
    begin
      Result:= '';
      MsgErroConexao(qryAux);
    end;
  end;
end;



function TdmConsulta.GetNomeTarefa(CodTarefa: String): String;
begin
  try
    qryAux.Close;
    qryAux.SQLConnection:= dmCon.con;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('SELECT NOME FROM TAREFAS WHERE CODIGO = ' + CodTarefa);
    qryAux.Open;

    if not (qryAux.IsEmpty) then
      Result:= qryAux.FieldByName('NOME').AsString
    else
      Result:= '';

  except on E: Exception do
    begin
      Result:= '';
      MsgErroConexao(qryAux);
    end;
  end;
end;

function TdmConsulta.GetTipoTarefa(CodTarefa: String): Integer;
begin
  try
    qryAux.Close;
    qryAux.SQLConnection:= dmCon.con;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('SELECT TIPO FROM TAREFAS WHERE CODIGO = ' + CodTarefa);
    qryAux.Open;

    if not (qryAux.IsEmpty) then
      Result:= qryAux.FieldByName('TIPO').AsInteger
    else
      Result:= 0;

  except on E: Exception do
    begin
      Result:= 0;
      MsgErroConexao(qryAux);
    end;
  end;
end;

function TdmConsulta.TarefaExistente(CodTarefa: String): boolean;
begin
  try
    qryAux.Close;
    qryAux.SQLConnection:= dmCon.con;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('SELECT NOME FROM TAREFAS WHERE CODIGO = ' + CodTarefa);
    qryAux.Open;

    Result:= not (qryAux.IsEmpty);

  except on E: Exception do
    begin
      Result:= False;
      MsgErroConexao(qryAux);
    end;
  end;
end;

function TdmConsulta.ListarTiposUsuarios(comboBox: TComboBox): Integer;
var
  Lista: TStringList;
begin
  try
    Lista:= TStringList.Create;

    qryAux.Close;
    qryAux.SQLConnection:= dmCon.con;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' SELECT  ''TODOS'' SITUACAO FROM RDB$DATABASE   ' +
                   ' UNION ALL                                      ' +
                   ' SELECT  ''DI�RIO'' SITUACAO FROM RDB$DATABASE   ' +
                   ' UNION ALL                                      ' +
                   ' SELECT ''SEMANAL'' FROM RDB$DATABASE           ' +
                   ' UNION ALL                                      ' +
                   ' SELECT ''QUINZENAL'' FROM RDB$DATABASE         ' +
                   ' UNION ALL                                      ' +
                   ' SELECT ''MENSAL'' FROM RDB$DATABASE            ');
    qryAux.Open;

    if not (qryAux.IsEmpty) then
    begin
      qryAux.First;
      while not (qryAux.Eof) do
      begin
        comboBox.AddItem(qryAux.FieldByName('SITUACAO').AsString, nil);
        qryAux.Next;
      end;

      Result:= Lista.Count;
    end
    else
      Result:= 0;

  except on E: Exception do
    begin
      Result:= 0;
      MsgErroConexao(qryAux);
    end;
  end;
end;

end.
