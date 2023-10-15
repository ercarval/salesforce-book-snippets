/**
 * @author eduardo.bisso - dev-builder
 */
public with sharing class ContractTriggerHandler extends TriggerHandler {

    List<Contract> newContracts;
    
    Map<Id, Contract> oldContracts;

    ContractRepository contractRepository;

    ContractFilter filter;

    InactivateOriginalContractEnricher inactivateOriginalContract;

    public ContractTriggerHandler() {
        this (  (List<Contract> ) Trigger.new
            , (Map<Id, Contract>) Trigger.oldMap );
    }

    public ContractTriggerHandler ( List<Contract> newContracts
                            , Map<Id, Contract> oldContracts ) {

        this.newContracts = newContracts;
        this.oldContracts = oldContracts;         

        this.contractRepository = new ContractRepository();

        this.filter = new ContractFilter ();
    
        this.inactivateOriginalContract = new InactivateOriginalContractEnricher();
                                   
    }

    override
    public void afterUpdate() {
        inactivateOldContracts ();
    }

    private void inactivateOldContracts () {

        List<Contract> amendmentContracts = filter.byChangedToAssignedStatus ( newContracts
                                                                             , oldContracts );
    
        inactivateOriginalContract.inactivatedBy ( amendmentContracts );

    }

}