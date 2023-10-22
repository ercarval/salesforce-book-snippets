/**
 * @author eduardo.bisso - dev-builder
 */
@isTest
public class OrderSubItemRepositoryMock extends OrderSubItemRepository {
    
    override
    public List<OrderSubItem__c> save ( List<OrderSubItem__c> orderSubItems ) {
        
        IdGenerator.generate(orderSubItems);
               
        return orderSubItems;
    }

}