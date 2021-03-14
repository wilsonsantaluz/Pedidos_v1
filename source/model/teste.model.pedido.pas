unit teste.model.pedido;

interface

uses
  Windows,
  Classes,
  SysUtils,
  Dialogs,
  DB,
  DBClient,
  System.Generics.Collections,
  teste.Classes.pedido,
  teste.interfaces.mvc,
  ActiveX;

type
  TModelPedidoFiltro = record
    numero: Integer;
    cliente: Integer;
    Data: TDateTime;
  end;

  IModelPedido = interface(IModel)
    ['{AF6827F9-E8CB-49B5-9F26-23FEF62995F3}']
    // metodos obrigatorios da interface
    procedure Inicializar;
    procedure GravarPedido;
    procedure IniciarPedido;
    Procedure ExcluirPedido;
    procedure setItemPedido;
    procedure ExcluirItem;
    // metodos internos desta interface
    procedure Refresh;
    procedure RemoverFiltros;
    procedure SetPedido(numero: Integer);
    procedure FiltrarPedido(const Filtros: TModelPedidoFiltro);

    function getcdsPedido: TClientDataSet;
    procedure setcdsPedido(const value: TClientDataSet);
    function getPedidoClass: TpedidoClass;
    procedure setPedidoClass(const value: TpedidoClass);
    function getActiveItem: TpedidoItem;
    procedure setActiveItem(value: TpedidoItem);
    // propriedades
    property cdsPedido: TClientDataSet read getcdsPedido write setcdsPedido;
    property pedidoClass: TpedidoClass read getPedidoClass write setPedidoClass;
    property activeItem: TpedidoItem read getActiveItem write setActiveItem;
  end;

  TModelPedido = class(TInterfacedObject, IModelPedido)
  private
    FCdsPedido: TClientDataSet;
    FpedidoClass: TpedidoClass;
    FactiveItem: TpedidoItem;
    FFiltrando: Boolean;
    FFiltros: TModelPedidoFiltro;
    function getcdsPedido: TClientDataSet;
    procedure setcdsPedido(const value: TClientDataSet);
    function getPedidoClass: TpedidoClass;
    procedure setPedidoClass(const value: TpedidoClass);
    function getActiveItem: TpedidoItem;
    procedure setActiveItem(value: TpedidoItem);
    procedure cloneItem(dest: TpedidoItem);
    procedure sincronizarItem();
  protected

  public
    destructor Destroy; override;
    procedure Inicializar;
    procedure GravarPedido;
    procedure IniciarPedido;
    Procedure ExcluirPedido;
    procedure setItemPedido;
    procedure ExcluirItem;

    procedure Refresh;
    procedure RemoverFiltros;
    procedure SetPedido(numero: Integer);
    procedure FiltrarPedido(const Filtros: TModelPedidoFiltro);

    property cdsPedido: TClientDataSet read getcdsPedido write setcdsPedido;
    property pedidoClass: TpedidoClass read getPedidoClass write setPedidoClass;
    property activeItem: TpedidoItem read getActiveItem write setActiveItem;
  end;

implementation

uses

  teste.dao.pedido;

{ TModelPedido }
{ ----------------------------------------------------------------------------- }
procedure TModelPedido.cloneItem(dest: TpedidoItem);
begin
  dest.Codigo := FactiveItem.Codigo;
  dest.CodigoProduto := FactiveItem.CodigoProduto;
  dest.DescricaoProduto := FactiveItem.DescricaoProduto;
  dest.Quantidade := FactiveItem.Quantidade;
  dest.ValorUnitario := FactiveItem.ValorUnitario;
  dest.ValorTotal := FactiveItem.ValorTotal;
end;

{ ----------------------------------------------------------------------------- }
destructor TModelPedido.Destroy;
begin
  FreeAndNil(FCdsPedido);
  FreeAndNil(FpedidoClass);
  inherited;
end;

{ ----------------------------------------------------------------------------- }
procedure TModelPedido.ExcluirItem();
var
  i: Integer;
