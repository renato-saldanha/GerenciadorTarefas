unit Form.Consulta.Generica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Data.FMTBcd, Data.SqlExpr, System.Actions,
  Vcl.ActnList, Vcl.Buttons, Vcl.ComCtrls,
  Controller.Usuario,
  Uteis, Model.Usuario;

type
  TFrmConsultaGenerica = class(TForm)
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
     class function AbrirConsultaUsuario(aEdtCodUsuario, aEdtNomeUsuario, aEdtSenha: TCustomEdit; aCmbDireitos: TComboBox; aSQLWhere: String): String;
     class function AbrirConsultaUsuarioTarefa(aEdtCodUsuario, aEdtNomeUsuario: TCustomEdit; aSQLWhere: String): String;
     class function AbrirConsultaTarefa(aEdtCodUsuario, aEdtNomeUsuario: TCustomEdit; aSQLWhere: String): String;
  end;

var
  FrmConsultaGenerica: TFrmConsultaGenerica;
  FCodUsu: Integer;
  FConsultar: boolean;
implementation

{$R *.dfm}


{ TfrmConsulta }

class function TFrmConsultaGenerica.AbrirConsultaUsuarioTarefa(aEdtCodUsuario, aEdtNomeUsuario: TCustomEdit; aSQLWhere: String): String;
var
  Usuario: TModelUsuario;
begin
  try
    try
      Application.CreateForm(TFrmConsultaGenerica, FrmConsultaGenerica);
      FrmConsultaGenerica.Caption:= 'Consultar Usu�rios';
      FrmConsultaGenerica.ShowModal;

      VPSQL:= 'SELECT CODIGO, NOME FROM USUARIOS ';

      Usuario := ControllerUsuario.ConsultarUsuarios(VPSQL, aSQLWhere, aEdtCodUsuario, aEdtNomeUsuario);

      if (Usuario <> nil) and (FCodUsu <> 0) then
      begin
        if (aEdtNomeUsuario <> nil) then
          aEdtNomeUsuario.Text  := ControllerUsuario.cdsConsulta.FieldByName('CODIGO').AsString;

        if (aEdtNomeUsuario <> nil) then
          aEdtNomeUsuario.Text  := ControllerUsuario.cdsConsulta.FieldByName('NOME').AsString;

        FConsultar:= ;
      end;
    except on E: Exception do
      MsgErroCriacao(FrmConsultaGenerica);
    end;
  finally
    FreeAndNil(FrmConsultaGenerica);
  end;
end;

class function TFrmConsultaGenerica.AbrirConsultaTarefa(aEdtCodUsuario, aEdtNomeUsuario: TCustomEdit; aSQLWhere: String): String;
begin
   try
    try
      Application.CreateForm(TFrmConsultaGenerica, FrmConsultaGenerica);

      VPSQL:= ' SELECT T.CODIGO, T.NOME,                                   ' +
             '        CASE WHEN T.TIPO = 0 then ''Di�rio''                ' +
             '             WHEN T.TIPO = 1 then ''Semanal''               ' +
             '             WHEN T.TIPO = 2 then ''Quinzenal''             ' +
             '             WHEN T.TIPO = 3 then ''Mensal''                ' +
             '        END TIPO                                            ' +
             ' FROM TAREFAS T ' +
             ' INNER JOIN USUARIO_TAREFA UT ON UT.COD_TAREFA = T.CODIGO   ' ;

      ControllerUsuario.ConsultarUsuarios(VPSQL + aSQLWhere);

      if (ControllerUsuario.cdsConsulta.IsEmpty) then
      begin
        ShowMessage('A busca n�o retornou registros!');
        Exit;
      end;

      FrmConsultaGenerica.Caption:= 'Consultar Tarefas';
      FrmConsultaGenerica.ShowModal;

      if (FCodUsu <> 0) then
      begin
        if (edtCodUsuario <> nil) then
          edtCodUsuario.Text  := ControllerUsuario.cdsConsulta.FieldByName('CODIGO').AsString;

        if (edtNomeUsuario <> nil) then
          edtNomeUsuario.Text := ControllerUsuario.cdsConsulta.FieldByName('NOME').AsString;;

        FConsultar:= (edtCodUsuario = nil) and (edtNomeUsuario = nil) and (aSQLWhere = '');
      end;
    except on E: Exception do
      MsgErroCriacao(FrmConsultaGenerica);
    end;
  finally
    FreeAndNil(FrmConsultaGenerica);
  end;
