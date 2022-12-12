/**
 * @author eduardo.bisso
 */
public class Pedido {
    
    private Decimal total;

    private Decimal totalLiquido;

    private List<ItemPedido> items;
    
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


}
