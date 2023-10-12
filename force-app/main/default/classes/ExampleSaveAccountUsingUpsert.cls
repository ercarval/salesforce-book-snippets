public class ExampleSaveAccountUsingUpsert {

    public Account save ( Account account ) {
    
        // fluxo de validação omitido
        upsert account ExtenalId__c; // NUUUOÓ !!! APELOU!!!
        
        return account;

    }
}