/**
 * @author eduardo.bisso - dev-builder
 */
@isTest
public class OrderRepositoryDmlExceptionMock 
                                    extends OrderRepository {
    
    override
    public  SObject save ( SObject record
                        , Schema.SObjectField field ) {

        if (true) { // para enganar o compilador
            throw new DmlException ('Invalid Account');
        }
        
        return null;
    } 
    
}