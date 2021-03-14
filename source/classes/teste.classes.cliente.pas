unit teste.classes.cliente;

interface

uses
  Windows,
  System.classes,
  System.Generics.Collections,
  System.SysUtils;

type
  TclienteClass = class
  Private
    Fcodigo: integer;
    Fnome: string;
    Fcidade: string;
    Fuf: string;

  public
    function Listaclientes(filtro: string): OleVariant;
    procedure Limpar();
    procedure Gravar;
    procedure Excluir;
    constructor create(icodigo: integer);

  published
    Property Codigo: integer read Fcodigo write Fcodigo;
    Property Nome: string read Fnome write Fnome;
    Property Cidade: string read Fcidade write Fcidade;
    Property Uf: string read Fuf write Fuf;
  end;

  Tclientes = TObjectList<TclienteClass>;

implementation

uses
  teste.dao.cliente;

{ Tcliente }
{ ------------------------------------------------------------------------- }
constructor TclienteClass.create(icodigo: integer);
begin
  if icodigo > 0 then
  begin
    Codigo := icodigo;
    Tdaocliente.getcliente(self);
  end;
end;

{ ------------------------------------------------------------------------- }
procedure TclienteClass.Excluir;
begin
  if Tdaocliente.deletecliente(self) then
    Limpar();
end;

{ ------------------------------------------------------------------------- }
procedure TclienteClass.Gravar;
begin
  Tdaocliente.getcliente(self);
end;

{ ------------------------------------------------------------------------- }
procedure TclienteClass.Limpar;
begin
  Fcodigo := 0;
  Fnome := '';
  Fcidade := '';
  Fuf := '';
end;

{ ------------------------------------------------------------------------- }
function TclienteClass.Listaclientes(filtro: string): OleVariant;
begin
  result := Tdaocliente.listarclientes(filtro);
end;

{ ------------------------------------------------------------------------- }
end.
