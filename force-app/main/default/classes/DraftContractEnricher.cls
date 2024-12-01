/**
 * @author eduardo.bisso - dev-builder
 */
public class DraftContractEnricher {

    @TestVisible
    ContractRepository repository;

    @TestVisible
    OpportunityRepository opportunityRepository;
    
    public DraftContractEnricher() {
        this.repository = new ContractRepository();
        this.opportunityRepository = new OpportunityRepository(); 
    }

    public List<Contract> createDraftContacts ( List<Account> accounts ) {

        Map<String, List<Opportunity>> openOpportunities = findOpenOpportunities (accounts);  
        
        List<Contract> allContracts = new List<Contract>();

        for (String accountId : openOpportunities.keySet() )  {
        
            List<Contract> contracts = buildContracts ( openOpportunities.get(accountId) );
            
            allContracts.addAll ( save (contracts) );
        }

        return allContracts;

    } 
    
    Map<String, List<Opportunity>> findOpenOpportunities ( List<Account> accounts ) {

        List<Opportunity> opportunities =  opportunityRepository.findOpenOpportunities(
                                                                            Lists.toSetIds(accounts) );

        if (Lists.isEmpty( opportunities )) {
            return new Map<String, List<Opportunity>>();
        }

        return (Map<String, List<Opportunity>>) Maps.grouppBy('AccountId', opportunities); 
    }
    
    List<Contract> save ( List<Contract> contracts ) {
        return (List<Contract>) repository.save (contracts);
    }

    
    List<Contract> buildContracts (List<Opportunity> openOpportunities) { 
        return new List<Contract>();
    }

}