/**
 * @author eduardo.bisso
 */
public class Pedido {
    
    private Decimal total;

    private Decimal totalLiquido;

    private List<ItemPedido> items;

    String tipoPedido;
    
    // construtor omitido

    public void adicionarItem ( ItemPedido item ) {
    
        this.items.add(item);

        this.total += item.getTotal();
        this.totalLiquido += item.getTotalLiquido();

    }

    public Decimal getTotal () {
        return this.total;   
    }
    
    public Decimal getTotalLiquido () {
        return this.totalLiquido;   
    }


    public Decimal calculaValorTaxa () {
            
        if (tipoPedido == 'SERVIÇO') {
            return 0.2;
        } else if ( tipoPedido == 'VENDA PADRÃO' ) {
            return 0.1;
        } 
    
        return 0;
        
    }

}
