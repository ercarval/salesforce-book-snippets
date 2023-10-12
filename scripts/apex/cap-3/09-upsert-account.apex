public Account save ( Account account ) {
    
    BrazilianDocumentValidator validator 
                    = new BrazilianDocumentValidator ();
    
    if ( validator.isValid () ) {
        // valida e retorna um erro, omitido por simplicidade
    }
    
    upsert account; //SIMPLÃO !!!
    
    return account;
}