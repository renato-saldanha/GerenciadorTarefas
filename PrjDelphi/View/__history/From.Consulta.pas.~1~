unit uFrmConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Data.FMTBcd, Data.SqlExpr, System.Actions,
  Vcl.ActnList, Vcl.Buttons, Vcl.ComCtrls;

type
  TAbrirConsulta = class
    private
    public
    class function AbrirConsultaUsuario(edtCodUsuario: TLabeledEdit; edtNomeUsuario, edtSenha: TEdit; cmbDireitos: TComboBox; SQLWhere: String): String;
    class function AbrirConsultaUsuarioTarefa(edtCodUsuario: TLabeledEdit; edtNomeUsuario: TEdit; SQLWhere: String): String;
    class function AbrirConsultaTarefa(edtCodUsuario: TLabeledEdit; edtNomeUsuario: TEdit; SQLWhere: String): String;
  end;

type
  TfrmConsulta = class(TForm)
    dbgConsulta: TDBGrid;
    Panel1: TPanel;
    dsConsulta: TDataSource;
    ActionList1: TActionList;
    StatusBar1: TStatusBar;
    btnSair: TBitBtn;
    btnSelecionar: TBitBtn;
    actSelecionar: TAction;
    actSair: TAction;
    procedure actSairExecute(Sender: TObject);
    procedure actSelecionarExecute(Sender: TObject);
    procedure dbgConsultaDblClick(Sender: TObject);
    procedure dbgConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  frmConsulta: TfrmConsulta;
  CodUsu: Integer;
  Consultar: boolean;

implementation

{$R *.dfm}

uses uDmConsulta, Uteis;

{ TfrmConsulta }

class function TAbrirConsulta.AbrirConsultaUsuarioTarefa(edtCodUsuario: TLabeledEdit; edtNomeUsuario: TEdit; SQLWhere: String): String;
begin
  try
    try
      Application.CreateForm(TfrmConsulta, frmConsulta);

      sSQL:= 'SELECT CODIGO, NOME FROM USUARIOS ';

      dmConsulta.ConsultarUsuarios(sSQL + SQLWhere);

      if (dmConsulta.cdsConsulta.IsEmpty) then
      begin
        ShowMessage('A busca não retornou registros!');
        Exit;
      end;

      frmConsulta.Caption:= 'Consultar Usuários';
      frmConsulta.ShowModal;

      if (CodUsu <> 0) then
      begin
        if (edtCodUsuario <> nil) then
          edtCodUsuario.Text  := dmConsulta.cdsConsulta.FieldByName('CODIGO').AsString;

        if (edtNomeUsuario <> nil) then
          edtNomeUsuario.Text  := dmConsulta.cdsConsulta.FieldByName('NOME').AsString;

        Consultar:= (edtCodUsuario = nil) and (edtCodUsuario = nil) and (SQLWhere = '');
      end;
    except on E: Exception do
      MsgErroCriacao(frmConsulta);
    end;
  finally
    FreeAndNil(frmConsulta);
  end;
end;

class function TAbrirConsulta.AbrirConsultaTarefa(edtCodUsuario: TLabeledEdit; edtNomeUsuario: TEdit;
  SQLWhere: String): String;
