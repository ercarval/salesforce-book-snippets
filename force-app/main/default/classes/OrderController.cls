/**
 * @author: eduardo.bisso
 */
@RestResource (urlMapping='/api/orders/*')
global class OrderController {

    @HttpPost
    global static PurchaseOrderInboundResponse create ( PurchaseOrderInboundRequest purchaseOrder ) {
        
        PurchaseOrderInboundTransformer transformer = new PurchaseOrderInboundTransformer();

        Order order = transformer.toOrder(purchaseOrder);

        List<OrderItem> orderItems = transformer.toOrderItems( purchaseOrder );

        OrderRepository orderRepository = new OrderRepository();

        OrderItemRepository orderItemRepository = new OrderItemRepository();

        Schema.SObjectField ORDER_EXTERNAL_ID = Schema.Order.ErpCode__c.getDescribe().getSObjectField();


        orderRepository.save ( order , ORDER_EXTERNAL_ID ); 

        orderItemRepository.save ( order, orderItems ); 

        return new PurchaseOrderInboundResponse(order.Id);

    }

}