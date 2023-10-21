/**
 * @author: eduardo.bisso
 */
@RestResource (urlMapping='/api/orders/*')
global class OrderController {

       
    public static OrderInboundService orderInboundService;

    static {
        orderInboundService = new OrderInboundService();
    }

    @HttpPost
    global static PurchaseOrderInboundResponse create ( 
                PurchaseOrderInboundRequest purchaseOrder ) {
        
        return orderInboundService.save(purchaseOrder);

    }
    

}