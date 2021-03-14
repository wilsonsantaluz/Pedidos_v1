{ --------------------------------------------------------------------------
  ---------- Made with love By Wilson santa luz 2021 -----------------------

  Deus eh bom todo o tempo

  ------------------------------------------------------------------------- }
unit teste.view.pedido;

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
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Data.DB,
  Vcl.Grids,
  Pngimage,
  Vcl.DBGrids,
  // --------------------------//
  teste.model.pedido,
  teste.Classes.produto,
  teste.Classes.cliente,
  teste.lib.util,
  teste.interfaces.mvc,
  teste.modal.produto,
  teste.modal.pedido,
  teste.modal.cliente,
  teste.dao.produto,
  teste.dao.cliente,
  teste.controller.pedido,
  Vcl.ComCtrls,
  FireDAC.Phys.MySQLDef,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  FireDAC.Phys.MySQL;

type
  Tfpedido = class(TForm, IView)
    pnRodape: TPanel;
    dtsPedido: TDataSource;
    GroupBox2: TGroupBox;
    lblNumero: TLabel;
    edtNumeroPedido: TEdit;
    edtCliente: TEdit;
    btBuscaCliente: TSpeedButton;
    gpbItens: TGroupBox;
    gridInutilizacoes: TDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtQtItens: TEdit;
    Label2: TLabel;
    edtVlrTotal: TEdit;
    btnovo: TSpeedButton;
    btgravar: TSpeedButton;
    btExcluir: TSpeedButton;
    gpbInserir: TGroupBox;
    Panel1: TPanel;
    edtBuscaProduto: TEdit;
    Label4: TLabel;
    btPesquisarProduto: TSpeedButton;
    edtQuantidade: TEdit;
    Label6: TLabel;
    Panel2: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    edtdata: TDateTimePicker;
    btCancelar: TSpeedButton;
    edtValorUn: TEdit;
    Label3: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtTotal: TEdit;
    Label10: TLabel;
    olink: TFDPhysMySQLDriverLink;
    edtNomeCliente: TEdit;
    Label11: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    edtDescricaoProduto: TEdit;
    btInserirProduto: TBitBtn;
    btPesquisarPedido: TSpeedButton;
    Panel5: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    imglogo: TImage;
    procedure FormShow(Sender: TObject);
    procedure edtNumeroPedidoKeyPress(Sender: TObject; var Key: Char);
    procedure edtNumeroPedidoExit(Sender: TObject);
    procedure btnovoClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btInserirProdutoClick(Sender: TObject);
    procedure gridInutilizacoesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorUnExit(Sender: TObject);
    procedure edtValorUnChange(Sender: TObject);
    procedure btPesquisarProdutoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gridInutilizacoesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btgravarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure edtClienteChange(Sender: TObject);
    procedure btBuscaClienteClick(Sender: TObject);
    procedure edtBuscaProdutoExit(Sender: TObject);
    procedure edtClienteExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtClienteKeyPress(Sender: TObject; var Key: Char);
    procedure edtBuscaProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure btPesquisarPedidoClick(Sender: TObject);
  private
    { Private declarations }
    FpedidoAlterado: Boolean;
    FController: IControllerPedido;
    Ffiltro: TModelPedidoFiltro;
    procedure Inicializar;
    procedure LimparFiltro;
    procedure BuscaPedido(numero: Integer);
    procedure BuscaProduto(codigo: Integer);
    procedure BuscaCliente(codigo: Integer);
    procedure LimparTela();
    procedure SerializarPedido();
    procedure desserializarPedido();
    procedure SetarTela();
    procedure LimparInsercao();
    procedure HandleBuscapedido(value: Boolean);
    procedure HandleDadosPedido(value: Boolean);
    procedure HandleInserirItens(value: Boolean);

  public
    { Public declarations }
    property controller: IControllerPedido read FController write FController;
  end;

var
  fpedido: Tfpedido;

implementation

{$R *.dfm}

{ Tfpedido }
{ ----------------------------------------------------------------------------- }
procedure Tfpedido.btBuscaClienteClick(Sender: TObject);
begin
  FmodalClientes := TFmodalClientes.Create(nil);
  try
    FmodalClientes.showmodal;
    if FmodalClientes.clienteClass.codigo > 0 then
    begin
      edtCliente.Text := inttostr(FmodalClientes.clienteClass.codigo);
      edtNomeCliente.Text := FmodalClientes.clienteClass.nome;
    end
    else
    begin
      edtCliente.Text := '';
      edtNomeCliente.Text := '';
    end;
  finally
    FreeAndNil(FmodalClientes);
  end;
