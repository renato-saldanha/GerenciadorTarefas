unit Uteis;

interface

Uses
Vcl.Dialogs, Vcl.Forms, Datasnap.DBClient, Data.SqlExpr, Vcl.DBGrids, Data.DB, Vcl.Graphics, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, Vcl.ComCtrls;

procedure MsgErroCriacao(Form: TForm);
procedure MsgErroConexao(cds: TClientDataSet);  overload;
procedure MsgErroConexao(qry: TSQLQuery);  overload;

procedure AjustarColunas(dbg : TDBgrid);

function SomenteNumeros(char: char): char;

var sSQL: String;
const USUARIO_INEXISTENTE = 'USU�RIO INEXISTENTE';
var SUPERVISOR: Boolean;

implementation

procedure MsgErroCriacao(Form: TForm);
begin
  ShowMessage('N�o foi poss�vel abrir a tela de ' + Form.Caption);
end;

procedure MsgErroConexao(cds: TClientDataSet);
begin
  ShowMessage('N�o foi poss�vel se conectar, problema no: ' + cds.Name);
end;

procedure MsgErroConexao(qry: TSQLQuery);
begin
  ShowMessage('N�o foi poss�vel se conectar, problema no: ' + qry.Name);
end;

function SomenteNumeros(char: char): char;
begin
  if (char in ['0'..'9']) or (char = #8) then
    Result:= char
  else
    Result:= #0;
end;

procedure AjustarColunas(dbg : TDBgrid);
type
  TArray = Array of Integer;
  procedure AjustarColumns(Swidth, TSize: Integer; Asize: TArray);
  var
    idx: Integer;
  begin
    if TSize = 0 then
    begin
      TSize := dbg.Columns.count;
      for idx := 0 to dbg.Columns.count - 1 do
        dbg.Columns[idx].Width := (dbg.Width - dbg.Canvas.TextWidth('AAAAAA')
          ) div TSize
    end
    else
      for idx := 0 to dbg.Columns.count - 1 do
        dbg.Columns[idx].Width := dbg.Columns[idx].Width +
          (Swidth * Asize[idx] div TSize);
  end;

var
  idx, Twidth, TSize, Swidth: Integer;
  AWidth: TArray;
  Asize: TArray;
  NomeColuna: String;
begin
  SetLength(AWidth, dbg.Columns.count);
  SetLength(Asize, dbg.Columns.count);
  Twidth := 0;
  TSize := 0;
  for idx := 0 to dbg.Columns.count - 1 do
  begin
    NomeColuna := dbg.Columns[idx].Title.Caption;
    dbg.Columns[idx].Width := dbg.Canvas.TextWidth
      (dbg.Columns[idx].Title.Caption + 'A');
    AWidth[idx] := dbg.Columns[idx].Width;
    Twidth := Twidth + AWidth[idx];

    if Assigned(dbg.Columns[idx].Field) then
      Asize[idx] := dbg.Columns[idx].Field.Size
    else
      Asize[idx] := 1;

    TSize := TSize + Asize[idx];
  end;
  if TDBGridOption.dgColLines in dbg.Options then
    Twidth := Twidth + dbg.Columns.count;

  // adiciona a largura da coluna indicada do cursor
  if TDBGridOption.dgIndicator in dbg.Options then
    Twidth := Twidth + IndicatorWidth;

  Swidth := dbg.ClientWidth - Twidth;
  AjustarColumns(Swidth, TSize, Asize);
end;


end.
