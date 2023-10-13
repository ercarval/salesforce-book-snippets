public Account save ( Account account ) {
    
    // fluxo de validação omitido

    List<City__c> cities;

    cities = [ SELECT Id, IBGECode__c 
            FROM City__c 
            WHERE 
                IBGECode__c = :account.BillingCity__r.IBGECode__c
            LIMIT 1];
    
    if ( !cities.isEmpty() ) {
        account.BillingCity__c = cities.get(0).Id;
    }
    
    List<CNAE__c> cnaes = [ SELECT Id, Code__c 
                FROM CNAE__c 
                WHERE 
                Code__c = :account.CNAE__r.Code__c
                LIMIT 1];

    if ( !cnaes.isEmpty() ) {
        account.CNAE__c = cnaes.get(0).Id;
    }

    upsert account;
    
    return account;
}