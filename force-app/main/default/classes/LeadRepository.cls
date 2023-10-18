/**
 * @author ercarval
 */
public virtual class LeadRepository extends AbstractRepository {
    
    public Lead findById (String id) {
        return [ SELECT Id, Name, Company, Email
                 FROM Lead 
                 WHERE Id = :id];
    }

}