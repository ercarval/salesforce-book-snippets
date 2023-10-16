/**
 * @author eduardo.bisso - dev-builder
 */
public class ContractRepository extends AbstractRepository {
    
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

    public List<AggregateResult> findTotalOfPendingContracts ( List<String> accountIds ) {

        return [ SELECT COUNT (Id) total, AccountId 
                FROM Contract 
                WHERE AccountId IN :accountIds 
                AND Status NOT IN ( 'Assinado', 'Inativado' )
                GROUP BY AccountId];   
    }

    public List<Contract> save (List<Contract> contracts) {

        upsert contracts;

        return contracts;

    }
    

    public Contract save ( Contract contract ) {

        upsert contract;

        return contract;

    }

    public List<Contract> save ( List<Contract> contracts, Schema.SObjectField field ) {

        //O comando abaixo gera o erro : Invalid field for upsert, must be an External Id custom or standard indexed field 
        //upsert contracts field; 

        Database.upsert( contracts, field );

        return contracts;

    }

}
