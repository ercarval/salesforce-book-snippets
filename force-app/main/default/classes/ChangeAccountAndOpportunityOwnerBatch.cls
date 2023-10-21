/**
 * @author eduardo.bisso - dev-builder
 */
public without sharing class ChangeAccountAndOpportunityOwnerBatch implements Database.Batchable<SObject> {    
    
    AccountManagerGroupRepository repository;
    
    OpportunityRepository opportunityRepository;

    public ChangeAccountAndOpportunityOwnerBatch () {

        repository = new AccountManagerGroupRepository();
        opportunityRepository = new OpportunityRepository();

    }

    public Database.QueryLocator start (Database.BatchableContext context) {
    
        Date today = Date.today();

        Time startDay = Time.newInstance(0,0,0,0);

        Time endDay = Time.newInstance(23,59,59,999);

        DateTime startDate = Datetime.newInstance ( today, startDay );

        DateTime endDate = Datetime.newInstance ( today, endDay );

        return repository.findLastModifiedGroups ( startDate, endDate);
        
    }

    public void execute ( Database.BatchableContext context, List<AccountManagerGroup__c> managerGroups ) {
        
        List<Account> accounts = buildChangedAccountOwner (managerGroups);

        List<Opportunity> opportunities = buildChangedOpenOpportunities (accounts);

        repository.save(accounts);

        opportunityRepository.save(opportunities);

    }

    List<Account> buildChangedAccountOwner ( List<AccountManagerGroup__c> managerGroups) {

        List<Account> accounts = new List<Account> ();

        for (AccountManagerGroup__c managerGroup:managerGroups){
            
            accounts.add ( buildAccount (managerGroup) );

        }

        return accounts;

    }

    Account buildAccount (AccountManagerGroup__c managerGroup){
        
        Account account = new Account ();
        account.Id = managerGroup.Account__c;
        account.OwnerId = managerGroup.AccountManager__r.OwnerId;
            
        return account;
        
    }

    List<Opportunity> buildChangedOpenOpportunities ( List<Account> accounts ) {
 
        Map<Id, Account> indexedAccounts = new Map<Id, Account> (accounts);

        List<Opportunity> opportunities = opportunityRepository.findOpenOpportunties ( indexedAccounts.keySet());

        if (opportunities.isEmpty()) {        
            return new List<Opportunity>();
        } 
        
        for (Opportunity opportunity : opportunities ) {

            Account account = indexedAccounts.get(opportunity.AccountId);

            opportunity.OwnerId = account.OwnerId;
        }
        
        return opportunities;

    }

    public void finish ( Database.BatchableContext context ) {
        Database.executeBatch ( new ChangeCaseOwnerBatch() ); 
    }

}