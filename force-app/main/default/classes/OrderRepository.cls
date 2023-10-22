/**
 * @author eduardo.bisso - dev-builder
 */
public virtual class OrderRepository extends AbstractRepository {

    Schema.SObjectField ORDER_EXTERNAL_ID = Schema.Order.ErpCode__c.getDescribe().getSObjectField();


    virtual
    public Order findById (String id) {
        return [SELECT Id FROM Order WHERE Id =:id];
    }
    
    virtual
    public Order save (Order order) {

        save (order, ORDER_EXTERNAL_ID);

        return order;
        
    }


}