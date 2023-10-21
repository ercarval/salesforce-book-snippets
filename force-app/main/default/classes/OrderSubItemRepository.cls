/**
 * @author eduardo.bisso - dev-builder
 */
public virtual class OrderSubItemRepository extends AbstractRepository {

    Schema.SObjectField ORDER_SUB_ITEM_EXTERNAL_ID = Schema.OrderSubItem__c.ExternalId__c.getDescribe().getSObjectField();

    virtual
    public List<OrderSubItem__c> save ( List<OrderSubItem__c> orderSubItems ) {

        save (orderSubItems, ORDER_SUB_ITEM_EXTERNAL_ID);

        return orderSubItems;
    }
    
}