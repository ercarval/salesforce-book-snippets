/**
 * @author eduardo.bisso - dev-builder
 */
public class AccountValidator {

    BrazilianDocumentValidator documentValidator; 

    public AccountValidator () {
        this.documentValidator = new BrazilianDocumentValidator();
    }

    public void validate (List<Account> accounts) {

        for (Account account : accounts) {

           validateDocumentNumber(account);

        }

    }
    
    private void validateDocumentNumber (Account account) {

        if ( this.documentValidator.isValid (account.DocumentNumber__c))  {
            return;
        }

        account.DocumentNumber__c
                        .addError ('Documento Inválido' );
    }

}