end;

{ ----------------------------------------------------------------------------- }
procedure Tfpedido.btCancelarClick(Sender: TObject);
begin
  if FpedidoAlterado then
  begin
    if MessageBox(self.Handle,
      PChar('Os dados foram alterados cancelar alterações ?'), 'AVISO',
      MB_YESNOCANCEL + MB_DEFBUTTON3 + MB_ICONWARNING) <> ID_YES then
    begin
      exit;
    end;
  end;
  LimparTela();
end;

{ ----------------------------------------------------------------------------- }
procedure Tfpedido.btExcluirClick(Sender: TObject);
begin
  if MessageBox(self.Handle, PChar('Confirma a exclusao do pedido ?'), 'AVISO',
    MB_YESNOCANCEL + MB_DEFBUTTON3 + MB_ICONWARNING) <> ID_YES then
  begin
    exit;
  end;
  controller.ExcluirPedido;
  LimparTela;
end;

{ ----------------------------------------------------------------------------- }
procedure Tfpedido.btgravarClick(Sender: TObject);
begin
  if FpedidoAlterado then
  begin
    SerializarPedido();
    controller.GravarPedido;
    desserializarPedido();
    FpedidoAlterado := false;
    MessageBox(self.Handle, PChar('Pedido foi gravado com sucesso'), 'Sucesso',
      MB_OK + MB_DEFBUTTON3 + MB_ICONINFORMATION);
    btgravar.Enabled := false;
  end;
end;

{ ----------------------------------------------------------------------------- }
procedure Tfpedido.btInserirProdutoClick(Sender: TObject);
begin
  if not Tutil.isvalInteger(edtBuscaProduto.Text) then
    raise Exception.Create('Código de produto invalido');

  if not Tutil.isvalInteger(edtQuantidade.Text) then
    raise Exception.Create('Quantidade invalida');

  if not Tutil.isvalFloat(edtValorUn.Text) then
    raise Exception.Create('Valor unitario invalido');

  if StrToInt(edtBuscaProduto.Text) = 0 then
    raise Exception.Create('Código de produto invalido');

  if StrToInt(edtQuantidade.Text) = 0 then
    raise Exception.Create('Quantidade deve ser maior que zero');

  if StrTofloat(edtValorUn.Text) = 0 then
    raise Exception.Create('Valor unitario deve ser maior que zero');
  FpedidoAlterado := true;
  btgravar.Enabled := true;
  btExcluir.Enabled := true;
  // definir o item ativo no model como zero caso estja inserindo
  if btInserirProduto.Caption = 'Inserir F3' then
    controller.model.activeItem.codigo := 0;
  controller.model.activeItem.CodigoProduto := StrToInt(edtBuscaProduto.Text);
  controller.model.activeItem.Quantidade := StrToInt(edtQuantidade.Text);
  controller.model.activeItem.DescricaoProduto := edtDescricaoProduto.Text;
  controller.model.activeItem.ValorUnitario := StrTofloat(edtValorUn.Text);
  controller.model.activeItem.ValorTotal := StrTofloat(edtVlrTotal.Text);
  controller.setItemPedido;
  edtQtItens.Text := inttostr(controller.model.pedidoClass.Itens.Count);
  edtVlrTotal.Text := floattostr(controller.model.pedidoClass.Total);
  LimparInsercao;
  btInserirProduto.Caption := 'Inserir F3';
  HandleInserirItens(true);
  edtBuscaProduto.SetFocus;
end;

{ ----------------------------------------------------------------------------- }
procedure Tfpedido.btnovoClick(Sender: TObject);
begin
  LimparTela;
  edtNumeroPedido.Text := '';
  edtNumeroPedido.Enabled := false;
  gpbInserir.Visible := true;
  FController.IniciarPedido();
  btnovo.Enabled := false;
  btCancelar.Enabled := true;
  edtdata.datetime := (now);
  HandleBuscapedido(false);
  HandleDadosPedido(true);
  HandleInserirItens(true);
  if edtdata.Enabled then
    edtdata.SetFocus;
end;

{ ----------------------------------------------------------------------------- }
procedure Tfpedido.btPesquisarPedidoClick(Sender: TObject);
begin
  FmodalPedidos := TFmodalPedidos.Create(nil);
  LimparTela();
  try
    FmodalPedidos.showmodal;
    if FmodalPedidos.pedidoClass.codigo > 0 then
    begin
      controller.SetPedido(FmodalPedidos.pedidoClass.codigo);
      SetarTela();

    end;
  finally
    FreeAndNil(FmodalPedidos);
  end;

