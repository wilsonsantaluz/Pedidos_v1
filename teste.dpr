program teste;

uses
  midaslib,
  Vcl.Forms,
  teste.view.pedido in 'source\view\teste.view.pedido.pas' {fpedido},
  teste.dao.pedido in 'source\dao\teste.dao.pedido.pas',
  teste.interfaces.mvc in 'source\interface\teste.interfaces.mvc.pas',
  teste.model.pedido in 'source\model\teste.model.pedido.pas',
  teste.controller.pedido in 'source\controller\teste.controller.pedido.pas',
  teste.dao.objects in 'source\dao\teste.dao.objects.pas',
  teste.lib.constantes in 'source\lib\teste.lib.constantes.pas',
  teste.classes.pedido in 'source\classes\teste.classes.pedido.pas',
  teste.lib.util in 'source\lib\teste.lib.util.pas',
  teste.classes.produto in 'source\classes\teste.classes.produto.pas',
  teste.dao.produto in 'source\dao\teste.dao.produto.pas',
  teste.dao.cliente in 'source\dao\teste.dao.cliente.pas',
  teste.classes.cliente in 'source\classes\teste.classes.cliente.pas',
  teste.modal.pedido in 'source\view\modal\teste.modal.pedido.pas' {FmodalPedidos},
  teste.modal.produto in 'source\view\modal\teste.modal.produto.pas' {FmodalProdutos},
  teste.modal.cliente in 'source\view\modal\teste.modal.cliente.pas' {FmodalClientes},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfpedido, fpedido);
  ;
  Application.Run;
end.
