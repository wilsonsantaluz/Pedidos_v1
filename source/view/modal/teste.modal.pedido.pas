{ --------------------------------------------------------------------------
  --------------------  By Wilson santa luz 2021 ---------------------------
  Deus eh bom todo o tempo
  ------------------------------------------------------------------------- }
unit teste.modal.pedido;

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
  teste.Classes.pedido, Vcl.ComCtrls;

type
  TFmodalPedidos = class(TForm, iview)
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
    cdsPedidos: TClientDataSet;
    edtdata: TDateTimePicker;
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
    FpedidoClass: TpedidoClass;
    procedure Inicializar;
    procedure Pesquisar;
  public
    { Public declarations }
    property pedidoClass: TpedidoClass read FpedidoClass write FpedidoClass;
    destructor destroy; override;
  end;

var
  FmodalPedidos: TFmodalPedidos;

implementation

{$R *.dfm}

{ TFmodalpedidos }
{ ---------------------------------------------------------------------------- }
procedure TFmodalPedidos.btCancelarClick(Sender: TObject);
begin
  FpedidoClass.Limpar;
  self.Close;
end;

{ ---------------------------------------------------------------------------- }
procedure TFmodalPedidos.btconfirmarClick(Sender: TObject);
begin
  FpedidoClass.Limpar;
  FpedidoClass.Codigo := cdsPedidos.FieldByName('numero').AsInteger;
  FpedidoClass.ClienteNome := cdsPedidos.FieldByName('nome').Asstring;
  FpedidoClass.ClienteCodigo := cdsPedidos.FieldByName('cliente_codigo')
    .AsInteger;
  FpedidoClass.Data := cdsPedidos.FieldByName('data').AsDateTime;
  FpedidoClass.ClienteNome := cdsPedidos.FieldByName('nome').Asstring;
  self.Close;
end;

{ ---------------------------------------------------------------------------- }
procedure TFmodalPedidos.btPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

{ ---------------------------------------------------------------------------- }
procedure TFmodalPedidos.cbCamposChange(Sender: TObject);
begin
  edtPesquisa.clear;
  if cbCampos.ItemIndex = 0 then

    edtPesquisa.NumbersOnly := true
  else
    edtPesquisa.NumbersOnly := false;
  edtdata.Visible := cbCampos.ItemIndex = 1;
  edtPesquisa.Visible := not edtdata.Visible;
end;

{ ---------------------------------------------------------------------------- }
destructor TFmodalPedidos.destroy;
begin
  inherited;
  FreeAndNil(FpedidoClass);
end;

procedure TFmodalPedidos.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (edtPesquisa.Text <> '') then
    Pesquisar();
end;

{ ---------------------------------------------------------------------------- }
procedure TFmodalPedidos.FormShow(Sender: TObject);
begin
  Inicializar;
  edtPesquisa.SetFocus;
end;

{ ---------------------------------------------------------------------------- }
procedure TFmodalPedidos.Inicializar;
begin
  FpedidoClass := TpedidoClass.create(0);

end;

{ ---------------------------------------------------------------------------- }
procedure TFmodalPedidos.Pesquisar;
var
  filtro: string;
  campo: string;
begin
  FpedidoClass.Limpar;
  if (edtPesquisa.Visible = true) and (cbCampos.ItemIndex <> 0) and
    (cbCampos.ItemIndex <> 4) and (Length(edtPesquisa.Text) < 3) then
  begin
    MessageBox(self.Handle, PChar('Pesquisa deve ter no minimo 3 caracteres'),
      'AVISO', MB_YESNOCANCEL + MB_DEFBUTTON3 + MB_ICONWARNING);
    exit;
  end;
  case cbCampos.ItemIndex of
    0:
      campo := 'numero';
    1:
      campo := 'data';
    2:
      campo := 'nome';

    3:
      campo := 'cidade';
    4:
      campo := 'uf';
  end;
  filtro := ' AND ' + campo + ' like  ' +
    QuotedStr('%' + edtPesquisa.Text + '%');

  if campo = 'numero' then
    filtro := ' AND ' + campo + ' =  ' + edtPesquisa.Text;

  if edtdata.Visible then
  begin
    filtro := ' AND date( ' + campo + ') =  ' +
      QuotedStr(FormatDateTime('yyyy-mm-dd', edtdata.Date));
  end;
  cdsPedidos.Data := FpedidoClass.Listapedidos(filtro);
end;

{ ------------------------------------------------------------------------------ }
procedure TFmodalPedidos.gridBuscasDblClick(Sender: TObject);
begin
  if cdsPedidos.RecordCount > 0 then
    btconfirmarClick(btconfirmar);
end;

{ ------------------------------------------------------------------------------ }
procedure TFmodalPedidos.gridBuscasDrawColumnCell(Sender: TObject;
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
