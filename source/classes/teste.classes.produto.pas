unit teste.classes.produto;

interface

uses
  Windows,
  System.classes,
  System.Generics.Collections,
  System.SysUtils;

type
  TprodutoClass = class
  Private
    Fcodigo: integer;
    Fdescricao: string;
    Fpreco: double;
  public
    function ListaProdutos(filtro: string): OleVariant;
    procedure Limpar();
    procedure Gravar;
    procedure Excluir;
    constructor create(icodigo: integer);

  published
    Property Codigo: integer read Fcodigo write Fcodigo;
    Property Descricao: string read Fdescricao write Fdescricao;
    Property Preco: double read Fpreco write Fpreco;

  end;

  Tprodutos = TObjectList<TprodutoClass>;

implementation

uses
  teste.dao.produto;

{ Tproduto }
{ ------------------------------------------------------------------------- }
constructor TprodutoClass.create(icodigo: integer);
begin
  if icodigo > 0 then
  begin
    Codigo := icodigo;
    TdaoProduto.getProduto(self);
  end;
end;

{ ------------------------------------------------------------------------- }
procedure TprodutoClass.Excluir;
begin
  if TdaoProduto.deleteProduto(self) then
    Limpar();
end;

{ ------------------------------------------------------------------------- }
procedure TprodutoClass.Gravar;
begin
  TdaoProduto.getProduto(self);
end;

{ ------------------------------------------------------------------------- }
procedure TprodutoClass.Limpar;
begin
  Fcodigo := 0;
  Fpreco := 0;
  Fdescricao := '';
end;

{ ------------------------------------------------------------------------- }
function TprodutoClass.ListaProdutos(filtro: string): OleVariant;
begin
  result := TdaoProduto.listarProdutos(filtro);
end;

{ ------------------------------------------------------------------------- }
end.
