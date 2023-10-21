public class PurgeLogsBatch implements Database.Batchable<SObject> {
    
    LogRepository repository;  

    Integer daysToKeep; 

    public PurgeLogsBatch () {
        this.repository = new LogRepository();
        this.daysToKeep = 30;
    }

    public Database.QueryLocator start( Database.BatchableContext context) {
        
        Integer days = this.daysToKeep;

        return Database.getQueryLocator( 'SELECT Id  FROM Log__c WHERE CreatedDate < LAST_N_DAYS:days');

    }
    
    public void execute ( Database.BatchableContext context
                        , List<Log__c> logs) {
        
        repository.remove (logs);

    }

    public void finish ( Database.BatchableContext context ) {

    }

    public static void start () {
        Database.executeBatch ( new PurgeLogsBatch() );
    }

}