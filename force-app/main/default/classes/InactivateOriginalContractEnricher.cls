/**
 * @author eduardo.bisso - dev-builder
 */
public class InactivateOriginalContractEnricher {

    ContractRepository repository;
    
    ContractFilter filter;

    public InactivateOriginalContractEnricher () {
        this.repository = new ContractRepository ();
        this.filter = new ContractFilter ();
    }    
    
    public List<Contract> inactivatedBy ( List<Contract> assignedContracts ) {
            
        List<Contract> originalContracts = findOriginalContracts ( assignedContracts );
        
        if (originalContracts.isEmpty()) {
            return new List<Contract> ();
        } 

        List<Contract> inactivatedContracts = inactivateOriginalContracts ( originalContracts
                                          , assignedContracts );

        return repository.save ( inactivatedContracts );                        
 
    }

    private List<Contract> findOriginalContracts (
                          List<Contract> assignedContracts ) {
            
        List<String> originalContractIds = 
                        filter.extractOriginalContractIds ( assignedContracts );
    
        return repository.findByIds ( originalContractIds );

    }

    private List<Contract> inactivateOriginalContracts (
                       List<Contract> originalContracts,
                       List<Contract> assignedContracts ) {
        
        
        Map<Id, Contract> indexedOriginalContracts = 
                      this.filter.indexById (originalContracts);
        
        for (Contract assignedContract : assignedContracts ) {
        
            Contract originalContract = 
                    indexedOriginalContracts.get (
                        assignedContract.OriginalContract__c);

            originalContract.Status = 'Inativado';

        }

        return originalContracts;
        
    }
    
}