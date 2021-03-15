unit teste.dao.cliente;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  teste.classes.cliente,
  teste.dao.objects,
  Datasnap.Provider,
  Datasnap.DBClient

    ;

type
  TdaoCliente = class
  private
  public
    class procedure getCliente(var oclass: TClienteClass);
    class function deleteCliente(var oclass: TClienteClass): Boolean;
    class procedure setCliente(var oclass: TClienteClass);
    class function listarClientes(filtro: string): olevariant;
  end;

implementation

{ TdaoCliente }
{ -------------------------------------------------------------------------- }
class function TdaoCliente.deleteCliente(var oclass: TClienteClass): Boolean;
var
  qry: TFDQueryPlus;
begin
  result := false;
  try
    qry := TFDQueryPlus.Create(Nil);
    try
      qry.SQL.Add('DELETE FROM  clientes  ');
      qry.SQL.Add('WHERE codigo = ' + inttostr(oclass.Codigo));
      qry.ExecSQL;
      result := true;
    except
      on e: exception do
        raise exception.Create('[DAO Cliente]E 40 Falha ao excluir Cliente -> '
          + e.Message);
    end;

  finally
    qry.Connection.Close;
    FreeAndNil(qry);
  end;
end;

{ -------------------------------------------------------------------------- }
class procedure TdaoCliente.getCliente(var oclass: TClienteClass);
var
  qry: TFDQueryPlus;

begin
  qry := TFDQueryPlus.Create(Nil);
  try
    try
      qry.SQL.Add('SELECT                 ');
      qry.SQL.Add('  c.codigo,            ');
      qry.SQL.Add('  c.nome,              ');
      qry.SQL.Add('  c.cidade,            ');
      qry.SQL.Add('  c.uf                 ');
      qry.SQL.Add('FROM                   ');
      qry.SQL.Add('  clientes  c         ');
      qry.SQL.Add(' WHERE ');
      qry.SQL.Add('    c.codigo  = ' + inttostr(oclass.Codigo));
      qry.Open;
      oclass.Codigo := qry.FieldByName('codigo').AsInteger;
      oclass.nome := qry.FieldByName('nome').AsString;
      oclass.cidade := qry.FieldByName('cidade').AsString;
      oclass.uf := qry.FieldByName('uf').AsString;

    except
      on e: exception do
        raise exception.Create('[DAO Cliente]E 105 Falha na consulta -> ' +
          e.Message);
    end;
  finally
    qry.Connection.Close;
    FreeAndNil(qry);
  end;
end;

{ -------------------------------------------------------------------------- }
class function TdaoCliente.listarClientes(filtro: string): olevariant;
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
      qry.SQL.Add('  c.codigo,            ');
      qry.SQL.Add('  c.nome,              ');
      qry.SQL.Add('  c.cidade,            ');
      qry.SQL.Add('  c.uf                 ');
      qry.SQL.Add('FROM                   ');
      qry.SQL.Add('  clientes  c          ');
      qry.SQL.Add(' WHERE                 ');
      qry.SQL.Add('    c.codigo  > 0      ');

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
    qry.Connection.Close;
    FreeAndNil(qry);
    FreeAndNil(cds);
    FreeAndNil(prv);
  end;
end;

{ -------------------------------------------------------------------------- }
class procedure TdaoCliente.setCliente(var oclass: TClienteClass);
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
        qry.SQL.Add('SELECT  codigo FROM clientes WHERE codigo ' +
          inttostr(oclass.Codigo));
        qry.Open;
        if qry.RecordCount > 0 then
          isUpdate := true;
      end;
      if isUpdate then
      begin
        qry.SQL.Add('UPDATE clientes    ');
        qry.SQL.Add(' SET               ');
        qry.SQL.Add('  nome  =:nome,    ');
        qry.SQL.Add('  cidade =:cidade, ');
        qry.SQL.Add('  uf =:uf          ');
        qry.SQL.Add('WHERE              ');
        qry.SQL.Add('  codigo = ' + inttostr(oclass.Codigo));

      end
      else
      begin
        qry.SQL.Add('INSERT INTO clientes   ');
        qry.SQL.Add(' (                     ');
        qry.SQL.Add('  nome,                ');
        qry.SQL.Add('  cidade ,             ');
        qry.SQL.Add('  uf ,                 ');
        qry.SQL.Add(' )                     ');
        qry.SQL.Add('VALUES                 ');
        qry.SQL.Add(' (                     ');
        qry.SQL.Add('  :nome,               ');
        qry.SQL.Add('  :cidade,             ');
        qry.SQL.Add('  :uf                  ');
        qry.SQL.Add(' )                     ');

      end;
      qry.ParamByName('nome').AsString := oclass.nome;
      qry.ParamByName('cidade').AsString := oclass.cidade;
      qry.ParamByName('uf').AsString := oclass.uf;
      qry.ExecSQL;
      // ESTA ISOLADO NESTA TRANSACAO
      if (oclass.Codigo = 0) then
      begin
        qry.Close;
        qry.SQL.Clear;
        qry.SQL.Add('SELECT max(codigo) FROM Clientes  ');
        qry.Open;
        oclass.Codigo := qry.Fields[0].AsInteger;
      end;
      cn.Commit;
    except
      on e: exception do
      begin
        cn.Rollback;
        raise exception.Create
          ('[DAO Cliente]E 171 Falha ao inserir/atualizar Cliente -> ' +
          e.Message);
      end;
    end;
  finally
    qry.Connection.Close;
    FreeAndNil(qry);
    FreeAndNil(cn);
  end;
end;

end.
