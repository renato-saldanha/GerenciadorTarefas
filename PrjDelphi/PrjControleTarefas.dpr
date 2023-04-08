program PrjControleTarefas;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {frmPrincipal},
  uDm in 'dm\uDm.pas' {dmCon: TDataModule},
  uFrmCadUsuarios in 'telas\uFrmCadUsuarios.pas' {frmCadUsuarios},
  uFrmLogin in 'telas\uFrmLogin.pas' {frmLogin},
  uDmLogin in 'dm\uDmLogin.pas' {dmLogin: TDataModule},
  Uteis in 'unit\Uteis.pas',
  uFrmConsulta in 'telas\uFrmConsulta.pas' {frmConsulta},
  uDmConsulta in 'dm\uDmConsulta.pas' {dmConsulta: TDataModule},
  uFrmCadTarefas in 'telas\uFrmCadTarefas.pas' {frmCadTarefas},
  uDmCadUsuarios in 'dm\uDmCadUsuarios.pas' {DmCadUsuarios: TDataModule},
  uDmPrincipal in 'dm\uDmPrincipal.pas' {dmPrincipal: TDataModule},
  uDmCadTarefas in 'dm\uDmCadTarefas.pas' {DmCadTarefas: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmCon, dmCon);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDmCadUsuarios, DmCadUsuarios);
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TDmCadTarefas, DmCadTarefas);
  Application.Run;
end.
