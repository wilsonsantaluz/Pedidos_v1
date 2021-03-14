unit teste.classes.pedido;

interface

uses
  Windows,
  System.classes,
  System.Generics.Collections,
  System.SysUtils;

type
  TpedidoItem = class
  Private
    Fcodigo: integer;
    FcodigoProduto: integer;
    FdescricaoProduto: string;
    Fquantidade: integer;
    FvalorUnitario: double;
    FvalorTotal: double;

    function getValorTotal: double;
  public
  published
    Property Codigo: integer read Fcodigo write Fcodigo;
    Property CodigoProduto: integer read FcodigoProduto write FcodigoProduto;
    Property DescricaoProduto: string read FdescricaoProduto
      write FdescricaoProduto;
    Property Quantidade: integer read Fquantidade write Fquantidade;
    Property ValorUnitario: double read FvalorUnitario write FvalorUnitario;
    Property ValorTotal: double read getValorTotal write FvalorTotal;
  end;

  TpedidoItens = TObjectList<TpedidoItem>;

type
  TpedidoClass = class
  private
    Fcodigo: integer;
    Fdata: Tdatetime;
    FclienteCodigo: integer;
    FclienteNome: string;
    Ftotal: double;
    Fitens: TpedidoItens;
  public
    constructor create(numero: integer);
    procedure excluir;
    procedure gravar;
    procedure limpar;
    function getTotal: double;
    function Listapedidos(filtro: string): olevariant;
  published
    Property Codigo: integer read Fcodigo write Fcodigo;
    Property Data: Tdatetime read Fdata write Fdata;
    Property ClienteCodigo: integer read FclienteCodigo write FclienteCodigo;
    Property ClienteNome: string read FclienteNome write FclienteNome;
    Property Total: double read getTotal write Ftotal;
    Property Itens: TpedidoItens read Fitens write Fitens;

  end;

implementation

uses
  teste.dao.pedido;
{ Tpedido }

constructor TpedidoClass.create(numero: integer);

begin
  Fitens := TpedidoItens.create(false);
  if numero > 0 then
  begin
    Fcodigo := numero;
    TdaoPedido.getPedido(self);
  end;
end;
{ ----------------------------------------------------------------------------- }
{ TpedidoIten }

function TpedidoItem.getValorTotal: double;
begin
  result := 0;
  if (Quantidade > 0) and (ValorUnitario > 0) then
    result := Quantidade * ValorUnitario
end;

{ ----------------------------------------------------------------------------- }
procedure TpedidoClass.excluir;
begin
  if TdaoPedido.deletePedido(self) then
  begin
    limpar;

  end;
end;

{ ----------------------------------------------------------------------------- }
function TpedidoClass.getTotal: double;
var
  ototal: double;
  i: integer;
begin
  ototal := 0;
  for i := 0 to Itens.Count - 1 do
  begin
    ototal := ototal + Itens[i].ValorTotal;

  end;
  Ftotal := ototal;
  result := ototal;
end;

procedure TpedidoClass.gravar;
begin
  TdaoPedido.setPedido(self);
end;

procedure TpedidoClass.limpar;
begin
  Fcodigo := 0;
  Fdata := 0;
  FclienteCodigo := 0;
  ClienteNome := '';
  Ftotal := 0;
  Fitens.Clear;
end;

function TpedidoClass.Listapedidos(filtro: string): olevariant;
begin
  result := TdaoPedido.listarPedidos(filtro);
end;

{ ----------------------------------------------------------------------------- }
end.
