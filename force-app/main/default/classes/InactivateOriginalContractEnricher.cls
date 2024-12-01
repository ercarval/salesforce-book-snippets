/**
 * @author eduardo.bisso - dev-builder
 */
public class InactivateOriginalContractEnricher {

    ContractRepository repository;

    ContractFilter filter;

    public InactivateOriginalContractEnricher() {

        repository = new ContractRepository();
        filter = new ContractFilter ();

    }
    
    public List<Contract> inactivatedBy ( List<Contract> assignedContracts ) {
            
        List<Contract> originalContracts = findOriginalContracts ( assignedContracts );
        
        if (originalContracts.isEmpty()) return new List<Contract> ();
        
        Map<Id, Contract> indexedOriginalContracts = new Map<Id, Contract> (originalContracts);
        
        for (Contract assignedContract : assignedContracts ) {
        
            Contract originalContract =  indexedOriginalContracts.get ( assignedContract.OriginalContract__c);

            originalContract.Status = 'Inative';

        }

        return repository.save ( originalContracts );                        
 
    }


    List<Contract> findOriginalContracts ( List<Contract> assignedContracts ) {
            
        List<String> originalContractIds = Lists.pullField( assignedContracts, 'OriginalContract__c' );
    
        return repository.findByIds ( originalContractIds );

    }

    public void setRepository (ContractRepository repository) {
        this.repository = repository;
    }

}