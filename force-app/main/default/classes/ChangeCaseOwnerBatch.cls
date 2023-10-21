/**
 * @author eduardo.bisso - dev-builder
 */
public without sharing class ChangeCaseOwnerBatch 
                        implements Database.Batchable<SObject> {

    CaseRepository caseRepository;

    AccountManagerGroupRepository repository;

    AccountManagerGroupFilter filter;
    
    public ChangeCaseOwnerBatch() {
        this.repository = new AccountManagerGroupRepository();
        this.caseRepository = new CaseRepository();
        this.filter = new AccountManagerGroupFilter(); 
    }

    public Database.QueryLocator start (Database.BatchableContext context) {

        DateTime startDate = Datetime.newInstance( Date.today(), Time.newInstance(0,0,0,0) );

        DateTime endDate = Datetime.newInstance( Date.today(), Time.newInstance(23,59,59,999) );

        return this.repository.findLastModifiedGroups (startDate, endDate);
        
    }

    public void execute ( Database.BatchableContext context, List<AccountManagerGroup__c> managerGroups ) {        

        List<Case> cases = buildCases (managerGroups);

        caseRepository.save(cases);

    }

    List<Case> buildCases (List<AccountManagerGroup__c> managerGroups) {        

        List<Case> cases = findOpenCases (managerGroups);

        if (cases.isEmpty()) return cases;

        Map<String, AccountManagerGroup__c> accounts = filter.indexByAccount (managerGroups);

        for (Case caze : cases ) {                        

            caze.OwnerId = accounts.get(caze.AccountId).AccountManager__r.OwnerId;

        }

        return cases;

    }

    List<Case> findOpenCases ( List<AccountManagerGroup__c> managerGroups) {

        List<String> accountIds = filter.pullAccountIds ( managerGroups );

        return caseRepository.findOpenCases ( accountIds );

    }



    public void finish ( Database.BatchableContext context ) {
        
    }

}