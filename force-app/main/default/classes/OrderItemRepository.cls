/**
 * @author eduardo.bisso - dev-builder
 */
public class OrderItemRepository extends AbstractRepository {

    Schema.SObjectField ORDER_ITEM_EXTERNAL_ID = Schema.OrderItem.ErpCode__c.getDescribe().getSObjectField();

    virtual
    public List<OrderItem> save ( Order order, List<OrderItem> orderItems ) {

        for (OrderItem orderItem : orderItems) {

            // em caso de update não podemos alterar o valor do 
            // campo MasterDetail
            if (orderItem.OrderId != null) continue;

            orderItem.OrderId = order.Id;            

        }

        save (orderItems, ORDER_ITEM_EXTERNAL_ID);

        return orderItems;
    }
}