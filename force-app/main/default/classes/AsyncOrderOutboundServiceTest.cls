@isTest
public class AsyncOrderOutboundServiceTest {
    
    @isTest        
    public static void shouldSendOrder() {

        String reponsePayload = '{"orderNumber":"12323212132"}';
    
        Map<String, SObject> records = OrderFixtureFactory.createIntegratedScenario();

        Order order = (Order) records.get('order');

        Test.setMock ( HttpCalloutMock.class, new OrderOutboundServiceMock ( reponsePayload ));
    
        Test.startTest();        
        
        List<Order> orders = new List<Order> {order};
 
        System.enqueueJob ( 
             new AsyncOrderOutboundService ( orders ));
    
        Test.stopTest();
        
        Order storedOrders = [ SELECT PoNumber FROM Order LIMIT 1];

        System.assertEquals( '12323212132',  storedOrders.PoNumber );
    
    } 

}