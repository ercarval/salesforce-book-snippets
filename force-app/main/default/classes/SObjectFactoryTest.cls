/**
 * @author ercarval
 */
@isTest
public class SObjectFactoryTest {


    @isTest
    public static void shouldReturnNewObjectIntance() {
        
        SObject account = SObjectFactory.newInstance('Account');

        System.assertEquals( 'Account' , account.getSObjectType().getDescribe().getName() );

        System.assertEquals( 'Account' ,  SObjectFactory.getObjectName(account) );

        System.assertEquals( 'Account' ,  SObjectFactory.getObjectName( new List<SObject> { account } ) );

        List<Order> orders = new List<Order> { new Order ( PoNumber = '1234') };

        try {

            List<Order> newOrderInstance = (List<Order>) SObjectFactory.newEmptyList(orders);

            System.assert(newOrderInstance != null);

            List<Order> newOrderInstanceTwo = (List<Order>) SObjectFactory.newListInstance('Order'); // deprecated

            System.assert(newOrderInstanceTwo != null);

        } catch (Exception e) {

            System.assert(false);

        }
        
        

        try {

            Map<String, Order> emptyOrdersMap = (Map<String, Order>) SObjectFactory.newEmptyMap(orders);
            
            System.assert(emptyOrdersMap != null);

            Map<String, Order> emptyOrdersMapTwo = (Map<String, Order>) SObjectFactory.newEmptyMap(orders, Order.class); 

            System.assert(emptyOrdersMapTwo != null);

        } catch (Exception e) {

            System.assert(false);

        }


        try {

            Map<String, List<Order>> emptyOrdersMap = ( Map<String, List<Order>> ) SObjectFactory.newEmptyGroupedMap(orders);

            System.assert(emptyOrdersMap != null);

        } catch (Exception e) {

            System.assert(false);

        }

    }

}