end;
{ ----------------------------------------------------------------------------- }
procedure Tfpedido.btPesquisarProdutoClick(Sender: TObject);
begin
  FmodalProdutos := TFmodalProdutos.Create(nil);
  try
    FmodalProdutos.showmodal;
    if FmodalProdutos.produtoClass.codigo > 0 then
    begin
      edtBuscaProduto.Text := inttostr(FmodalProdutos.produtoClass.codigo);
      edtValorUn.Text := floattostr(FmodalProdutos.produtoClass.Preco);
      edtQuantidade.Text := '1';
      edtDescricaoProduto.Text := FmodalProdutos.produtoClass.Descricao;
      btInserirProduto.Enabled := true;
      edtValorUn.SetFocus;
    end
    else
    begin
      edtValorUn.Text := '0';
      edtBuscaProduto.Text := '';
      btInserirProduto.Enabled := false;
      edtDescricaoProduto.Text := '';
      edtQuantidade.Text := '0';
    end;
  finally
    FreeAndNil(FmodalProdutos);
  end;

end;

{ ----------------------------------------------------------------------------- }
procedure Tfpedido.BuscaCliente(codigo: Integer);
var
  FclienteClass: TclienteClass;
begin
  FclienteClass := TclienteClass.Create(codigo);
  try
    if FclienteClass.codigo > 0 then
    begin
      edtCliente.Text := inttostr(FclienteClass.codigo);
      edtNomeCliente.Text := FclienteClass.nome;

      if (gpbItens.Visible) and (edtBuscaProduto.Enabled) then
        edtBuscaProduto.SetFocus;
    end
    else
    begin
      edtCliente.Text := '';
      edtNomeCliente.Text := '';
      MessageBox(self.Handle, PChar('Codigo de cliente não encontrado'),
        'AVISO', MB_OK + MB_DEFBUTTON3 + MB_ICONWARNING);
    end;
  finally
    FreeAndNil(FclienteClass);
  end;
end;

{ ----------------------------------------------------------------------------- }
procedure Tfpedido.BuscaPedido(numero: Integer);
begin
  LimparTela();
  controller.SetPedido(numero);
  if controller.model.pedidoClass.codigo > 0 then
  begin
    SetarTela();
  end
  else
    MessageBox(self.Handle, PChar('Numero de pedido não encontrado'), 'AVISO',
      MB_OK + MB_DEFBUTTON3 + MB_ICONWARNING);
end;

{ ----------------------------------------------------------------------------- }
procedure Tfpedido.BuscaProduto(codigo: Integer);
var
  FprodutoClass: TprodutoClass;
begin
  FprodutoClass := TprodutoClass.Create(codigo);
  try
    if FprodutoClass.codigo > 0 then
    begin
      edtBuscaProduto.Text := inttostr(FprodutoClass.codigo);
      edtValorUn.Text := floattostr(FprodutoClass.Preco);
      edtQuantidade.Text := '1';
      edtDescricaoProduto.Text := FprodutoClass.Descricao;
      btInserirProduto.Enabled := true;
      if edtValorUn.Enabled then
        edtValorUn.SetFocus;

    end
    else
    begin
      edtValorUn.Text := '0';
      edtBuscaProduto.Text := '';
      btInserirProduto.Enabled := false;
      edtDescricaoProduto.Text := '';
      edtQuantidade.Text := '0';
      MessageBox(self.Handle, PChar('Codigo de produto não econtrado'), 'AVISO',
        MB_OK + MB_DEFBUTTON3 + MB_ICONWARNING);
    end;
  finally
    FreeAndNil(FprodutoClass);
  end;
end;

{ ----------------------------------------------------------------------------- }
procedure Tfpedido.edtBuscaProdutoExit(Sender: TObject);
begin
  if (Sender = edtBuscaProduto) and (TEdit(Sender).Modified) and
    (TEdit(Sender).Text <> '') then
    BuscaProduto(StrToInt(TEdit(Sender).Text));

end;

{ ----------------------------------------------------------------------------- }
procedure Tfpedido.edtBuscaProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (TEdit(Sender).Text <> '') then
    BuscaProduto(StrToInt(TEdit(Sender).Text));
end;

{ ----------------------------------------------------------------------------- }
procedure Tfpedido.edtClienteChange(Sender: TObject);
begin
  if (edtCliente.Text <> '') and (edtCliente.Modified) then
    FpedidoAlterado := true;
