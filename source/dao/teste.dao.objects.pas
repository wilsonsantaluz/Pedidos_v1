unit teste.dao.objects;

interface

uses
  teste.lib.constantes,
  SysUtils,
  Inifiles,
  Classes,
  DB,
  DBClient,
  Provider,
  WideStrings,
  FMTBcd,
  SqlExpr,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client,
  FireDAC.Phys.SQLite,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Phys.PG,
  FireDAC.Phys.PGDef,
  FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef

    ;

type
  TFDQueryPlus = class;
  TConnectionClass = TFDconnection;

  INFeDataModule = interface
    ['{7D2A1E67-F7B1-4891-8BDB-8BDA459B1256}']
    function getConnectionObj: TConnectionClass;
    procedure Log(const Mensagem: String);
  end;

  IDBPlus = interface
    ['{E8696980-7028-4E64-A4F9-DB76B5307F8C}']
    procedure IniciarTransacao;
    procedure ComitarTransacao;
    procedure DesfazerTransacao;
    procedure DefinirParametro(Nome: String; Tipo: TFieldType; Valor: variant);
    function GetData: OleVariant;
  end;

  TFDQueryPlus = class(Tfdquery, IDBPlus)

  private
    FID: String;
    procedure GravarQueryLog(const prefixo: String);

  protected
    iniTimer, fimTimer: TDateTime;
    procedure StartCountTimer;
    procedure StopCountTimer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor destroy; override;
    procedure DefinirConexao();
    procedure Open;
    procedure ExecSQL;

    function GetData: OleVariant;

    function GetTempoGasto: TDateTime;
    function GetTempoGastoAsString: String;

    procedure DefinirParametro(Nome: String; Tipo: TFieldType; Valor: variant);
    Procedure IniciarTransacao;
    procedure ComitarTransacao;
    procedure DesfazerTransacao;

  published
    property ID: String read FID write FID;
  end;

Type
  TDaoUtil = Class
  public
    class Function ExecuteEscript(Script, StringConnection: string): Boolean;
    class Function ReturmSingleValue(Script, StringConnection: string): variant;

  End;

var
  globalConnection: TConnectionClass;

implementation

{ TFDQueryPlus }

procedure TFDQueryPlus.ComitarTransacao;
begin
  Connection.CommitRetaining;
end;

{ ----------------------------------------------------------------------------- }
constructor TFDQueryPlus.Create(AOwner: TComponent);
var
  Str: String;
begin
  inherited;
  iniTimer := 0;
  fimTimer := 0;

end;

{ ----------------------------------------------------------------------------- }
procedure TFDQueryPlus.DefinirConexao;
begin
  if not Assigned(globalConnection) then
  begin
    globalConnection := TConnectionClass.Create(Nil);
    Connection:=globalConnection;
    Connection.Params.Clear;
    Connection.Params.add('Database=' + _CT_DB_NAME);
    Connection.Params.add('Server=' + _CT_DB_HOST);
    Connection.Params.add('User_Name=' + _CT_DB_USER);
    Connection.Params.add('Password=' + _CT_DB_PASSWORD);
    Connection.Params.add('DriverID=' + _CT_DRIVER);
    Connection.TxOptions.DisconnectAction := xdRollback;
    Connection.TxOptions.AutoCommit := false;
    Connection.TxOptions.Isolation := xiReadCommitted;
    Connection.ResourceOptions.AutoReconnect := true;

  end;
  Connection := globalConnection;

end;

procedure TFDQueryPlus.DefinirParametro(Nome: String; Tipo: TFieldType;
  Valor: variant);
var
  astream: TStringStream;
begin
  ParamByName(Nome).DataType := Tipo;
  if Tipo = ftBlob then
  begin
    astream := TStringStream.Create();
    astream.WriteString(Valor);
    ParamByName(Nome).LoadFromStream(astream, ftBlob);
    astream.Free;

  end
  else
    ParamByName(Nome).Value := Valor;
end;

procedure TFDQueryPlus.DesfazerTransacao;
begin
  Connection.Rollback;
end;

destructor TFDQueryPlus.destroy;
begin
  inherited;
end;

procedure TFDQueryPlus.ExecSQL;
begin
  if not Assigned(Connection) then
    DefinirConexao();
  try
    StartCountTimer;
    inherited ExecSQL;
  finally
    StopCountTimer;
  end;
end;

function TFDQueryPlus.GetData: OleVariant;
var
  dsp: TDataSetProvider;
  cds: TClientDataSet;
begin
  try
    if not Assigned(Connection) then
      DefinirConexao();
    if not self.Active then
      self.Open;

    dsp := TDataSetProvider.Create(nil);
    dsp.DataSet := self;

    cds := TClientDataSet.Create(nil);
    cds.SetProvider(dsp);
    cds.Open;

    Result := cds.Data;
  finally
    FreeAndNil(cds);
    FreeAndNil(dsp);
  end;
end;

function TFDQueryPlus.GetTempoGasto: TDateTime;
begin
  Result := fimTimer - iniTimer;
end;

function TFDQueryPlus.GetTempoGastoAsString: String;
begin
  Result := FormatDateTime('hh:nn:ss.zzz', GetTempoGasto);
end;

procedure TFDQueryPlus.GravarQueryLog(const prefixo: String);
var
  i: Integer;
  s, v: String;
begin

end;

procedure TFDQueryPlus.IniciarTransacao;
begin
  Connection.StartTransaction;
end;

procedure TFDQueryPlus.Open;

begin
  if not Assigned(Connection) then
  begin
    DefinirConexao;
  end;
  try
    StartCountTimer;
    inherited Open;
  finally
    StopCountTimer;
  end;
end;

procedure TFDQueryPlus.StartCountTimer;
begin
  iniTimer := Now;
end;

procedure TFDQueryPlus.StopCountTimer;
begin
  fimTimer := Now;
end;

{ TDaoUtil }

class Function TDaoUtil.ExecuteEscript(Script, StringConnection
  : string): Boolean;

Var
  Comand: TFDCommand;
  Conection: TFDconnection;

  s: string;
begin

  Result := false;
  Comand := TFDCommand.Create(Nil);
  Conection := TFDconnection.Create(Nil);
  try
    Conection.LoginPrompt := false;
    Conection.ConnectionString := StringConnection;

    Comand.Connection := Conection;
    try
      Comand.CommandText.Text := Script;

      Comand.Execute;
      Result := true;

    except
      on e: Exception do
      begin
        s := Script + ' ' + StringConnection;
      end;
    end;
  finally
    FreeAndNil(Comand);
    FreeAndNil(Conection);
  end;

end;

class function TDaoUtil.ReturmSingleValue(Script, StringConnection
  : string): variant;

begin

end;

initialization

finalization

if assigned(globalConnection) then
  FreeAndNil(globalConnection);

end.
