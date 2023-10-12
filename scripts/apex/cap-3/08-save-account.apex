public Account save ( Account account ) {
    
    BrazilianDocumentValidator validator 
                    = new BrazilianDocumentValidator ();
    
    if ( validator.isValid () ) {
        // valida e retorna um erro, omitido por simplicidade
    }
    
    
    if (account.Id == null) {
        insert account;
    } else {
        update account;
    }

    return account;
}