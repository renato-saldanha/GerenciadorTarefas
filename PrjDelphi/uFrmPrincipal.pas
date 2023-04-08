unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.ImageList, Vcl.ImgList,
  IWImageList, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, System.Actions, Vcl.ActnList, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    btnPesqUsuario: TBitBtn;
    edtNomeUsuario: TEdit;
    cmbSituacao: TComboBox;
    BitBtn2: TBitBtn;
    dbgTarefas: TDBGrid;
    Panel1: TPanel;
    btnIncluir: TBitBtn;
    btnLimpar: TBitBtn;
    btnSair: TBitBtn;
    edtCodUsuario: TLabeledEdit;
    Label1: TLabel;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    actSair: TAction;
    actCadastrarUsuario: TAction;
    actConsultarUsuario: TAction;
    actLimpar: TAction;
    actBuscarUsu: TAction;
    dsTarefas: TDataSource;
    actBuscarTarefas: TAction;
    MainMenu1: TMainMenu;
    Usurio1: TMenuItem;
    Cadastrodeusurio1: TMenuItem;
    ConsultarUsurio1: TMenuItem;
    actIncluir: TAction;
    procedure FormShow(Sender: TObject);
    procedure actBuscarUsuExecute(Sender: TObject);
    procedure cmbSituacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actBuscarTarefasExecute(Sender: TObject);
    procedure actLimparExecute(Sender: TObject);
    procedure edtCodUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ConsultarUsurio1Click(Sender: TObject);
    procedure actConsultarUsuarioExecute(Sender: TObject);
    procedure actCadastrarUsuarioExecute(Sender: TObject);
    procedure edtCodUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure actSairExecute(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure edtCodUsuarioExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uFrmLogin, Uteis, uDmConsulta, uDmLogin, uFrmConsulta, uFrmCadUsuarios,
  uDmPrincipal, uFrmCadTarefas;

procedure TfrmPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
      SelectNext(Self as TWinControl, True, false);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  try
    Application.CreateForm(TdmLogin, dmLogin);
    Application.CreateForm(TdmConsulta, dmConsulta);

    Application.CreateForm(TfrmLogin, frmLogin);
    frmLogin.ShowModal;

    dmConsulta.ListarTiposUsuarios(cmbSituacao);
    cmbSituacao.ItemIndex:= 0;

    edtCodUsuario.SetFocus;
  except on E : Exception do
    MsgErroCriacao(Self);
  end;
end;

procedure TfrmPrincipal.cmbSituacaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (StrToInt(edtCodUsuario.Text) <> 0) and (Key = VK_RETURN) then
    actBuscarTarefasExecute(nil);
end;

procedure TfrmPrincipal.ConsultarUsurio1Click(Sender: TObject);
begin
  actConsultarUsuarioExecute(nil);
end;

procedure TfrmPrincipal.edtCodUsuarioExit(Sender: TObject);
begin
  edtNomeUsuario.Text:= dmConsulta.GetNomeUsuario(edtCodUsuario.Text);
end;

procedure TfrmPrincipal.edtCodUsuarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    actBuscarUsuExecute(nil);
  end;
end;

procedure TfrmPrincipal.edtCodUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
  Key:= SomenteNumeros(Key);
end;

procedure TfrmPrincipal.actBuscarTarefasExecute(Sender: TObject);
begin
  dmPrincipal.ConsultarTarefas(edtCodUsuario.Text, cmbSituacao.ItemIndex - 1)
end;

procedure TfrmPrincipal.actBuscarUsuExecute(Sender: TObject);
var
  SQLWhere: String;
begin
  if edtCodUsuario.Text = '' then
    edtCodUsuario.Text:= '0';

  if (edtCodUsuario.Text <> '0') then
    SQLWhere:= 'WHERE CODIGO = ' + edtCodUsuario.Text;

  TAbrirConsulta.AbrirConsultaUsuario(edtCodUsuario, edtNomeUsuario, nil, nil, SQLWhere);

  if (StrToInt(edtCodUsuario.Text) <> 0) then
    cmbSituacao.SetFocus;
end;

procedure TfrmPrincipal.actCadastrarUsuarioExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmCadUsuarios, frmCadUsuarios);
    frmCadUsuarios.ShowModal
  finally
    FreeAndNil(frmCadUsuarios);
  end;
end;

procedure TfrmPrincipal.actConsultarUsuarioExecute(Sender: TObject);
begin
  TAbrirConsulta.AbrirConsultaUsuario(nil, nil, nil, nil, '');
end;

procedure TfrmPrincipal.actIncluirExecute(Sender: TObject);
begin
  if not (SUPERVISOR) then
  begin
    ShowMessage('Usuário sem permissão!');
    Exit;
  end;

  try
    Application.CreateForm(TfrmCadTarefas, frmCadTarefas);
    frmCadTarefas.ShowModal
  finally
    FreeAndNil(frmCadTarefas);
  end;
end;

procedure TfrmPrincipal.actLimparExecute(Sender: TObject);
begin
  dmPrincipal.LimparConsultaTarefas();
end;

procedure TfrmPrincipal.actSairExecute(Sender: TObject);
begin
  Application.Terminate;
end;

end.


