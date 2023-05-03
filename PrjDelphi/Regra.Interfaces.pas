unit Regra.Interfaces;

interface

uses
  Data.SqlExpr, Vcl.StdCtrls, FireDAC.Comp.Client;

type
  iControllerConexao = interface
    ['{E361E003-A197-47E7-93C4-CE446AF15EA8}']

    function AbrirQuery(Qry: TFDQuery; sSQL: string): iControllerConexao;
    function ConfigurarConexao(): iControllerConexao;
    function EfetuarConsultaAuxiliar(aQryAux: TFDQuery; aSQL: String): Integer;
  end;

  iControllerLogin = interface
    ['{AE0F2066-1576-44E1-93DB-066B6737D017}']

    function SenhaValidada(codUsuario, senha: string): boolean;
  end;

  iControllerUsuario = interface
    ['{35F3E7CE-CB22-4BFA-80A4-165E98D87A44}']

    function ExcluirUsuario(aCodigo: string): Integer;
    function InserirUsuario(aNome, aDireito, aSenha: string): Integer;
    function AlterarUsuario(aCodigo, aNome, aDireito, aSenha: string): Integer;

    function ConsultarUsuarios(aSQL, aSQLWhere: String; aEdtCodigo, aEdtNome: TCustomEdit): Boolean;
    function GetNomeUsuario(aCodigo: String): String;
    function ListarTiposUsuarios(aComboBox: TComboBox): Integer;
  end;

  iControllerTarefa = interface
    ['{F0F6AF29-FD83-49F4-A962-200EF6E7B946}']

    function AlterarTarefa(CodTarefa, Nome: string; Tipo: Integer): Integer;
    function ExcluirTarefa(CodTarefa: string): Integer;
    function InserirTarefa(codUsuario, Nome: string; Tipo: Integer): Integer;
    function ConsultarTarefas(codUsuario: String; Situacao: Integer): boolean;

    function TarefaExistente(CodTarefa: String): boolean;
    function GetNomeTarefa(CodTarefa: String): String;
    function GetTipoTarefa(CodTarefa: String): Integer;
    function GetUltimoCodTarefa: String;
  end;

implementation

end.
