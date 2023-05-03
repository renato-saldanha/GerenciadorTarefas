program PrjControleTarefas;

uses
  Vcl.Forms,
  Uteis in 'Util\Uteis.pas',
  Controller.Conexao in 'Controller\Controller.Conexao.pas' {ControllerConexao: TDataModule},
  Controller.Login in 'Controller\Controller.Login.pas' {ControllerLogin: TDataModule},
  Controller.Usuario in 'Controller\Controller.Usuario.pas' {ControllerUsuario: TDataModule},
  Controller.Tarefa in 'Controller\Controller.Tarefa.pas' {ControllerTarefa: TDataModule},
  Form.Principal in 'Form.Principal.pas' {FrmPrincipal},
  Form.Cadastro.Usuarios in 'View\Form.Cadastro.Usuarios.pas' {FrmCadastroUsuarios},
  Form.Login in 'View\Form.Login.pas' {FrmLogin},
  Form.Consulta.Generica in 'View\Form.Consulta.Generica.pas' {FrmConsultaGenerica},
  Form.Cadastro.Tarefas in 'View\Form.Cadastro.Tarefas.pas' {FrmCadastroTarefas},
  Regra.Interfaces in 'Regra.Interfaces.pas',
  Model.Usuario in 'Model\Model.Usuario.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TControllerConexao, ControllerConexao);
  Application.CreateForm(TController, Controller);
  Application.Run;

end.
