unit Form.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.Mask,
  Controller.Login,
  Form.Consulta.Generica,
  Uteis;

type
  TFrmLogin = class(TForm)
    edtCodUsuario: TLabeledEdit;
    btnEntrar: TButton;
    edtSenha: TLabeledEdit;
    btnPesqUsu: TBitBtn;
    edtNomeUsuario: TEdit;
    btnSair: TButton;
    ActionList1: TActionList;
    StatusBar1: TStatusBar;
    actSair: TAction;
    actBuscarUsu: TAction;
    actEntrar: TAction;
    procedure FormShow(Sender: TObject);
    procedure actBuscarUsuExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure edtCodUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actEntrarExecute(Sender: TObject);
    procedure edtCodUsuarioKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

procedure TFrmLogin.FormShow(Sender: TObject);
begin
  edtCodUsuario.SetFocus;
end;

procedure TFrmLogin.actBuscarUsuExecute(Sender: TObject);
var
  SQLWhere: String;
begin
  if edtCodUsuario.Text = '' then
    edtCodUsuario.Text:= '0';

  if (edtCodUsuario.Text <> '0') then
    SQLWhere:= 'WHERE CODIGO = ' + edtCodUsuario.Text;

  TAbrirConsulta.AbrirConsultaUsuario(edtCodUsuario, edtNomeUsuario, nil, nil, SQLWhere);

  if (edtNomeUsuario.Text <> 'USUÁRIO INEXISTENTE') then
    edtSenha.SetFocus;
end;

procedure TFrmLogin.actEntrarExecute(Sender: TObject);
begin
  if (dmLogin.SenhaValidada(edtCodUsuario.Text, edtSenha.Text)) then
  begin
    ShowMessage('Login validado com sucesso!');
    frmLogin.Close;
  end
  else
    ShowMessage('Verifique seu login e senha!');
end;

procedure TFrmLogin.actSairExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmLogin.edtCodUsuarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    actBuscarUsuExecute(nil);
end;

procedure TFrmLogin.edtCodUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
    Key:= SomenteNumeros(Key);
end;

procedure TFrmLogin.edtSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (edtSenha.Text <> '') and (Key = VK_RETURN) then
    actEntrarExecute(nil);
end;

end.
