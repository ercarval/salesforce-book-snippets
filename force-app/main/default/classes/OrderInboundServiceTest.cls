/**
 * @author eduardo.bisso - dev-builder
 */
@isTest
public class OrderInboundServiceTest {


    @isTest
    static void givenPurchaseOrderInboundWhenSaveThenCreateOrder() {
            
        
        // given 
        PurchaseOrderInboundRequest request = PurchaseOrderInboundFixtureFactory.newPurchaseOrderInboundRequest(); 

        OrderInboundService service = new OrderInboundService();
        
        //aqui que a magia acontece
        //redeterminamos a instância utilizada
        service.setOrderRepository( new OrderRepositoryMock() );
        service.setOrderItemRepository( new OrderItemRepositoryMock() );
        service.setOrderSubItemRepository( new OrderSubItemRepositoryMock() );


        // when
        Test.startTest();

        PurchaseOrderInboundResponse response = service.save(request);
        
        Test.stopTest(); 

        // then    
        Assert.isNotNull( response.id, 'Esperado um response com um Id válido' );


    } 

}