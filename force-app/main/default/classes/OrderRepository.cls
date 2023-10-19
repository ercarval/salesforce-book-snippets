/**
 * @author eduardo.bisso - dev-builder
 */
public class OrderRepository extends AbstractRepository {


    override    
    public SObject save ( SObject order ) {
        
        upsert (Order) order ErpCode__c;
        
        return order;

    }


}