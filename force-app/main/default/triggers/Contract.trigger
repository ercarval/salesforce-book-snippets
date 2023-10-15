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

    //Identifica qual o evento/operação foi executada.
    switch on Trigger.operationType {
    
        when AFTER_UPDATE {

            List<Contract> amendmentContracts =  filter.byChangedToAssignedStatus ( newContracts
                                                                                  , oldContracts );
           
            if ( !amendmentContracts.isEmpty() ) {

                // consulta os contratos originais para desativação    
                List<Contract> originalContracts = contractRepository.findByIds(  
                                                         filter.extractOriginalContractIds (amendmentContracts )
                                                   );
            
                // determina a relação do contrato original 
                // com o contrato assinado
                
                if ( !originalContracts.isEmpty() ) {
                    
                    Map<Id, Contract> indexedOriginalContracts = filter.indexById(originalContracts);                                    
                
                    // determina o contrato original com base 
                    // no novo contrato assinado e
                    // atualiza o contrato original como desativado
                    for (Contract amendmentContract : amendmentContracts ) {
                        
                        Contract originalContract = 
                            indexedOriginalContracts.get (
                                    amendmentContract.OriginalContract__c);
                
                        originalContract.Status = 'Inativado';
                
                    }
                
                    contractRepository.save (originalContracts);
                
                }

            }


        }
    }

}