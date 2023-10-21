/**
 * @author eduardo.bisso - dev-builder
 */
public class OrderInboundService {

    OrderRepository orderRepository;
    OrderItemRepository orderItemRepository;
    OrderSubItemRepository orderSubItemRepository;
    IntegrationLogRepository integrationLogRepository;
    PurchaseOrderInboundTransformer transformer;

    public OrderInboundService () {

        this.transformer = new PurchaseOrderInboundTransformer();

        this.orderRepository = new OrderRepository();

        this.orderItemRepository = new OrderItemRepository();

        this.orderSubItemRepository = new OrderSubItemRepository();

        this.integrationLogRepository = new integrationLogRepository();
    }


    public PurchaseOrderInboundResponse save ( PurchaseOrderInboundRequest purchaseOrder ) {

        Order order;

        SavePoint savePoint = Database.setSavePoint();

        try {
        
            order = transformer.toOrder(purchaseOrder);
        
            List<OrderItem> orderItems = transformer.toOrderItems( purchaseOrder );
        
            List<OrderSubItem__c> orderSubItems = transformer.toOrderSubItems( purchaseOrder );
        
            this.orderRepository.save(order);
            this.orderItemRepository.save (orderItems);
            this.orderSubItemRepository.save (orderSubItems);
            
            log (purchaseOrder);    
                
        } catch (DmlException e) {
            
            Database.rollback(savePoint);
            
            log (purchaseOrder, e);  
        
            throw e;
            
        } catch (Exception e) {        
        
            Database.rollback(savePoint);
            
            log (purchaseOrder, e);  
        
            throw e;
        
        }

        return new PurchaseOrderInboundResponse( order.Id );    

    }

    void log ( PurchaseOrderInboundRequest purchaseOrder ) {
        
        IntegrationLog__c log = transformer.toLog (purchaseOrder);

        this.integrationLogRepository.save (log);

    }

    void log ( PurchaseOrderInboundRequest purchaseOrder,
                    DmlException dmlException ) {
        
        IntegrationLog__c log = transformer.toLog ( purchaseOrder , 
                                                dmlException );

        this.integrationLogRepository.save (log);


    }

    void log ( PurchaseOrderInboundRequest purchaseOrder, Exception ex ) {

        IntegrationLog__c log = transformer.toLog ( purchaseOrder , ex );

        this.integrationLogRepository.save (log);

    }

}