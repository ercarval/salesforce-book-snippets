/**
 * @author eduardo.bisso
 */
trigger Account on Account (before insert
                          , before update) {
    
    // determina quais registros foram atualizados.
    // coleção sempre no plural. ;)
    List<Account> newAccounts = Trigger.new;

    BrazilianDocumentValidator validator = new BrazilianDocumentValidator();

    //Identifica qual o evento/operação foi executada.
    switch on Trigger.operationType {
    
        when BEFORE_INSERT, BEFORE_UPDATE {
            
            // itera sobre as contas para aplicar as validações
            for ( Account account : newAccounts ) {
                
                if ( !validator.isValid(account.DocumentNumber__c) ) {
                    
                    // adiciona um erro caso não seja válido
                    account.DocumentNumber__c.addError ('Documento Inválido' );

                }

            }
        
    
        }
    
    }
    

}