begin
  sincronizarItem();
  for i := 0 to FpedidoClass.Itens.Count - 1 do
  begin
    if FactiveItem.Codigo = FpedidoClass.Itens[i].Codigo then
      break
  end;
  FpedidoClass.Itens.Delete(i);
  cdsPedido.Delete();

end;

{ ----------------------------------------------------------------------------- }
procedure TModelPedido.ExcluirPedido;
begin
  FpedidoClass.excluir;
end;

{ ----------------------------------------------------------------------------- }
procedure TModelPedido.FiltrarPedido(const Filtros: TModelPedidoFiltro);
var

  Sfiltro: string;
begin
  FFiltrando := True;
  FFiltros := Filtros;
  try
    if FFiltros.numero > 0 then
      Sfiltro := 'AND codigo  = ' + inttostr(FFiltros.numero);
    if FFiltros.cliente > 0 then
      Sfiltro := Sfiltro + #13#10 + ' AND codigo_cliente  = ' +
        inttostr(FFiltros.cliente);

    if FFiltros.Data > 0 then
      Sfiltro := Sfiltro + #13#10 + '  AND data  = ' +
        QuotedStr(FormatDateTime('YYY-MM-DD', FFiltros.Data));

    { TO DO }
  finally
    FFiltrando := false;
  end;
end;

{ ----------------------------------------------------------------------------- }
function TModelPedido.getActiveItem: TpedidoItem;
begin
  result := FactiveItem;
end;

{ ----------------------------------------------------------------------------- }
function TModelPedido.getcdsPedido: TClientDataSet;
begin
  result := FCdsPedido;
end;

{ ----------------------------------------------------------------------------- }
function TModelPedido.getPedidoClass: TpedidoClass;
begin
  result := FpedidoClass;
end;

{ ----------------------------------------------------------------------------- }
procedure TModelPedido.GravarPedido;
begin
  TdaoPedido.SetPedido(FpedidoClass);
  /// **/
end;

{ ----------------------------------------------------------------------------- }
procedure TModelPedido.Inicializar;
begin
  FCdsPedido := TClientDataSet.Create(nil);
  FCdsPedido.FieldDefs.Clear;
  FCdsPedido.FieldDefs.Add('codigo', ftInteger, 0, false);
  FCdsPedido.FieldDefs.Add('produto_codigo', ftInteger, 0, false);
  FCdsPedido.FieldDefs.Add('descricao', ftString, 60, false);
  FCdsPedido.FieldDefs.Add('quantidade', ftInteger, 0, false);
  FCdsPedido.FieldDefs.Add('valor_unitario', ftCurrency, 0, false);
  FCdsPedido.FieldDefs.Add('valor_total', ftCurrency, 0, false);
  FCdsPedido.IndexDefs.Add('idxcodigo', 'codigo', []);

  FCdsPedido.CreateDataSet;
  FCdsPedido.IndexName := 'idxcodigo';
  FpedidoClass := TpedidoClass.Create(0);
  FactiveItem := TpedidoItem.Create;
  FFiltrando := false;
end;

{ ----------------------------------------------------------------------------- }
procedure TModelPedido.IniciarPedido;
begin
  FpedidoClass.limpar;
  cdsPedido.EmptyDataSet;
end;

{ ----------------------------------------------------------------------------- }
procedure TModelPedido.setItemPedido();
var
  tmpItem: TpedidoItem;
