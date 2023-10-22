/**
 * @author eduardo.bisso - dev-builder
 */
@isTest
public class OrderRepositoryMock extends OrderRepository {

    override
    public SObject save ( SObject record
                        , Schema.SObjectField field ) {

        System.debug ('Mocked save record');
                
        return record;
    } 

}