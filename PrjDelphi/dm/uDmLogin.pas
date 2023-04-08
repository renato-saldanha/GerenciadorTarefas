unit uDmLogin;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.Provider,
  Datasnap.DBClient, Data.DB, Data.SqlExpr;

type
  TdmLogin = class(TDataModule)
    qryLogin: TSQLQuery;
    cdsLogin: TClientDataSet;
    dspLogin: TDataSetProvider;
  private
    { Private declarations }
  public
    { Public declarations }
    function SenhaValidada(codUsuario, senha:string): boolean;

  end;

var
  dmLogin: TdmLogin;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDm, Uteis;

{$R *.dfm}

{ TdmLogin }

function TdmLogin.SenhaValidada(codUsuario, senha: string): boolean;
begin
  try
    Result:= False;
    sSQL:= ' SELECT SENHA FROM USUARIOS ' +
           ' WHERE CODIGO = ' + codUsuario;
    dmCon.AbrirQuery(qryLogin, sSQL);

    if not (qryLogin.IsEmpty) then
      Result:= (senha = qryLogin.FieldByName('SENHA').AsString);

  except on E: Exception do
    begin
      Result:= False;
      MsgErroConexao(qryLogin);
    end;
  end;


end;

end.
