/**
 * @author eduardo.bisso - dev-builder
 */
public class AsyncLogger {

    @future
    public static void log ( String message
                          , String payload ) {
    
        AsyncLoggerRepository repository = new AsyncLoggerRepository();
    
        Log__c log = new Log__c ( Message__c = message
                                , Payload__c = payload );
    
        repository.save ( log );            

    } 
}