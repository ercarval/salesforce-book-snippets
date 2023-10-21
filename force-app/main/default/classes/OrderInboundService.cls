/**
 * @author eduardo.bisso - dev-builder
 */
public class OrderInboundService {

    OrderRepository orderRepository;
    OrderItemRepository orderItemRepository;
    OrderSubItemRepository orderSubItemRepository;

    PurchaseOrderInboundTransformer transformer;

    public OrderInboundService () {

        this.transformer = new PurchaseOrderInboundTransformer();

        this.orderRepository = new OrderRepository();

        this.orderItemRepository = new OrderItemRepository();

        this.orderSubItemRepository 
                                 = new OrderSubItemRepository();
    }


    public PurchaseOrderInboundResponse save ( 
                    PurchaseOrderInboundRequest purchaseOrder ) {
    

        Order order = transformer.toOrder(purchaseOrder);

        List<OrderItem> orderItems =  transformer.toOrderItems( purchaseOrder );

        List<OrderSubItem__c> orderSubItems = transformer.toOrderSubItems( purchaseOrder );

        this.orderRepository.save(order);
        this.orderItemRepository.save (orderItems);
        this.orderSubItemRepository.save (orderSubItems);

        return new PurchaseOrderInboundResponse( order.Id );    
        
    }

}