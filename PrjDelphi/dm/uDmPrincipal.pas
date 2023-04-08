unit uDmPrincipal;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.Provider,
  Datasnap.DBClient, Data.DB, Data.SqlExpr, Vcl.Dialogs;

type
  TdmPrincipal = class(TDataModule)
    qryConsTarefas: TSQLQuery;
    cdsConsTarefas: TClientDataSet;
    dspConsTarefas: TDataSetProvider;
    qryAux: TSQLQuery;
  private

    { Private declarations }
  public
    function ConsultarTarefas(CodUsuario : String; Situacao: Integer): Boolean;
    function LimparConsultaTarefas: Boolean;
    procedure CriarADM();
    { Public declarations }
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDm, Uteis;

{$R *.dfm}

function TdmPrincipal.ConsultarTarefas(CodUsuario : String; Situacao: Integer): Boolean;
begin
  Result:= False;

  sSQL:= ' SELECT T.CODIGO, T.NOME TAREFA,                            ' +
         '        CASE WHEN T.TIPO = 0 then ''Diário''                ' +
         '             WHEN T.TIPO = 1 then ''Semanal''               ' +
         '             WHEN T.TIPO = 2 then ''Quinzenal''             ' +
         '             WHEN T.TIPO = 3 then ''Mensal''                ' +
         '        END TIPO                                            ' +
         ' FROM TAREFAS T                                             ' +
         ' INNER JOIN USUARIO_TAREFA UT ON UT.COD_TAREFA = T.CODIGO   ' +
         ' INNER JOIN USUARIOS U ON U.CODIGO = UT.COD_USUARIO         ' +
         ' WHERE UT.COD_USUARIO = ' + CodUsuario ;

  if (Situacao >= 0) then
    sSQL:= sSQL + ' AND T.TIPO = ' + IntToStr(Situacao);

  try
    qryConsTarefas.Close;
    cdsConsTarefas.Close;
    qryConsTarefas.SQLConnection:= dmCon.con;
    cdsConsTarefas.CommandText:= sSQL;
    cdsConsTarefas.Open;

    if (cdsConsTarefas.IsEmpty) then
    begin
      ShowMessage('Essa busca não retornou registros.');
      Exit;
    end;

  except on E: Exception do
    begin
      Result:= False;
      MsgErroConexao(cdsConsTarefas);
    end;
  end;
end;

procedure TdmPrincipal.CriarADM();
begin
  try
    qryAux.Close;
    qryAux.SQLConnection:= dmCon.con;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('INSERT INTO USUARIOS(CODIGO, NOME, SENHA, DIREITO) VALUES(0, ''ADM'', ''123'', 0)');
    qryAux.ExecSQL;
  except on E: Exception do
    MsgErroConexao(qryAux);
  end;
end;

function TdmPrincipal.LimparConsultaTarefas(): Boolean;
begin
  Result:= False;

  try
    cdsConsTarefas.Close;
  except on E: Exception do
    begin
      Result:= False;
      MsgErroConexao(cdsConsTarefas);
    end;
  end;
end;


end.
