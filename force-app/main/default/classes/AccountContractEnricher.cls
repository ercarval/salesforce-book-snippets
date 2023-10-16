/**
 * @author eduardo.bisso - dev-builder
 */
public class AccountContractEnricher {

    ContractRepository repository;

    AccountRepository accountRepository;

    public AccountContractEnricher() {
        this.repository = new ContractRepository();
        this.accountRepository = new AccountRepository();
    }

    public void enrichWithTotalPendingContracts ( List<Contract> contracts ) {
            
        // converte a lista de Accounts em uma lista de ids       
        List<String> accountIds = Lists.pullField( contracts, 'AccountId');

        List<AggregateResult> pendingContracts = repository.findTotalOfPendingContracts( accountIds );

        this.enrichAccount( pendingContracts );
        
    }
    
    private void enrichAccount ( List<AggregateResult> pendingContracts ) {
        
        List<Account> accounts = new List<Account> ();

        for ( AggregateResult pendingContract : pendingContracts ) {
            accounts.add ( buildAccount ( pendingContract )) ;
        }
            
        accountRepository.save( accounts );
    
    }

    private Account buildAccount ( AggregateResult contract ) {
        return new Account ( Id = (Id) contract.get('AccountId') ,
            TotalPendingContracts__c = (Decimal) contract.get('total') );
    }     
    

}