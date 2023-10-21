/**
 * @author eduardo.bisso - dev-builder
 */
public class CronTriggerRepository extends AbstractRepository {

    public List<CronTrigger> findByName ( String name ) {
    
        return [ SELECT Id , CronJobDetail.Name, 
                     TimesTriggered, NextFireTime
                 FROM CronTrigger 
                 WHERE CronJobDetail.Name = :name ];
    }
    

}