end;

class function TFrmConsultaGenerica.AbrirConsultaUsuario(aEdtCodUsuario, aEdtNomeUsuario, aEdtSenha: TCustomEdit; aCmbDireitos: TComboBox; aSQLWhere: String): String;
begin
  try
    try
      Application.CreateForm(TFrmConsultaGenerica, FrmConsultaGenerica);

      VPSQL:= 'SELECT CODIGO, NOME, SENHA, DIREITO, CASE WHEN DIREITO = 0 THEN ''SUPERVISOR'' ELSE ''OPERADOR'' END DIREITO_DESCRICAO FROM USUARIOS ';

      ControllerUsuario.ConsultarUsuarios(VPSQL + aSQLWhere);

      if (ControllerUsuario.cdsConsulta.IsEmpty) then
      begin
        ShowMessage('A busca n�o retornou registros!');
        Exit;
      end;

      FrmConsultaGenerica.Caption:= 'Consultar Usu�rios';
      FrmConsultaGenerica.ShowModal;

      if (FCodUsu <> 0) or (ControllerUsuario.cdsConsulta.FieldByName('NOME').AsString = 'ADM') then
      begin
        if (edtCodUsuario <> nil) then
          edtCodUsuario.Text  := ControllerUsuario.cdsConsulta.FieldByName('CODIGO').AsString;

        if (edtNomeUsuario <> nil) then
          edtNomeUsuario.Text := ControllerUsuario.cdsConsulta.FieldByName('NOME').AsString;

        if (edtSenha <> nil) then
          edtSenha.Text := ControllerUsuario.cdsConsulta.FieldByName('SENHA').AsString;

        if (cmbDireitos <> nil) then
          cmbDireitos.ItemIndex := ControllerUsuario.cdsConsulta.FieldByName('DIREITO').AsInteger;

        SUPERVISOR:= ControllerUsuario.cdsConsulta.FieldByName('DIREITO_DESCRICAO').AsString = 'SUPERVISOR';

        FConsultar:= (edtCodUsuario = nil) and (edtNomeUsuario = nil) and (aSQLWhere = '');
      end;
    except on E: Exception do
      MsgErroCriacao(FrmConsultaGenerica);
    end;
  finally
    FreeAndNil(FrmConsultaGenerica);
  end;
end;

procedure TFrmConsultaGenerica.FormResize(Sender: TObject);
begin
 AjustarColunas(dbgConsulta);
end;

procedure TFrmConsultaGenerica.FormShow(Sender: TObject);
begin
  if (FConsultar) then
    btnSelecionar.Enabled:= False;
end;

procedure TFrmConsultaGenerica.actSairExecute(Sender: TObject);
begin
  FCodUsu:= 0;
  Self.Close;
end;

procedure TFrmConsultaGenerica.actSelecionarExecute(Sender: TObject);
begin
  if not(dbgConsulta.DataSource.DataSet.IsEmpty) then
  begin
    FCodUsu:= dbgConsulta.DataSource.DataSet.FieldByName('CODIGO').AsInteger;
    Close;
  end;
end;

procedure TFrmConsultaGenerica.dbgConsultaDblClick(Sender: TObject);
begin
  actSelecionarExecute(nil);
end;

procedure TFrmConsultaGenerica.dbgConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    actSelecionarExecute(nil);

  if (Key = VK_ESCAPE) then
    actSairExecute(nil);
end;

end.
