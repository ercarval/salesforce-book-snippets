/**
 * @author ercarval - topi/brq
 */
@isTest
public class MapsTest {

    @isTest
    public static void givenAccountsWhenIndexByStateThenReturnNewMapWithAccounts () {
        
        List<Account> accounts = ListsTest.setup();

        Map<String,Account>  accountsByBillingState = (Map<String,Account>) Maps.indexBy('BillingState', accounts);

        System.assert(!accountsByBillingState.isEmpty());

        System.assertEquals( 3, accountsByBillingState.size());

    }

    @isTest
    public static void givenEmptyAccountsWhenIndexByFieldThenReturnNewEmptyGenericMap () {
        
        List<Account> accounts = new List<Account>();

        Map<String,SObject>  accountsByBillingState = Maps.indexBy('Name', accounts);
                
        System.assert(accountsByBillingState.isEmpty());

    }


    @isTest
    public static void givenAccountsWhenGroupByFieldThenReturnNewGroupedMap () {
        
        List<Account> accounts = ListsTest.setup();
        accounts.get(0).BillingState = 'SP';
        accounts.get(1).BillingState = 'SP';

        Map<String, List<Account>> accountsGroupedByBillingState = (Map<String, List<Account>>
                                                                    ) Maps.grouppBy('BillingState', accounts);

        System.assert(!accountsGroupedByBillingState.isEmpty());
        
        System.assertEquals( 2, accountsGroupedByBillingState.size() );

        System.assertEquals( 2, accountsGroupedByBillingState.get('SP').size() );
        

    }


}