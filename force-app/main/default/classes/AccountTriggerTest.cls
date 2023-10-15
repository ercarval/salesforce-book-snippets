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


    @isTest                     
    public static void shouldGenerateErrorWhenTryToCreateAnAccountWithInvalidDocument () {
        
        //dado (given)
        Account expectedAccount = new Account(Name = 'Teste',
                            DocumentNumber__c = '111.444.777-95');
        
        try { // <--- tenta executar o bloco de código
        
            // quando (when)
            insert expectedAccount; // aqui deve gerar um erro

            Assert.fail('Não deveria criar a conta com CPF inválido');

        } catch (DmlException e) { // se for gerado esse tipo de erro
                                // executa o bloco de código

            System.debug(e.getDmlMessage(0));
            
            //verifica se o erro é de Documento Invalido.
            Assert.isTrue ( 
                    e.getDmlMessage(0)
                        .contains('Documento Inválido') );           
                                    
        }


    }

    @isTest                     
    public static void shouldUpdateAccountWithValidDocument () {
        
        //dado (given)
        Account expectedAccount = new Account(Name = 'Teste',
                            DocumentNumber__c = '111.444.777-35');    
            
        insert expectedAccount;

        expectedAccount.DocumentNumber__c = '023.544.756-08';
        
        // quando (when)
        update expectedAccount;

        // então (then)
        System.assertEquals ( '023.544.756-08'
                    , expectedAccount.DocumentNumber__c );
    }

    @isTest                     
    public static void shouldGenerateErrorWhenTryToUpdateAnAccountWithInvalidDocument () {
        
        //dado (given)
        Account expectedAccount = new Account(Name = 'Teste',
                            DocumentNumber__c = '111.444.777-35');
        
        insert expectedAccount; // aqui deve gerar um erro
            
        expectedAccount.DocumentNumber__c = '111.444.777-95';
        

        try { // <--- tenta executar o bloco de código
        
            // quando (when)
            update expectedAccount;        
                
            Assert.fail ('Não deveria atualizar a conta com CPF inválido'); 

        } catch (DmlException e) { //se for gerado esse tipo de erro
                                // executa o bloco de código            
                    
            // vamos verificar se o erro de fato é de Documento Invalido.
            Assert.isTrue( e.getDmlMessage(0).contains('Documento Inválido') );           
                                    
        }
                            
    }

}