end;

{ ----------------------------------------------------------------------------- }
procedure Tfpedido.edtClienteExit(Sender: TObject);
begin
  if (Sender = edtCliente) and (TEdit(Sender).Modified) and
    (TEdit(Sender).Text <> '') then
    BuscaCliente(StrToInt(TEdit(Sender).Text));
end;

{ ----------------------------------------------------------------------------- }
procedure Tfpedido.edtClienteKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (TEdit(Sender).Text <> '') then

    BuscaCliente(StrToInt(TEdit(Sender).Text));

end;

{ ----------------------------------------------------------------------------- }
procedure Tfpedido.edtNumeroPedidoExit(Sender: TObject);
begin
  if (Sender = edtNumeroPedido) and (TEdit(Sender).Modified) and
    (TEdit(Sender).Text <> '') then
    BuscaPedido(StrToInt(TEdit(Sender).Text));

end;

{ ----------------------------------------------------------------------------- }
procedure Tfpedido.edtNumeroPedidoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (TEdit(Sender).Text <> '') then
    BuscaPedido(StrToInt(TEdit(Sender).Text));

end;

{ ----------------------------------------------------------------------------- }
procedure Tfpedido.edtValorUnChange(Sender: TObject);
begin
  if (Tutil.isvalFloat(edtValorUn.Text)) and
    (Tutil.isvalInteger(edtQuantidade.Text)) then
    edtTotal.Text := floattostr(StrToInt(edtQuantidade.Text) *
      StrTofloat(edtValorUn.Text));
end;

{ ----------------------------------------------------------------------------- }
procedure Tfpedido.edtValorUnExit(Sender: TObject);
begin

end;

{ ----------------------------------------------------------------------------- }
procedure Tfpedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F3) and (btInserirProduto.Enabled) then
    btInserirProduto.Click;

end;

{ ----------------------------------------------------------------------------- }
procedure Tfpedido.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Perform(wm_NextDlgCtl, 0, 0);
  end;
end;

{ ----------------------------------------------------------------------------- }
procedure Tfpedido.FormShow(Sender: TObject);
begin
  self.DoubleBuffered := true;
  Inicializar();
end;

{ ----------------------------------------------------------------------------- }
procedure Tfpedido.gridInutilizacoesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not(gdSelected in State) then
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
end;

{ ----------------------------------------------------------------------------- }
procedure Tfpedido.gridInutilizacoesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 46) then
  begin
    if MessageBox(self.Handle, PChar('A T E N Ç Ã O'#13#10#13#10 +
      'Confirma  a exclusao do item  ?'), 'AVISO',
      MB_YESNOCANCEL + MB_DEFBUTTON3 + MB_ICONWARNING) = ID_YES then
    begin
      controller.ExcluirItem;
      edtQtItens.Text := inttostr(controller.model.pedidoClass.Itens.Count);
      edtVlrTotal.Text := floattostr(controller.model.pedidoClass.Total);
    end;
  end;
  if (Key = VK_RETURN) then
  begin
    // esta editando produto então não deve alterar o codigo
    // se for pra mudar apaga e insere outro

    edtBuscaProduto.Enabled := false;
    btPesquisarProduto.Enabled := false;
    btInserirProduto.Caption := 'Atualizar F3';
    controller.model.activeItem.codigo := dtsPedido.dataset.FieldByName
      ('codigo').AsInteger;
    edtBuscaProduto.Text := dtsPedido.dataset.FieldByName
      ('produto_codigo').Asstring;
    edtQuantidade.Text := dtsPedido.dataset.FieldByName('quantidade').Asstring;
    edtDescricaoProduto.Text := dtsPedido.dataset.FieldByName
      ('descricao').Asstring;
    edtValorUn.Text :=
      floattostr(dtsPedido.dataset.FieldByName('valor_unitario').Asfloat);
    edtTotal.Text :=
      floattostr(dtsPedido.dataset.FieldByName('valor_total').Asfloat);
  end;

end;
{ ----------------------------------------------------------------------------- }
procedure Tfpedido.HandleBuscapedido(value: Boolean);
begin
  edtNumeroPedido.Enabled := value;
  btPesquisarPedido.Enabled := value;
  edtNumeroPedido.Text := '';
end;

procedure Tfpedido.HandleDadosPedido(value: Boolean);
begin
  edtdata.Enabled := value;
  edtCliente.Enabled := value;
  btBuscaCliente.Enabled := value;
  edtCliente.Text := '';
