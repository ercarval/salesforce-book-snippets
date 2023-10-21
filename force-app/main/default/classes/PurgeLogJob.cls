public class PurgeLogJob implements Schedulable {
    
    LogRepository repository;

    public PurgeLogJob () {
        repository = new LogRepository();
    }
    
    public void execute (SchedulableContext context)  {

        List<Log__c> logs = repository.findByCreatedLessThanDays (10);
        
        repository.remove (logs);
       
    }

}