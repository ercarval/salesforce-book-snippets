public class AsyncOrderOutboundService implements Queueable, Database.AllowsCallouts {

    List<Order> approvedOrders;

    OrderOutboundService service;
    
    public AsyncOrderOutboundService () {
        service = new OrderOutboundService();
    }

    public AsyncOrderOutboundService (List<Order> approvedOrders) {
        
        this();
        this.approvedOrders = approvedOrders;    

    }

    public void execute (QueueableContext context) {
        send(approvedOrders); 
    }                                        
    
    public void send ( List<Order> orders ) {

        for (Order order : orders) {
            service.sendOrder ( order.Id );  
        }
        
    }
    
    @future (callout=true)
    public static void send ( String orderId ) {
        
        OrderOutboundService service = new OrderOutboundService();
        
        service.sendOrder ( orderId );     
        
    }

}