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
        
        RestResponse response = RestContext.response;    
    
        response.statusCode = 200;    
        response.headers.put('Content-Type', 'application/json');
           
        String responsePayload;    
    
        try {
                
            PurchaseOrderInboundResponse purchaseOrderResponse;
    
            purchaseOrderResponse = orderInboundService.save(purchaseOrder);
                        
            responsePayload = purchaseOrderResponse.toJson();
    
        } catch (DmlException e) { 
        
            response.statusCode = 400;
    
            responsePayload = '{ "error" : "' + e.getDmlMessage(0) + '" }';
    
        } catch (Exception e) {
    
            response.statusCode = 400;
    
            responsePayload = '{ "error" : "' + e.getMessage() + '" }';
    
        } finally {
    
            response.responseBody = Blob.valueOf(responsePayload);
            
        }
    
    }

}