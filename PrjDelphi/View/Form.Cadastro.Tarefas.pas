unit Form.Cadastro.Tarefas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.Mask,
  Uteis,
  Controller.Tarefa,
  Form.Consulta.Generica;

type
  TFrmCadastroTarefas = class(TForm)
    cmbTipo: TComboBox;
    Label1: TLabel;
    edtCodUsuario: TLabeledEdit;
    btnPesqUsu: TBitBtn;
    edtNomeUsuario: TEdit;
    btnSalvar: TButton;
    btnExcluir: TButton;
    btnLimpar: TButton;
    btnSair: TButton;
    Label2: TLabel;
    ActionList1: TActionList;
    actBuscar: TAction;
    actSair: TAction;
    actLimpar: TAction;
    actExcluir: TAction;
    actSalvar: TAction;
    Label3: TLabel;
    edtCodTarefa: TLabeledEdit;
    btnPesqTarefa: TBitBtn;
    edtNomeTarefa: TEdit;
    StatusBar1: TStatusBar;
    procedure actSairExecute(Sender: TObject);
    procedure actLimparExecute(Sender: TObject);
    procedure edtCodUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure actBuscarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);

    procedure edtCodTarefaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodTarefaExit(Sender: TObject);
    procedure edtCodUsuarioExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroTarefas: TFrmCadastroTarefas;

implementation

{$R *.dfm}

procedure TFrmCadastroTarefas.actBuscarExecute(Sender: TObject);
var
  SQLWhere: String;
begin
  if (TLabeledEdit(Sender).Name = 'edtCodUsuario') or (TBitBtn(Sender).Name = 'btnPesqUsu') then
  begin
    if edtCodUsuario.Text = '' then
      edtCodUsuario.Text:= '0';

    if (edtCodUsuario.Text <> '0') then
      SQLWhere:= 'WHERE CODIGO = ' + edtCodUsuario.Text;

    TAbrirConsulta.AbrirConsultaUsuarioTarefa(edtCodUsuario, edtNomeUsuario, SQLWhere);
  end
  else
  begin
    if edtCodTarefa.Text = '' then
      edtCodTarefa.Text:= '0';

    if (edtCodTarefa.Text <> '0') then
      SQLWhere:= 'WHERE  T.CODIGO = ' + edtCodTarefa.Text;

    TAbrirConsulta.AbrirConsultaTarefa(edtCodTarefa, edtNomeTarefa, SQLWhere);
  end;
end;

procedure TFrmCadastroTarefas.actExcluirExecute(Sender: TObject);
begin
  if (MessageDlg('Deseja confirmar a exclusão do registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    ControllerTarefa.ExcluirTarefa(edtCodTarefa.Text);
    actLimparExecute(nil);
  end;
end;

procedure TFrmCadastroTarefas.actLimparExecute(Sender: TObject);
begin
  edtCodUsuario.Clear;
  edtNomeUsuario.Clear;
  edtNomeTarefa.Clear;
  edtCodTarefa.Clear;
  cmbTipo.ItemIndex:= 0;
end;

procedure TFrmCadastroTarefas.actSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadastroTarefas.actSalvarExecute(Sender: TObject);
begin
  if not (dmConsulta.TarefaExistente(edtCodTarefa.Text)) then
  begin
    if (MessageDlg('Deseja confirmar a inclusão do registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      ControllerTarefa.InserirTarefa(edtCodUsuario.Text, edtNomeTarefa.Text, cmbTipo.ItemIndex);
      actLimparExecute(nil);
    end;
  end
  else
  begin
    if (MessageDlg('Deseja confirmar a alteração do registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      ControllerTarefa.AlterarTarefa(edtCodUsuario.Text, edtNomeTarefa.Text, cmbTipo.ItemIndex);
      actLimparExecute(nil);
    end;
  end;
end;

procedure TFrmCadastroTarefas.edtCodTarefaExit(Sender: TObject);
begin
  edtNomeTarefa.Text:= dmConsulta.GetNomeTarefa(edtCodTarefa.Text);
  cmbTipo.ItemIndex:= dmConsulta.GetTipoTarefa(edtCodTarefa.Text);
end;

procedure TFrmCadastroTarefas.edtCodTarefaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  CampoUsuarioSemValor: boolean;
begin
  CampoUsuarioSemValor:= (StrToIntDef(edtCodTarefa.Text, 0) = 0) or (edtCodTarefa.Text = '');
  if ((Key = VK_RETURN) or (Key = VK_F2)) and (CampoUsuarioSemValor) then
    actBuscarExecute(edtCodTarefa)
  else if (Key = VK_RETURN) then
    perform(WM_NEXTDLGCTL,0,0);
end;

procedure TFrmCadastroTarefas.edtCodUsuarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  CampoUsuarioSemValor: boolean;
begin
  CampoUsuarioSemValor:= (StrToIntDef(edtCodTarefa.Text, 0) = 0) or (edtCodTarefa.Text = '');
  if ((Key = VK_RETURN) or (Key = VK_F2)) and (CampoUsuarioSemValor) then
    actBuscarExecute(edtCodUsuario)
  else if (Key = VK_RETURN) then
    perform(WM_NEXTDLGCTL,0,0);
end;

procedure TFrmCadastroTarefas.edtCodUsuarioExit(Sender: TObject);
begin
  edtNomeUsuario.Text:= dmConsulta.GetNomeUsuario(edtCodUsuario.Text);
end;

procedure TFrmCadastroTarefas.edtCodUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
  Key:= SomenteNumeros(Key);
end;

procedure TFrmCadastroTarefas.FormCreate(Sender: TObject);
begin
  Application.CreateForm(TControllerTarefa, ControllerTarefa);
end;

end.
