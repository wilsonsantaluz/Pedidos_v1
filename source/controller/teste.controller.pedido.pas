unit teste.controller.pedido;

interface

uses Windows, Classes, teste.interfaces.mvc, teste.model.pedido,
  teste.Classes.pedido;

type
  IControllerPedido = interface(IController)
    ['{78DC07EE-1F4D-4865-BA54-6C16C98F1D1E}']
    procedure Inicializar;
    procedure Refresh;
    procedure GravarPedido;
    procedure IniciarPedido;
    Procedure ExcluirPedido;
    procedure setItemPedido;
    procedure ExcluirItem;
    procedure SetPedido(numero: integer);

    procedure Filtrar(const Filtros: TModelPedidoFiltro);

    procedure setView(const value: IView);
    function getView: IView;
    procedure setModel(const value: IModelPedido);
    function getModel: IModelPedido;

    property View: IView read getView write setView;

    property model: IModelPedido read getModel write setModel;
  end;

  TControllerPedido = class(TInterfacedObject, IControllerPedido)
  private
    FModel: IModelPedido;
    FView: IView;
  protected
    procedure setView(const value: IView);
    function getView: IView;
    procedure setModel(const value: IModelPedido);
    function getModel: IModelPedido;
  public
    procedure Inicializar;
    procedure Refresh;
    procedure GravarPedido;
    procedure IniciarPedido;
    Procedure ExcluirPedido;
    procedure setItemPedido;
    procedure ExcluirItem;
    procedure SetPedido(numero: integer);

    procedure Filtrar(const Filtros: TModelPedidoFiltro);

    property View: IView read getView write setView;
    property model: IModelPedido read getModel write setModel;
  end;

implementation

{ TControllerPedido }

procedure TControllerPedido.ExcluirItem;
begin
  FModel.ExcluirItem;
end;

procedure TControllerPedido.ExcluirPedido;
begin
  FModel.ExcluirPedido;
end;

procedure TControllerPedido.Filtrar(const Filtros: TModelPedidoFiltro);
begin
  FModel.FiltrarPedido(Filtros);
end;

function TControllerPedido.getModel: IModelPedido;
begin
  Result := FModel;
end;

function TControllerPedido.getView: IView;
begin
  Result := FView;
end;

procedure TControllerPedido.GravarPedido;
begin
  FModel.GravarPedido;
end;

procedure TControllerPedido.Inicializar;
begin
  FModel.Inicializar;
end;

procedure TControllerPedido.IniciarPedido;
begin
  FModel.IniciarPedido
end;

procedure TControllerPedido.setItemPedido;
begin
  FModel.setItemPedido;
end;

procedure TControllerPedido.Refresh;
begin
  FModel.Refresh;
end;

procedure TControllerPedido.setModel(const value: IModelPedido);
begin
  FModel := value;
end;

procedure TControllerPedido.SetPedido(numero: integer);
begin
  FModel.SetPedido(numero);
end;

procedure TControllerPedido.setView(const value: IView);
begin
  FView := value;
end;

end.