begin
  if FactiveItem.Codigo = 0 then
  begin
    cdsPedido.Insert;
    cdsPedido.FieldByName('codigo').AsInteger := FpedidoClass.Itens.Count + 1;
    cdsPedido.FieldByName('produto_codigo').AsInteger :=
      FactiveItem.CodigoProduto;
    cdsPedido.FieldByName('descricao').AsString := FactiveItem.DescricaoProduto;
    cdsPedido.FieldByName('quantidade').AsInteger := FactiveItem.Quantidade;
    cdsPedido.FieldByName('valor_unitario').AsFloat :=
      FactiveItem.ValorUnitario;
    cdsPedido.FieldByName('valor_total').AsFloat := FactiveItem.ValorTotal;
    cdsPedido.Post;
    tmpItem := TpedidoItem.Create;
    cloneItem(tmpItem);
    FpedidoClass.Itens.Add(tmpItem);
  end
  else
  begin
    if not cdsPedido.FindKey([inttostr(FactiveItem.Codigo)]) then
      raise Exception.Create('O item não foi encontrado');
    cdsPedido.edit;
    cdsPedido.FieldByName('produto_codigo').AsInteger :=
      FactiveItem.CodigoProduto;
    cdsPedido.FieldByName('descricao').AsString := FactiveItem.DescricaoProduto;
    cdsPedido.FieldByName('quantidade').AsInteger := FactiveItem.Quantidade;
    cdsPedido.FieldByName('valor_unitario').AsFloat :=
      FactiveItem.ValorUnitario;
    cdsPedido.FieldByName('valor_total').AsFloat := FactiveItem.ValorTotal;
    cdsPedido.Post;

  end;
end;

{ ----------------------------------------------------------------------------- }
procedure TModelPedido.Refresh;

begin

  try
    FiltrarPedido(FFiltros);
  finally

  end;
end;

{ ----------------------------------------------------------------------------- }
procedure TModelPedido.RemoverFiltros;
begin
  FFiltrando := false;
  ZeroMemory(@FFiltros, SizeOf(FFiltros));
  Refresh;
end;

{ ----------------------------------------------------------------------------- }
procedure TModelPedido.setActiveItem(value: TpedidoItem);
begin
  FactiveItem := value;
end;

{ ----------------------------------------------------------------------------- }
procedure TModelPedido.setcdsPedido(const value: TClientDataSet);
begin
  FCdsPedido := value;
end;

{ ----------------------------------------------------------------------------- }
procedure TModelPedido.SetPedido(numero: Integer);
var
  i: Integer;
begin
  if assigned(FpedidoClass) then
    FreeAndNil(FpedidoClass);
  FpedidoClass := TpedidoClass.Create(numero);
  cdsPedido.EmptyDataSet;

  for i := 0 to FpedidoClass.Itens.Count - 1 do
  begin
    cdsPedido.Insert;
    cdsPedido.FieldByName('codigo').AsInteger := FpedidoClass.Itens[i].Codigo;
    cdsPedido.FieldByName('produto_codigo').AsInteger := FpedidoClass.Itens[i]
      .CodigoProduto;
    cdsPedido.FieldByName('descricao').AsString := FpedidoClass.Itens[i]
      .DescricaoProduto;
    cdsPedido.FieldByName('quantidade').AsInteger := FpedidoClass.Itens[i]
      .Quantidade;
    cdsPedido.FieldByName('valor_unitario').AsFloat := FpedidoClass.Itens[i]
      .ValorUnitario;
    cdsPedido.FieldByName('valor_total').AsFloat := FpedidoClass.Itens[i]
      .ValorTotal;
    cdsPedido.Post

  end;

end;

{ ----------------------------------------------------------------------------- }
procedure TModelPedido.setPedidoClass(const value: TpedidoClass);
begin
  FpedidoClass := value;
end;

procedure TModelPedido.sincronizarItem;
begin
  FactiveItem.Codigo := cdsPedido.FieldByName('codigo').AsInteger;
  FactiveItem.CodigoProduto := cdsPedido.FieldByName('produto_codigo')
    .AsInteger;
  FactiveItem.DescricaoProduto := cdsPedido.FieldByName('descricao').AsString;
  FactiveItem.Quantidade := cdsPedido.FieldByName('quantidade').AsInteger;
  FactiveItem.ValorUnitario := cdsPedido.FieldByName('valor_unitario').AsFloat;
  FactiveItem.ValorTotal := cdsPedido.FieldByName('valor_total').AsFloat;
end;

{ ----------------------------------------------------------------------------- }
end.
