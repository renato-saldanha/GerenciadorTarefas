unit Model.Usuario;

interface

type
  TModelUsuario = class(TObject)
  private
    FCodigo: String;
    FSenha: String;
    FNome: String;
  public
    property Codigo: String read FCodigo write FCodigo;
    property Nome: String read FNome write FNome;
    property Senha: String read FSenha write FSenha;
  end;

implementation

end.
