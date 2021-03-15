unit teste.dao.pedido;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  teste.classes.pedido,
  Datasnap.Provider,
  Datasnap.DBClient,
  FireDAC.Stan.Option,
  teste.dao.objects;

type
  TdaoPedido = class
  private

  public
    class procedure getPedido(var oclass: TpedidoClass);
    class function deletePedido(var oclass: TpedidoClass): Boolean;
    class procedure setPedido(var oclass: TpedidoClass);
    class function Listarpedidos(filtro: string): olevariant;
  end;

implementation

{ TdaoPedido }
{ -------------------------------------------------------------------------- }
class function TdaoPedido.deletePedido(var oclass: TpedidoClass): Boolean;
var
  qry: TFDQueryPlus;
begin
  result := false;
  try
    qry := TFDQueryPlus.Create(Nil);
    try
      qry.SQL.Add('DELETE FROM  pedidos  ');
      qry.SQL.Add('WHERE numero = ' + inttostr(oclass.Codigo));
      qry.ExecSQL;
      result := true;
    except
      on e: exception do
        raise exception.Create('[DAO PEDIDO]E 40 Falha ao excluir pedido -> ' +
          e.Message);
    end;

  finally
    qry.Close;
    FreeAndNil(qry);
  end;
end;

{ -------------------------------------------------------------------------- }
class procedure TdaoPedido.getPedido(var oclass: TpedidoClass);
var
  qry: TFDQueryPlus;
  oiten: TpedidoItem;
begin
  qry := TFDQueryPlus.Create(Nil);
  try
    try
      qry.SQL.Add('SELECT                 ');
      qry.SQL.Add('  p.numero,            ');
      qry.SQL.Add('  p.data,              ');
      qry.SQL.Add('  p.cliente_codigo,    ');
      qry.SQL.Add('  p.total,             ');
      qry.SQL.Add('  c.nome               ');
      qry.SQL.Add('FROM                   ');
      qry.SQL.Add('  pedidos  p           ');
      qry.SQL.Add('INNER JOIN clientes c ON  ');
      qry.SQL.Add(' c.codigo   = p.cliente_codigo');
      qry.SQL.Add(' WHERE ');
      qry.SQL.Add('    p.numero  = ' + inttostr(oclass.Codigo));
      qry.Open;
      if assigned(oclass) then
      begin
        oclass.Itens.Clear;
        oclass.Codigo := qry.FieldByName('numero').AsInteger;
        oclass.Data := qry.FieldByName('data').AsDateTime;
        oclass.ClienteCodigo := qry.FieldByName('cliente_codigo').AsInteger;
        oclass.ClienteNome := qry.FieldByName('nome').AsString;
        oclass.total := qry.FieldByName('total').AsFloat;
        qry.SQL.Clear;
        qry.SQL.Add('SELECT                         ');
        qry.SQL.Add('   i.codigo,                    ');
        qry.SQL.Add('   i.pedido_numero,             ');
        qry.SQL.Add('   i.produto_codigo,            ');
        qry.SQL.Add('   i.valor_unitario,            ');
        qry.SQL.Add('   i.quantidade,                ');
        qry.SQL.Add('   p.descricao,                 ');
        qry.SQL.Add('   i.valor_total                ');
        qry.SQL.Add('FROM                            ');
        qry.SQL.Add('    pedido_item i               ');
        qry.SQL.Add('INNER JOIN  produtos p on       ');
        qry.SQL.Add('  p.codigo   =i.produto_codigo  ');
        qry.SQL.Add('WHERE                 ');
        qry.SQL.Add('  i.pedido_numero  = ' + inttostr(oclass.Codigo));
        qry.Open;
        qry.First;
        while not qry.eof do
        begin
          oiten := TpedidoItem.Create;
          oiten.Codigo := qry.FieldByName('codigo').AsInteger;
          oiten.CodigoProduto := qry.FieldByName('produto_codigo').AsInteger;
          oiten.DescricaoProduto := qry.FieldByName('descricao').AsString;
          oiten.Quantidade := qry.FieldByName('quantidade').AsInteger;
          oiten.ValorUnitario := qry.FieldByName('valor_unitario').AsFloat;
          oiten.ValorTotal := qry.FieldByName('valor_total').AsFloat;
          oclass.Itens.Add(oiten);
          qry.Next;
        end;
      end;
    except
      on e: exception do
        raise exception.Create('[DAO PEDIDO]E 109 Falha na consulta -> ' +
          e.Message);
    end;
  finally
    qry.Connection.Connected := false;
    FreeAndNil(qry);
  end;

end;

class function TdaoPedido.Listarpedidos(filtro: string): olevariant;

var
  qry: TFDQueryPlus;
  cds: TClientDataSet;
  prv: TDataSetProvider;
begin
  qry := TFDQueryPlus.Create(Nil);
  cds := TClientDataSet.Create(Nil);
  prv := TDataSetProvider.Create(Nil);

  try
    try
      qry.SQL.Add('SELECT                 ');
      qry.SQL.Add('  a.numero,            ');
      qry.SQL.Add('  a.data,              ');
      qry.SQL.Add('  a.cliente_codigo,    ');
      qry.SQL.Add('  c.nome,              ');
      qry.SQL.Add('  c.uf,                ');
      qry.SQL.Add('  c.cidade,            ');
      qry.SQL.Add('  a.total             ');
      qry.SQL.Add('FROM                   ');
      qry.SQL.Add('  pedidos  a           ');
      qry.SQL.Add(' INNER JOIN clientes c ON ');
      qry.SQL.Add('   c.codigo  =a.cliente_codigo    ');
      qry.SQL.Add(' WHERE                 ');
      qry.SQL.Add('    a.numero  > 0      ');
      if filtro <> '' then
        qry.SQL.Add(filtro);
      // FORCAR PARA QUE A CONEXAO SEJA ATIBUIDA
      qry.Open;
      prv.DataSet := qry;
      cds.SetProvider(prv);
      cds.Open;
      result := cds.Data;
    except
      on e: exception do
        raise exception.Create('[DAO PEDIDOS]E 155 Falha na consulta -> ' +
          e.Message);

    end;

  finally
    qry.Close;
    FreeAndNil(qry);
    FreeAndNil(cds);
    FreeAndNil(prv);
  end;
