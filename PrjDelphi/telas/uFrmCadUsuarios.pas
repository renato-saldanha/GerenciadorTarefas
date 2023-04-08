unit uFrmCadUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, System.Actions, Vcl.ActnList;

type
  TfrmCadUsuarios = class(TForm)
    cmbDireitos: TComboBox;
    Label1: TLabel;
    edtCodUsuario: TLabeledEdit;
    btnPesqUsu: TBitBtn;
    edtNomeUsuario: TEdit;
    edtSenha: TEdit;
    Label3: TLabel;
    edtConfirmaSenha: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    actBuscarUsu: TAction;
    actSair: TAction;
    actLimpar: TAction;
    actExcluir: TAction;
    actSalvar: TAction;
    procedure FormShow(Sender: TObject);
    procedure edtCodUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actBuscarUsuExecute(Sender: TObject);
    procedure actLimparExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure edtCodUsuarioExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    function SenhaValidada(Senha, ConfirmacaoSenha: String): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUsuarios: TfrmCadUsuarios;

implementation

{$R *.dfm}

uses uDm, Uteis, uDmConsulta, uDmCadUsuarios, uFrmConsulta;

procedure TfrmCadUsuarios.actBuscarUsuExecute(Sender: TObject);
var
  SQLWhere: String;
begin
  if edtCodUsuario.Text = '' then
    edtCodUsuario.Text:= '0';

  if (edtCodUsuario.Text <> '0') then
    SQLWhere:= 'WHERE CODIGO = ' + edtCodUsuario.Text;

  TAbrirConsulta.AbrirConsultaUsuario(edtCodUsuario, edtNomeUsuario, edtSenha, cmbDireitos, SQLWhere);

  if (edtNomeUsuario.Text = USUARIO_INEXISTENTE) then
    edtNomeUsuario.SelectAll;
end;

procedure TfrmCadUsuarios.actExcluirExecute(Sender: TObject);
begin
  if (MessageDlg('Deseja confirmar a exclus�o do registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    DmCadUsuarios.ExcluirUsuario(edtCodUsuario.Text);
    actLimparExecute(nil);
  end;
end;

procedure TfrmCadUsuarios.actLimparExecute(Sender: TObject);
begin
  edtCodUsuario.Clear;
  edtNomeUsuario.Clear;
  cmbDireitos.ItemIndex:= -1;
  edtSenha.Clear;
  edtConfirmaSenha.Clear;
  edtCodUsuario.SetFocus;
end;

procedure TfrmCadUsuarios.actSalvarExecute(Sender: TObject);
var
  NomeUsuario: String;
begin
  if not (SenhaValidada(edtSenha.Text, edtConfirmaSenha.Text)) then
  begin
    ShowMessage('Verifique as senhas, elas n�o coincidem.');
    Exit;
  end;

  //Seta se h� ou n�o  usu�rio
  NomeUsuario:= dmConsulta.GetNomeUsuario(edtCodUsuario.Text);

  if (NomeUsuario = USUARIO_INEXISTENTE) or (NomeUsuario = 'ADM') then
  begin
    if (MessageDlg('Deseja confirmar a inclus�o do registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      DmCadUsuarios.InserirUsuario(edtNomeUsuario.Text, IntToStr(cmbDireitos.ItemIndex), edtSenha.Text);
      actLimparExecute(nil);
    end;
  end
  else
  begin
    if (MessageDlg('Deseja confirmar a altera��o do registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      DmCadUsuarios.AlterarUsuario(edtCodUsuario.Text, edtNomeUsuario.Text, IntToStr(cmbDireitos.ItemIndex), edtSenha.Text);
      actLimparExecute(nil);
    end;
  end;

end;

procedure TfrmCadUsuarios.edtCodUsuarioExit(Sender: TObject);
begin
  edtNomeUsuario.Text:= dmConsulta.GetNomeUsuario(edtCodUsuario.Text);
end;

procedure TfrmCadUsuarios.edtCodUsuarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  CampoUsuarioSemValor: boolean;
begin
  CampoUsuarioSemValor:= (StrToIntDef(edtCodUsuario.Text, 0) = 0) or (edtCodUsuario.Text = '');
  if ((Key = VK_RETURN) or (Key = VK_F2)) and (CampoUsuarioSemValor) then
    actBuscarUsuExecute(edtCodUsuario)
  else if (Key = VK_RETURN) then
    perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmCadUsuarios.edtCodUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
  Key:= SomenteNumeros(Key);
end;

procedure TfrmCadUsuarios.FormCreate(Sender: TObject);
begin
  Application.CreateForm(TDmCadUsuarios, DmCadUsuarios);
end;

procedure TfrmCadUsuarios.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
      SelectNext(Self as TWinControl, True, false);
end;

procedure TfrmCadUsuarios.FormShow(Sender: TObject);
begin
  edtCodUsuario.SetFocus;
end;

function TfrmCadUsuarios.SenhaValidada(Senha, ConfirmacaoSenha: String): Boolean;
begin
  Result:= (Senha = ConfirmacaoSenha);
end;

end.
