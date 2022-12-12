public class ItemPedido {
    
    private Decimal quantidade;

    private Decimal preco;

    private Decimal precoLiquido;
    
    // construtor omitido

    public Decimal getQuantidade() {
        return this.quantidade;
    } 
    
    public void setQuantidade( Decimal quantidade ) {
        this.quantidade = quantidade;
    }

    public Decimal getPreco() {
        return this.preco;
    } 
    
    public void setPreco( Decimal preco ) {
        this.preco = preco;
    }

    public Decimal getPrecoLiquido() {
        return this.precoLiquido;
    } 
    
    public void setPrecoLiquido( Decimal precoLiquido ) {
        this.precoLiquido = precoLiquido;
    }

    public Decimal getTotal() {
        return this.preco * this.quantidade;
    }

    public Decimal getTotalLiquido() {
        return this.precoLiquido * this.quantidade;
    }

}