/**
 * @author eduardo.bisso
 */
public class Pedido {
    
    public Decimal total;

    public Decimal totalLiquido;

    public List<ItemPedido> items;
    
    // construtor omitido

    public void adicionarItem ( ItemPedido item ) {
    
        this.items.add(item);

        this.total += item.total;
        this.totalLiquido += item.totalLiquido;

    }    
    
}