/**
 * @author eduardo.bisso
 */
@isTest
public class AccountTriggerTest {
    
    @isTest                     
    public static void shouldCreateAccountWithValidDocumentAndCreateTask () {
        
        //dado (given)
        Account expectedAccount = new Account(Name = 'Teste',
                                                DocumentNumber__c = '111.444.777-35');
        
        // quando (when)
        insert expectedAccount;
    
        // então (then)
        Assert.isNotNull (  expectedAccount.Id );
        
        // verificar se a Tarefa foi criada
            
        List<Task> tasks = [ SELECT Id
                    , Subject
                    , Status
                    , WhoId
                    , WhatId 
                    FROM Task 
                    WHERE WhatId = :expectedAccount.Id];

        Assert.isFalse ( tasks.isEmpty(), 'Deve retornar uma tarefa pelo menos' ); // retornou resultado
        
        System.assertEquals ( 1 
                , tasks.size() 
                , 'Apenas uma tarefa deverá ser criada' );

    }




}