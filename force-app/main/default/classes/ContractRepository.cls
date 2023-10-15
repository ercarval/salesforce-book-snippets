/**
 * @author eduardo.bisso - dev-builder
 */
public class ContractRepository {
    
    public List<Contract> findByIds ( List<String> ids ) {
        
        return [ SELECT Id, Status 
                FROM Contract
                WHERE Id IN: ids ];
        
    }

    public List<Contract> findByAccountAndStatus ( String accountId, String status ) {
        
        return [ SELECT Id, Status
                 FROM Contract
                 WHERE AccountId = :accountId
                    AND Status = :status ];
        
    }

    public List<Contract> save (List<Contract> contracts) {

        upsert contracts;

        return contracts;

    }
    
}
