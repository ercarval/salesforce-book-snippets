public class AsyncOrderOutboundService {
    
    public void send ( List<Order> orders ) {

        for (Order order : orders) {
            send( order.Id );   
        }
        
    }
    
    @future (callout=true)
    public static void send ( String orderId ) {
        
        OrderOutboundService service = new OrderOutboundService();
        
        service.sendOrder ( orderId );    
        
    }

}