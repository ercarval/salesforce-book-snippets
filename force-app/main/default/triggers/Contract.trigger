/**
 * @author eduardo.bisso - dev-builder
 */
trigger Contract on Contract (after update) {

    // determina quais registros foram atualizados.
    // coleção sempre no plural. 
    List<Contract> newContracts = Trigger.new;
    
    Map<Id, Contract> oldContracts = Trigger.oldMap;

    ContractRepository contractRepository = new ContractRepository();

    //Identifica qual o evento/operação foi executada.
    switch on Trigger.operationType {
    
        when AFTER_UPDATE {

            List<Contract> amendmentContracts = new List<Contract> ();

            // Determina quais são os contratos 
            // que foram alterados para Assinado
            for ( Contract contract : newContracts ) {
                
                Contract oldContract = oldContracts.get ( contract.Id );    
                
                // avalia se o status do contrato mudou para Assinado
                // e possui um contrato anterior
                if ( contract.Status == 'Assinado'
                    && oldContract.Status != 'Assinado'
                    && contract.OriginalContract__c != null ) {
                    
                    amendmentContracts.add ( contract );
                
                }    
            
            }
            
            
            if ( !amendmentContracts.isEmpty() ) {

                // obtém os contratos originais com base nos ids
                List<String> originalContractIds = new List<String> ();
            
                for (Contract contract : amendmentContracts) {
                    
                    originalContractIds.add ( 
                                contract.OriginalContract__c );
                
                }
                
                
                // consulta os contratos originais para desativação    
                List<Contract> originalContracts = contractRepository.findByIds(originalContractIds);
            
                // determina a relação do contrato original 
                // com o contrato assinado
                
                if ( !originalContracts.isEmpty() ) {
                    
                    Map<Id, Contract> indexedOriginalContracts = 
                                    new Map<Id, Contract>(originalContracts);
                
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