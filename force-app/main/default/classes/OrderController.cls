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
    global static void create ( PurchaseOrderInboundRequest purchaseOrder ) {
        
        RestResponseBuilder responseBuilder = new RestResponseBuilder(RestContext.response);    

        try {
                
            PurchaseOrderInboundResponse purchaseOrderResponse = orderInboundService.save(purchaseOrder);
                        
            responseBuilder.withBody(purchaseOrderResponse);

        } catch (DmlException e) { 
            
            responseBuilder.withError(e);
            
        } catch (Exception e) {

            responseBuilder.withError(e);

        }

    }

}