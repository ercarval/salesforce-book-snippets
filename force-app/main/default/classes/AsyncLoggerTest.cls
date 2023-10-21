/**
 * @author eduardo.bisso - dev-builder
 */
@isTest
public class AsyncLoggerTest {
    
    @isTest        
    public static void shouldLogMessageWithPayload() {

        String expectedMessage = 'Test async call in test execution';
        
        AsyncLogger.log ( expectedMessage, '{"Name": "testPayload"}' );
    
        Log__c log = [ SELECT Id, Message__c, Payload__c
                        FROM Log__c LIMIT 1];

        System.assert( log != null );

        System.assertEquals( expectedMessage 
                                ,  log.Message__c );
    

    } 

}