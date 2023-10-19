/**
 * @author: eduardo.bisso
 */
@RestResource (urlMapping='/api/orders/*')
global class OrderController {

    @HttpPost
    global static PurchaseOrderInboundResponse create ( PurchaseOrderInboundRequest purchaseOrder ) {
        
        PurchaseOrderInboundTransformer transformer = new PurchaseOrderInboundTransformer();

        Order order = transformer.toOrder(purchaseOrder);

        List<OrderLineItem> orderLineItem = transformer.toOrderItems( purchaseOrder );

        OrderRepository orderRepository = new OrderRepository();

        OrderLineItemRepository orderLineItemRepository = new OrderLineItemRepository();

        orderRepository.save ( order ); 
        orderLineItemRepository.save ( orderLineItem ); 

        return new PurchaseOrderInboundResponse(order.Id);

    }

}