/**
 * @author eduardo.bisso - dev-builder
 */
trigger Contract on Contract (after update) {

    // determina quais registros foram atualizados.
    // coleção sempre no plural. 
    List<Contract> newContracts = Trigger.new;
    
    Map<Id, Contract> oldContracts = Trigger.oldMap;

    ContractRepository contractRepository = new ContractRepository();

    ContractFilter filter = new ContractFilter ();

    InactivateOriginalContractEnricher inactivateOriginalContract = new InactivateOriginalContractEnricher();

    //Identifica qual o evento/operação foi executada.
    switch on Trigger.operationType {
    
        when AFTER_UPDATE {

            List<Contract> amendmentContracts = filter.byChangedToAssignedStatus ( newContracts,oldContracts );
    
            inactivateOriginalContract.inactivatedBy ( amendmentContracts );

        }
    }

}