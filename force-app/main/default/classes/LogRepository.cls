/**
 * @author eduardo.bisso - dev-builder
 */
public class LogRepository extends AbstractRepository {
    
    public List<Log__c> findByCreatedLessThanDays (Integer days) {

        return [ SELECT Id 
                    FROM Log__c 
                    WHERE CreatedDate < LAST_N_DAYS:days];

    }

}