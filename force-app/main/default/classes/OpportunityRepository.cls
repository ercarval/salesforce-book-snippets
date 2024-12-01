/**
 * @author eduardo.bisso - dev-builder
 */
public virtual class OpportunityRepository extends AbstractRepository { 

    virtual
    public List<Opportunity> findOpenOpportunities (Set<Id> accountIds) {
        return [ SELECT Id, AccountId, OwnerId 
                FROM Opportunity 
                WHERE AccountId IN :accountIds
                    AND StageName NOT IN ('Closed Won','Closed Lost') ];
    }

}