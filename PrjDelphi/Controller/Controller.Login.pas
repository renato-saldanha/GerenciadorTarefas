unit Controller.Login;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.Provider,
  Datasnap.DBClient, Data.DB, Data.SqlExpr,
  Uteis,
  Controller.Conexao,
  Regra.Interfaces, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TControllerLogin = class(TInterfacedObject, iControllerLogin)
    QryLogin: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerLogin;

    function SenhaValidada(codUsuario, senha:string): boolean;

  end;

var
  ControllerLogin: TControllerLogin;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}


{$R *.dfm}

{ TdmLogin }

constructor TControllerLogin.Create;
begin
  //
end;

destructor TControllerLogin.Destroy;
begin

  inherited;
end;

class function TControllerLogin.New: iControllerLogin;
begin
  if not (Assigned(ControllerLogin)) then
    ControllerLogin := Self.Create;

  Result := ControllerLogin;
end;

function TControllerLogin.SenhaValidada(codUsuario, senha: string): boolean;
begin
  try
    Result:= False;
    VPSQL:= ' SELECT SENHA FROM USUARIOS ' +
           ' WHERE CODIGO = ' + codUsuario;
    ControllerConexao.AbrirQuery(QryLogin, VPSQL);

    if not (QryLogin.IsEmpty) then
      Result:= (senha = QryLogin.FieldByName('SENHA').AsString);

  except on E: Exception do
    begin
      Result:= False;
      MsgErroConexao(QryLogin);
    end;
  end;


end;

end.
