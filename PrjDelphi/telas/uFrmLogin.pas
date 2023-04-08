unit uFrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, Vcl.ComCtrls;

type
  TfrmLogin = class(TForm)
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
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses uDmLogin, uFrmConsulta, uDmConsulta, Uteis;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  edtCodUsuario.SetFocus;
end;

procedure TfrmLogin.actBuscarUsuExecute(Sender: TObject);
var
  SQLWhere: String;
begin
  if edtCodUsuario.Text = '' then
    edtCodUsuario.Text:= '0';

  if (edtCodUsuario.Text <> '0') then
    SQLWhere:= 'WHERE CODIGO = ' + edtCodUsuario.Text;

  TAbrirConsulta.AbrirConsultaUsuario(edtCodUsuario, edtNomeUsuario, nil, nil, SQLWhere);

  if (edtNomeUsuario.Text <> 'USU�RIO INEXISTENTE') then
    edtSenha.SetFocus;
end;

procedure TfrmLogin.actEntrarExecute(Sender: TObject);
begin
  if (dmLogin.SenhaValidada(edtCodUsuario.Text, edtSenha.Text)) then
  begin
    ShowMessage('Login validado com sucesso!');
    frmLogin.Close;
  end
  else
    ShowMessage('Verifique seu login e senha!');
end;

procedure TfrmLogin.actSairExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmLogin.edtCodUsuarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    actBuscarUsuExecute(nil);
end;

procedure TfrmLogin.edtCodUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
    Key:= SomenteNumeros(Key);
end;

procedure TfrmLogin.edtSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (edtSenha.Text <> '') and (Key = VK_RETURN) then
    actEntrarExecute(nil);
end;

end.