end;

{ -------------------------------------------------------------------------- }

class procedure TdaoPedido.setPedido(var oclass: TpedidoClass);
var
  qry: TFDQueryPlus;
  oiten: TpedidoItem;
  i: integer;
  isUpdate: Boolean;

  procedure excluirItens();
  begin
    qry.SQL.Clear;
    qry.SQL.Add('DELETE                         ');
    qry.SQL.Add('FROM                            ');
    qry.SQL.Add('    pedido_item               ');
    qry.SQL.Add('WHERE                 ');
    qry.SQL.Add('  pedido_numero  = ' + inttostr(oclass.Codigo));
    qry.ExecSQL;

  end;
  procedure setInsertItens();
  begin
    qry.SQL.Clear;
    qry.SQL.Add('  INSERT INTO  ');
    qry.SQL.Add('  pedido_item  ');
    qry.SQL.Add('(              ');

    qry.SQL.Add('  pedido_numero,  ');
    qry.SQL.Add('  produto_codigo, ');
    qry.SQL.Add('  valor_unitario, ');
    qry.SQL.Add('  quantidade,     ');
    qry.SQL.Add('  valor_total)    ');
    qry.SQL.Add('VALUE (           ');

    qry.SQL.Add('  :pedido_numero, ');
    qry.SQL.Add('  :produto_codigo,');
    qry.SQL.Add('  :valor_unitario,');
    qry.SQL.Add('  :quantidade,    ');
    qry.SQL.Add('  :valor_total);  ');

  end;

begin

  qry := TFDQueryPlus.Create(Nil);
  qry.DefinirConexao();
  qry.IniciarTransacao;
  try
    try
      isUpdate := false;
      if oclass.Codigo > 0 then
      begin
        qry.SQL.Clear;
        qry.SQL.Add('SELECT numero FROM pedidos WHERE numero = ' +
          inttostr(oclass.Codigo));
        qry.Open;
        if qry.RecordCount > 0 then
          isUpdate := true;
      end;
      qry.Close;
      qry.SQL.Clear;
      if isUpdate then
      begin
        qry.SQL.Add('UPDATE pedidos    ');
        qry.SQL.Add(' SET               ');
        qry.SQL.Add('  data  =:data,    ');
        qry.SQL.Add('  cliente_codigo =:cliente_codigo,');
        qry.SQL.Add('  total =:total   ');
        qry.SQL.Add('WHERE             ');
        qry.SQL.Add('  numero = ' + inttostr(oclass.Codigo));
      end
      else
      begin
        qry.SQL.Add('INSERT INTO pedidos    ');
        qry.SQL.Add(' (                     ');
        qry.SQL.Add('  data,                ');
        qry.SQL.Add('  cliente_codigo,      ');
        qry.SQL.Add('  total               ');
        qry.SQL.Add(' )                     ');
        qry.SQL.Add('VALUES                 ');
        qry.SQL.Add(' (                     ');
        qry.SQL.Add('  :data,               ');
        qry.SQL.Add('  :cliente_codigo,     ');
        qry.SQL.Add('  :total               ');
        qry.SQL.Add(' )                     ');
      end;
      qry.ParamByName('data').AsDateTime := oclass.Data;
      qry.ParamByName('cliente_codigo').AsInteger := oclass.ClienteCodigo;
      qry.ParamByName('total').AsFloat := oclass.total;
      qry.ExecSQL;
      // ESTA ISOLADO NESTA TRANSACAO
      if (oclass.Codigo = 0) then
      begin
        qry.Close;
        qry.SQL.Clear;
        qry.SQL.Add('SELECT max(numero) FROM pedidos  ');
        qry.Open;
        oclass.Codigo := qry.Fields[0].AsInteger;
      end;
      // MEIO BRUTO MAIS TEM MELHOR DESENPENHO QUE TRATAR 1 A 1 OU RECONCILIE
      qry.Close;
      qry.SQL.Clear;
      excluirItens();
      setInsertItens();
      for i := 0 to oclass.Itens.Count - 1 do
      begin

        qry.ParamByName('pedido_numero').AsInteger := oclass.Codigo;;
        qry.ParamByName('produto_codigo').AsInteger :=
          oclass.Itens[i].CodigoProduto;
        qry.ParamByName('valor_unitario').AsFloat :=
          oclass.Itens[i].ValorUnitario;
        qry.ParamByName('quantidade').AsInteger := oclass.Itens[i].Quantidade;
        qry.ParamByName('valor_total').AsFloat := oclass.Itens[i].ValorTotal;
        qry.ExecSQL;
      end;

      qry.ComitarTransacao;
    except
      on e: exception do
      begin
        qry.DesfazerTransacao;
        raise exception.Create
          ('[DAO PEDIDO]E 171 Falha ao inserir/atualizar pedido -> ' +
          e.Message);
      end;
    end;
  finally
    qry.close;
    FreeAndNil(qry);

  end;
end;

end.
