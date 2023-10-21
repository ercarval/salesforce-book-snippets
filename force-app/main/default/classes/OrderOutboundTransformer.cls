public class OrderOutboundTransformer {
    

    public OrderOutboundRequest toOrderOutboundRequest (Order order) {

        return new OrderOutboundRequest();
        
    }

    public Order toOrder ( OrderOutboundResponse response, Order order ) {
        return order;
    }


}