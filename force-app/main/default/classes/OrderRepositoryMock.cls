/**
 * @author eduardo.bisso - dev-builder
 */
@isTest
public class OrderRepositoryMock extends OrderRepository {

    override
    public Order save ( Order order ) {

        IdGenerator.generate(order);
                
        return order;
    } 

}