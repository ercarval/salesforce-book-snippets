public class OrderOutboundService {
    
    OrderRepository repository;

    OrderOutboundTransformer transformer;        

    public OrderOutboundService () {
        this.transformer = new OrderOutboundTransformer ();
        this.repository = new OrderRepository();
    }
    
    public void sendOrder ( String orderId ) {
        
        Order order = repository.findById ( orderId );
    
        OrderOutboundResponse response = send ( order );
    
        transformer.toOrder ( response , order);
         
        repository.save ( order );

    }

    private OrderOutboundResponse send ( Order order ) {
        
        OrderOutboundRequest request = transformer.toOrderOutboundRequest ( order );
        
        return send ( request );
    }

    private  OrderOutboundResponse send (OrderOutboundRequest request) {
        return new OrderOutboundResponse ();
    }
    
}