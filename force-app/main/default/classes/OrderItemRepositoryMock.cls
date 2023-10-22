/**
 * @author eduardo.bisso - dev-builder
 */
@isTest
public class OrderItemRepositoryMock extends OrderItemRepository {

    override
    public List<OrderItem> save ( List<OrderItem> orderItems ) {

        System.debug ('Mocked save record');
                
        return orderItems;
    }
    
}