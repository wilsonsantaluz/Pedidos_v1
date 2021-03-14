unit teste.dao.produto;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  teste.classes.produto,
  teste.dao.objects,
  Datasnap.Provider,
  Datasnap.DBClient;

type
  TdaoProduto = class
  private
  public
    class procedure getProduto(var oclass: TProdutoClass);
    class function deleteProduto(var oclass: TProdutoClass): Boolean;
    class procedure setProduto(var oclass: TProdutoClass);
    class function listarProdutos(filtro: string): olevariant;
  end;

implementation

{ TdaoProduto }
{ -------------------------------------------------------------------------- }
class function TdaoProduto.deleteProduto(var oclass: TProdutoClass): Boolean;
var
  qry: TFDQueryPlus;
begin
  result := false;
  try
    qry := TFDQueryPlus.Create(Nil);
    try
      qry.SQL.Add('DELETE FROM  produtos  ');
      qry.SQL.Add('WHERE codigo = ' + inttostr(oclass.Codigo));
      qry.ExecSQL;
      result := true;
    except
      on e: exception do
        raise exception.Create('[DAO Produto]E 40 Falha ao excluir Produto -> '
          + e.Message);
    end;

  finally
    FreeAndNil(qry);
  end;
end;

{ -------------------------------------------------------------------------- }
class procedure TdaoProduto.getProduto(var oclass: TProdutoClass);
var
  qry: TFDQueryPlus;

begin
  qry := TFDQueryPlus.Create(Nil);
  try
    try
      qry.SQL.Add('SELECT                 ');
      qry.SQL.Add('  p.codigo,            ');
      qry.SQL.Add('  p.descricao,         ');
      qry.SQL.Add('  p.preco              ');
      qry.SQL.Add('FROM                   ');
      qry.SQL.Add('  produtos  p          ');
      qry.SQL.Add(' WHERE ');
      qry.SQL.Add('    p.codigo  = ' + inttostr(oclass.Codigo));
      qry.Open;
      oclass.Codigo := qry.FieldByName('codigo').AsInteger;
      oclass.descricao := qry.FieldByName('descricao').AsString;
      oclass.preco := qry.FieldByName('preco').AsFloat;

    except
      on e: exception do
        raise exception.Create('[DAO Produto]E 105 Falha na consulta -> ' +
          e.Message);
    end;
  finally
    FreeAndNil(qry);
  end;
end;

{ -------------------------------------------------------------------------- }
class function TdaoProduto.listarProdutos(filtro: string): olevariant;
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
      qry.SQL.Add('  p.codigo,            ');
      qry.SQL.Add('  p.descricao,         ');
      qry.SQL.Add('  p.preco              ');
      qry.SQL.Add('FROM                   ');
      qry.SQL.Add('  produtos  p          ');
      qry.SQL.Add(' WHERE                 ');
      qry.SQL.Add('    p.codigo  > 0     ');
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
        raise exception.Create('[DAO Produto]E 114 Falha na consulta -> ' +
          e.Message);

    end;

  finally
    FreeAndNil(qry);
    FreeAndNil(cds);
    FreeAndNil(prv);
  end;

end;

{ -------------------------------------------------------------------------- }
class procedure TdaoProduto.setProduto(var oclass: TProdutoClass);
var
  qry: TFDQueryPlus;

  isUpdate: Boolean;
  cn: TConnectionClass;
begin
  cn := TConnectionClass.Create(Nil);
  TDaoUtil.SetConexao(cn);
  qry := TFDQueryPlus.Create(Nil);
  cn.StartTransaction;
  try
    try
      isUpdate := false;
      if oclass.Codigo > 0 then
      begin
        qry.SQL.Add('SELECT  codigo FROM produtos WHERE codigo ' +
          inttostr(oclass.Codigo));
        qry.Open;
        if qry.RecordCount > 0 then
          isUpdate := true;
      end;
      if isUpdate then
      begin
        qry.SQL.Add('UPDATE Produtos    ');
        qry.SQL.Add(' SET               ');
        qry.SQL.Add('  descricao  =:descricao,    ');
        qry.SQL.Add('  preco =:preco');
        qry.SQL.Add('WHERE             ');
        qry.SQL.Add('  codigo = ' + inttostr(oclass.Codigo));

      end
      else
      begin
        qry.SQL.Add('INSERT INTO produtos    ');
        qry.SQL.Add(' (                     ');
        qry.SQL.Add('  descricao,          ');
        qry.SQL.Add('  preco                ');
        qry.SQL.Add(' )                     ');
        qry.SQL.Add('VALUES                 ');
        qry.SQL.Add(' (                     ');
        qry.SQL.Add('  :descricao,          ');
        qry.SQL.Add('  :preco               ');
        qry.SQL.Add(' )                     ');

      end;
      qry.ParamByName('descricao').AsString := oclass.descricao;
      qry.ParamByName('preco').AsFloat := oclass.preco;
      qry.ExecSQL;
      // ESTA ISOLADO NESTA TRANSACAO
      if (oclass.Codigo = 0) then
      begin
        qry.Close;
        qry.SQL.Clear;
        qry.SQL.Add('SELECT max(codigo) FROM produtos  ');
        qry.Open;
        oclass.Codigo := qry.Fields[0].AsInteger;
      end;
      cn.Commit;
    except
      on e: exception do
      begin
        cn.Rollback;
        raise exception.Create
          ('[DAO Produto]E 171 Falha ao inserir/atualizar Produto -> ' +
          e.Message);
      end;
    end;
  finally
    FreeAndNil(qry);
    FreeAndNil(cn);
  end;
end;

{ -------------------------------------------------------------------------- }
end.