end;

procedure Tfpedido.HandleInserirItens(value: Boolean);
begin
  edtBuscaProduto.Enabled := value;
  btPesquisarProduto.Enabled := value;
  btInserirProduto.Enabled := value;
end;

{ ----------------------------------------------------------------------------- }
procedure Tfpedido.Inicializar;
var
  FModel: TModelPedido;
begin
  controller := TControllerPedido.Create;
  try
    FModel := TModelPedido.Create;
    controller.model := FModel;
    controller.view := self;
    controller.Inicializar;
    dtsPedido.dataset := controller.model.cdsPedido;
    LimparTela();
    if FileExists(ExtractFilePath(GetModuleName(HInstance)) + 'logo.png') then
      imglogo.picture.loadfromfile(ExtractFilePath(GetModuleName(HInstance)) +
        'logo.png')
  finally
  end;
end;

{ ----------------------------------------------------------------------------- }
procedure Tfpedido.LimparFiltro;
begin
  Ffiltro.numero := 0;
  Ffiltro.cliente := 0;
  Ffiltro.Data := 0;
end;

procedure Tfpedido.LimparInsercao;
begin
  edtBuscaProduto.Text := '';
  edtQuantidade.Text := '';
  edtDescricaoProduto.Text := '';
  edtValorUn.Text := '';
  edtTotal.Text := '';
end;

{ ----------------------------------------------------------------------------- }
procedure Tfpedido.LimparTela;
begin
  controller.model.cdsPedido.EmptyDataSet;
  edtNumeroPedido.Clear;
  edtCliente.Clear;
  edtNomeCliente.Text := '';
  edtQtItens.Text := '0';
  edtVlrTotal.Text := '0';
  edtdata.datetime := now;
  btInserirProduto.Caption := 'Inserir F3';

  btCancelar.Enabled := false;
  btnovo.Enabled := true;
  gpbInserir.Visible := false;
  btInserirProduto.Enabled := false;
  edtDescricaoProduto.Text := '';
  btgravar.Enabled := false;
  btExcluir.Enabled := false;

  HandleDadosPedido(false);
  HandleBuscapedido(true);
  LimparInsercao();
  FpedidoAlterado := false;

end;

{ ----------------------------------------------------------------------------- }
procedure Tfpedido.SerializarPedido;
begin
  if edtCliente.Text = '' then
  begin
    MessageBox(self.Handle, PChar('O Pedido nao pode ser salvo sem um cliente'),
      'AVISO', MB_OK + MB_DEFBUTTON3 + MB_ICONWARNING);

    exit;

  end;
  if controller.model.pedidoClass.Itens.Count = 0 then
  begin
    MessageBox(self.Handle, PChar('O Pedido nao pode sem itens '), 'AVISO',
      MB_OK + MB_DEFBUTTON3 + MB_ICONWARNING);
    exit;
  end;
  // Valdiçoes data do pedido... etc etc... TO DO latter
  controller.model.pedidoClass.ClienteCodigo := StrToInt(edtCliente.Text);
  controller.model.pedidoClass.ClienteNome := edtNomeCliente.Text;
  controller.model.pedidoClass.Data := edtdata.datetime;
end;

{ ------------------------------------------------------------------------------ }
procedure Tfpedido.desserializarPedido;
begin
  edtCliente.Text := inttostr(controller.model.pedidoClass.ClienteCodigo);
  edtNomeCliente.Text := controller.model.pedidoClass.ClienteNome;
  edtdata.datetime := controller.model.pedidoClass.Data;
  edtQtItens.Text := inttostr(controller.model.pedidoClass.Itens.Count);
  edtVlrTotal.Text := floattostr(controller.model.pedidoClass.Total);
  edtNumeroPedido.Text := inttostr(controller.model.pedidoClass.codigo);

end;

{ ------------------------------------------------------------------------------ }
procedure Tfpedido.SetarTela;
begin

  gpbInserir.Visible := true;
  btgravar.Enabled := true;
  btExcluir.Enabled := true;
  btCancelar.Enabled := true;
  btInserirProduto.Enabled := false;
  btnovo.Enabled := false;
  FpedidoAlterado := false;
  btExcluir.Enabled := true;
  btInserirProduto.Caption := 'Inserir F3';
  HandleDadosPedido(true);
  btInserirProduto.Enabled := true;
  btPesquisarProduto.Enabled := true;
  // finalmente carregar os dados da classe
  desserializarPedido();
  HandleBuscapedido(false);

end;

end.
