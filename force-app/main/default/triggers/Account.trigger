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

    //Identifica qual o evento/operação foi executada.
    switch on Trigger.operationType {
    
        when BEFORE_INSERT, BEFORE_UPDATE {
            
            validator.validate(newAccounts);            
        
    
        }

        when AFTER_INSERT {
                
                List<Task> tasks = new List<Task>();
                        
                for ( Account account : newAccounts ) {
                    
                    Task task = new Task();
    
                    task.Subject = 'Lembre-se de entrar em contato com o Cliente ' + account.Name;
    
                    task.Description = 'Entrar em contato para agendar a primeira reunião';
    
                    task.ActivityDate = Date.today().addDays(1);
                    task.WhatId = account.Id;
                    tasks.add (task);
    
                }
            
                insert tasks;
        
        }
    
    }
    

}