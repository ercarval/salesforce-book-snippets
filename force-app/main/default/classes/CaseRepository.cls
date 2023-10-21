/**
 * @author eduardo.bisso - dev-builder
 */
public virtual class CaseRepository extends AbstractRepository {

    virtual
    public List<Case> findOpenCases (List<String> accountIds) {

        return [SELECT Id, AccountId, OwnerId 
                FROM Case 
                WHERE AccountId IN :accountIds
                 AND Status != 'Closed'];

    }

}