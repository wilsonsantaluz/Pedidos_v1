{ --------------------------------------------------------------------------
  --------------------  By Wilson santa luz 2021 ---------------------------
  Deus eh bom todo o tempo
  ------------------------------------------------------------------------- }
unit teste.modal.produto;

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
  teste.Classes.produto;

type
  TFmodalProdutos = class(TForm, iview)
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
    dtsProdutos: TDataSource;
    cdsProdutos: TClientDataSet;
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
    FprodutoClass: TprodutoClass;
    procedure Inicializar;
    procedure Pesquisar;
  public
    { Public declarations }
    property produtoClass: TprodutoClass read FprodutoClass write FprodutoClass;
    destructor destroy; override;
  end;

var
  FmodalProdutos: TFmodalProdutos;

implementation

{$R *.dfm}

{ TFmodalProdutos }
{ ---------------------------------------------------------------------------- }
procedure TFmodalProdutos.btCancelarClick(Sender: TObject);
begin
  FprodutoClass.Limpar;
  self.Close;
end;

{ ---------------------------------------------------------------------------- }
procedure TFmodalProdutos.btconfirmarClick(Sender: TObject);
begin
  FprodutoClass.Limpar;
  FprodutoClass.Codigo := cdsProdutos.FieldByName('codigo').AsInteger;
  FprodutoClass.descricao := cdsProdutos.FieldByName('descricao').AsString;
  FprodutoClass.preco := cdsProdutos.FieldByName('preco').AsFloat;
  self.Close;

end;

procedure TFmodalProdutos.btPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

{ ---------------------------------------------------------------------------- }
procedure TFmodalProdutos.cbCamposChange(Sender: TObject);
begin
  edtPesquisa.clear;
  if cbCampos.ItemIndex = 1 then
    edtPesquisa.NumbersOnly := true
  else
    edtPesquisa.NumbersOnly := false
end;

{ ---------------------------------------------------------------------------- }
destructor TFmodalProdutos.destroy;
begin
  inherited;
  FreeAndNil(FprodutoClass);
end;

procedure TFmodalProdutos.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (edtPesquisa.Text <> '') then
    Pesquisar();
end;

procedure TFmodalProdutos.FormShow(Sender: TObject);
begin
  Inicializar;
  edtPesquisa.SetFocus;
end;

{ ---------------------------------------------------------------------------- }
procedure TFmodalProdutos.Inicializar;
begin
  FprodutoClass := TprodutoClass.create(0);

end;

{ ---------------------------------------------------------------------------- }
procedure TFmodalProdutos.Pesquisar;
var
  filtro: string;
  campo: string;
begin
  FprodutoClass.Limpar;
  case cbCampos.ItemIndex of
    0:
      begin
        campo := 'descricao';
        if Length(edtPesquisa.Text) < 3 then
        begin
          MessageBox(self.Handle,
            PChar('Pesquisa deve ter no minimo 3 caracteres'), 'AVISO',
            MB_YESNOCANCEL + MB_DEFBUTTON3 + MB_ICONWARNING);
          exit;
        end;
        filtro := ' AND ' + campo + ' like  ' +
          QuotedStr('%' + edtPesquisa.Text + '%');
      end;
    1:
      begin
        campo := 'preco';
        filtro := ' AND ' + campo + ' = ' + edtPesquisa.Text;

      end;

  end;
  cdsProdutos.Data := FprodutoClass.ListaProdutos(filtro);
end;

{ ------------------------------------------------------------------------------ }
procedure TFmodalProdutos.gridBuscasDblClick(Sender: TObject);
begin
  if cdsProdutos.RecordCount > 0 then
    btconfirmarClick(btconfirmar);
end;

{ ------------------------------------------------------------------------------ }
procedure TFmodalProdutos.gridBuscasDrawColumnCell(Sender: TObject;
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
