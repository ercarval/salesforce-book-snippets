/**
 * @author eduardo.bisso
 */
trigger Account on Account (before insert
                          , before update
                          , after insert) {
    
    // determina quais registros foram atualizados.
    // coleção sempre no plural. 
    List<Account> newAccounts = Trigger.new;

    AccountValidator validator = new AccountValidator ();

    AccountEventEnricher enricher = new AccountEventEnricher ();

    //Identifica qual o evento/operação foi executada.
    switch on Trigger.operationType {
    
        when BEFORE_INSERT, BEFORE_UPDATE {
            
            validator.validate(newAccounts);            
        
    
        }

        when AFTER_INSERT {
                
            enricher.scheduleFirstAdvisorMeeting(newAccounts);
        
        }
    
    }
    

}