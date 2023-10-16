/**
 * @author ercarval - topi/brq
 */
@isTest
public class ListsTest {

    public static List<Account> setup () {
        return new List<Account> {
                AccountFixtureFactory.newWithFakeId('One')
            , AccountFixtureFactory.newWithFakeId('Two')
            , AccountFixtureFactory.newWithFakeId('Three')
        };
    }

    @isTest
    public static void givenSomeSObjetWhenPullIdsThenReturnListOfIds () {

        List<Account> accounts = setup();

        List<String> ids = Lists.toIds(accounts);

        System.assert(!ids.isEmpty());
        System.assertEquals( 3, ids.size());

        System.assert( ids.contains( accounts.get(0).Id ) );

    }

    @isTest
    public static void givenSomeSObjetWhenGetSetOfIdsThenReturnSetOfIds () {

        List<Account> accounts = setup();

        Set<Id> ids = Lists.toSetIds(accounts);

        System.assert(!ids.isEmpty());
        System.assertEquals( 3, ids.size());

        System.assert( ids.contains( accounts.get(0).Id ) );

    }


    @isTest
    public static void givenSomeSObjetWhenPullNameFieldThenReturnListOfNames () {

        List<Account> accounts = setup();

        List<String> names = Lists.pullField(accounts, 'Name');

        System.assert(!names.isEmpty());
        System.assertEquals( 3, names.size());

        System.assert( names.contains( accounts.get(0).Name ) );

    }

    @isTest
    public static void givenSomeSObjetWithSubQueryWhenPullSubQueryRecordsThenReturnListOfObject () {

        String payload = '[{"Id":"0011U00000DpSUUQA3","Name":"GenePoint","Contacts":{"totalSize":1,"done":true,"records":[{"AccountId":"0011U00000DpSUUQA3","Id":"0031U00000B22q0QAB","Email":"efrank@genepoint.com"}]}},{"Id":"0011U00000DpSUSQA3","Name":"United Oil & Gas, UK","Contacts":{"totalSize":1,"done":true,"records":[{"AccountId":"0011U00000DpSUSQA3","Id":"0031U00000B22pxQAB","Email":"ajames@uog.com"}]}},{"Id":"0011U00000DpSUTQA3","Name":"United Oil & Gas, Singapore","Contacts":{"totalSize":2,"done":true,"records":[{"AccountId":"0011U00000DpSUTQA3","Id":"0031U00000B22pyQAB","Email":"tripley@uog.com"},{"AccountId":"0011U00000DpSUTQA3","Id":"0031U00000B22pzQAB","Email":"ldcruz@uog.com"}]}}]';

        List<Account> accounts = AccountFixtureFactory.fromJsonArray(payload);

        List<Contact> contacts = (List<Contact> ) Lists.pullAllSubQueryRecords(accounts, 'Contacts');

        System.assert(!contacts.isEmpty());
        System.assertEquals( 4, contacts.size());

    }

    @isTest
    public static void givenSomeObjetWhenCheckIsEmptyThenReturnTrue () {

        List<Decimal> nullDecimals;
        List<String> nullStrings;

        System.assertEquals( false , Lists.isEmpty( new List<String> {'name'} ) );
        System.assertEquals( true , Lists.isEmpty( new List<String>() ) );
        System.assertEquals( true , Lists.isEmpty( nullDecimals ) );
        System.assertEquals( true , Lists.isEmpty( nullStrings ) );

    }

    @isTest
    public static void givenDuplicateLinesListWhenRemoveDuplicateLinesThenUnifiedList() {
        
        List<Object> duplicates = new List<String> { 
            'Test One', 'Test One', 
            'Test Two', 'Test Two' 
        };

        List<Object> unifiedLines = Lists.removeDuplicateLines(duplicates);

        System.assert(duplicates.size() == 4);
        System.assert(unifiedLines.size() == 2);

    }

    @isTest
    public static void givenEmptyAndNullLinesListWhenRemoveEmptyLinesThenClearList() {
        
        List<Object> dirtyLines = new List<String> {
            null, '', 'Test One'
        };

        List<Object> clearLines = Lists.removeEmptyLines(dirtyLines);

        System.assert(dirtyLines.size() == 3);
        System.assert(clearLines.size() == 1);

    }


}