begin
   try
    try
      Application.CreateForm(TfrmConsulta, frmConsulta);

      sSQL:= ' SELECT T.CODIGO, T.NOME,                                   ' +
             '        CASE WHEN T.TIPO = 0 then ''Diário''                ' +
             '             WHEN T.TIPO = 1 then ''Semanal''               ' +
             '             WHEN T.TIPO = 2 then ''Quinzenal''             ' +
             '             WHEN T.TIPO = 3 then ''Mensal''                ' +
             '        END TIPO                                            ' +
             ' FROM TAREFAS T ' +
             ' INNER JOIN USUARIO_TAREFA UT ON UT.COD_TAREFA = T.CODIGO   ' ;

      dmConsulta.ConsultarUsuarios(sSQL + SQLWhere);

      if (dmConsulta.cdsConsulta.IsEmpty) then
      begin
        ShowMessage('A busca não retornou registros!');
        Exit;
      end;

      frmConsulta.Caption:= 'Consultar Tarefas';
      frmConsulta.ShowModal;

      if (CodUsu <> 0) then
      begin
        if (edtCodUsuario <> nil) then
          edtCodUsuario.Text  := dmConsulta.cdsConsulta.FieldByName('CODIGO').AsString;

        if (edtNomeUsuario <> nil) then
          edtNomeUsuario.Text := dmConsulta.cdsConsulta.FieldByName('NOME').AsString;;

        Consultar:= (edtCodUsuario = nil) and (edtNomeUsuario = nil) and (SQLWhere = '');
      end;
    except on E: Exception do
      MsgErroCriacao(frmConsulta);
    end;
  finally
    FreeAndNil(frmConsulta);
  end;
end;

class function TAbrirConsulta.AbrirConsultaUsuario(edtCodUsuario: TLabeledEdit; edtNomeUsuario, edtSenha: TEdit; cmbDireitos: TComboBox; SQLWhere: String): String;
begin
  try
    try
      Application.CreateForm(TfrmConsulta, frmConsulta);

      sSQL:= 'SELECT CODIGO, NOME, SENHA, DIREITO, CASE WHEN DIREITO = 0 THEN ''SUPERVISOR'' ELSE ''OPERADOR'' END DIREITO_DESCRICAO FROM USUARIOS ';

      dmConsulta.ConsultarUsuarios(sSQL + SQLWhere);

      if (dmConsulta.cdsConsulta.IsEmpty) then
      begin
        ShowMessage('A busca não retornou registros!');
        Exit;
      end;

      frmConsulta.Caption:= 'Consultar Usuários';
      frmConsulta.ShowModal;

      if (CodUsu <> 0) or (dmConsulta.cdsConsulta.FieldByName('NOME').AsString = 'ADM') then
      begin
        if (edtCodUsuario <> nil) then
          edtCodUsuario.Text  := dmConsulta.cdsConsulta.FieldByName('CODIGO').AsString;

        if (edtNomeUsuario <> nil) then
          edtNomeUsuario.Text := dmConsulta.cdsConsulta.FieldByName('NOME').AsString;

        if (edtSenha <> nil) then
          edtSenha.Text := dmConsulta.cdsConsulta.FieldByName('SENHA').AsString;

        if (cmbDireitos <> nil) then
          cmbDireitos.ItemIndex := dmConsulta.cdsConsulta.FieldByName('DIREITO').AsInteger;

        SUPERVISOR:= dmConsulta.cdsConsulta.FieldByName('DIREITO_DESCRICAO').AsString = 'SUPERVISOR';

        Consultar:= (edtCodUsuario = nil) and (edtNomeUsuario = nil) and (SQLWhere = '');
      end;
    except on E: Exception do
      MsgErroCriacao(frmConsulta);
    end;
  finally
    FreeAndNil(frmConsulta);
  end;
end;

procedure TfrmConsulta.FormResize(Sender: TObject);
begin
 AjustarColunas(dbgConsulta);
end;

procedure TfrmConsulta.FormShow(Sender: TObject);
begin
  if (Consultar) then
    btnSelecionar.Enabled:= False;
end;

procedure TfrmConsulta.actSairExecute(Sender: TObject);
begin
  CodUsu:= 0;
  Self.Close;
end;

procedure TfrmConsulta.actSelecionarExecute(Sender: TObject);
begin
  if not(dbgConsulta.DataSource.DataSet.IsEmpty) then
  begin
    CodUsu:= dbgConsulta.DataSource.DataSet.FieldByName('CODIGO').AsInteger;
    Close;
  end;
end;

procedure TfrmConsulta.dbgConsultaDblClick(Sender: TObject);
begin
  actSelecionarExecute(nil);
end;

procedure TfrmConsulta.dbgConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    actSelecionarExecute(nil);

  if (Key = VK_ESCAPE) then
    actSairExecute(nil);
end;

end.
