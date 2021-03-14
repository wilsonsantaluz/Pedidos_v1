{ --------------------------------------------------------------------------
  --------------------  By Wilson santa luz 2021 ---------------------------
  Deus eh bom todo o tempo
  ------------------------------------------------------------------------- }
unit teste.modal.cliente;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  teste.interfaces.mvc,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Data.DB,
  Vcl.Buttons,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Datasnap.DBClient,
  teste.Classes.cliente;

type
  TFmodalClientes = class(TForm, iview)
    Panel1: TPanel;
    Panel2: TPanel;
    gridBuscas: TDBGrid;
    btCancelar: TSpeedButton;
    btconfirmar: TSpeedButton;
    cbCampos: TComboBox;
    Label1: TLabel;
    edtPesquisa: TEdit;
    Label2: TLabel;
    btPesquisar: TSpeedButton;
    dtsClientes: TDataSource;
    cdsClientes: TClientDataSet;
    procedure btconfirmarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure gridBuscasDblClick(Sender: TObject);
    procedure cbCamposChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure gridBuscasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    FclienteClass: TclienteClass;
    procedure Inicializar;
    procedure Pesquisar;
  public
    { Public declarations }
    property clienteClass: TclienteClass read FclienteClass write FclienteClass;
    destructor destroy; override;
  end;

var
  FmodalClientes: TFmodalClientes;

implementation

{$R *.dfm}

{ TFmodalclientes }
{ ---------------------------------------------------------------------------- }
procedure TFmodalClientes.btCancelarClick(Sender: TObject);
begin
  FclienteClass.Limpar;
  self.Close;
end;

{ ---------------------------------------------------------------------------- }
procedure TFmodalClientes.btconfirmarClick(Sender: TObject);
begin
  FclienteClass.Limpar;
  FclienteClass.Codigo := cdsClientes.FieldByName('codigo').AsInteger;
  FclienteClass.nome := cdsClientes.FieldByName('nome').AsString;
  FclienteClass.uf := cdsClientes.FieldByName('uf').AsString;
  FclienteClass.cidade := cdsClientes.FieldByName('cidade').AsString;
  self.Close;

end;

procedure TFmodalClientes.btPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

{ ---------------------------------------------------------------------------- }
procedure TFmodalClientes.cbCamposChange(Sender: TObject);
begin
  edtPesquisa.clear;
 
end;

{ ---------------------------------------------------------------------------- }
destructor TFmodalClientes.destroy;
begin
  inherited;
  FreeAndNil(FclienteClass);
end;

procedure TFmodalClientes.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (edtPesquisa.Text <> '') then
    Pesquisar();
end;

procedure TFmodalClientes.FormShow(Sender: TObject);
begin
  Inicializar;
  edtPesquisa.SetFocus;
end;

{ ---------------------------------------------------------------------------- }
procedure TFmodalClientes.Inicializar;
begin
  FclienteClass := TclienteClass.create(0);

end;

{ ---------------------------------------------------------------------------- }
procedure TFmodalClientes.Pesquisar;
var
  filtro: string;
  campo: string;
begin
  FclienteClass.Limpar;
  if Length(edtPesquisa.Text) < 3 then
  begin
    MessageBox(self.Handle, PChar('Pesquisa deve ter no minimo 3 caracteres'),
      'AVISO', MB_YESNOCANCEL + MB_DEFBUTTON3 + MB_ICONWARNING);
    exit;
  end;
  case cbCampos.ItemIndex of
    0:
      campo := 'nome';
    1:
      campo := 'cidade';
    2:
      campo := 'uf';

  end;
  filtro := ' AND ' + campo + ' like  ' +
    QuotedStr('%' + edtPesquisa.Text + '%');
  cdsClientes.Data := FclienteClass.Listaclientes(filtro);
end;

{ ------------------------------------------------------------------------------ }
procedure TFmodalClientes.gridBuscasDblClick(Sender: TObject);
begin
  if cdsClientes.RecordCount > 0 then
    btconfirmarClick(btconfirmar);
end;

{ ------------------------------------------------------------------------------ }
procedure TFmodalClientes.gridBuscasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with TDBGrid(Sender) do
  begin
    if odd(DataSource.dataset.RecNo) then
    begin
      Canvas.Font.Color := clNavy;
      Canvas.Brush.Color := $00DFFFDF;
    end
    else
    begin
      Canvas.Font.Color := clBlack;
      Canvas.Brush.Color := clWhite;
    end;
    Canvas.FillRect(Rect);
    if assigned(Column.Field) then
      DefaultDrawDataCell(Rect, Columns[DataCol].Field, State)
  end;
end;

{ ------------------------------------------------------------------------------ }
end.
