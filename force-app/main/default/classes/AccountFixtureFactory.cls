/**
 * @author eduardo.bisso - dev-builder
 */
@isTest
public class AccountFixtureFactory {

    public static Account create (String name, String documentNumber) {
        return create ( newAccount (name, documentNumber) );
    }

    public static Account create ( Account account ) {
        insert account;
        return account;
    }
    
    public static Account newAccountWithFakeId (String name, String documentNumber) {

        Account account = newAccount(name, documentNumber);

        return (Account) IdGenerator.generate(account);

    }

    public static Account newAccount (String name, String documentNumber) {
        return new Account (Name = name
                , DocumentNumber__c = documentNumber
                , BillingStreet = 'Rua Teste'
                , BillingCity = 'Teste'
                , BillingState = 'SP');
    }

    public static List<Account> newAccountsWithFakeId ( Integer numberOfAccounts) {

        List<Account> accounts = new List<Account>();
        
        for (Integer i = 0; i < numberOfAccounts; i++ ) {

            accounts.add( newAccountWithFakeId ( Random.generateText( 20 )
                                                ,  BrazilianDocumentGenerator.buildCnpj() ) );

        }

        return accounts;
    }


    public static Account fromJson (String payload) {
        return (Account) JSON.deserialize (payload, Account.class);
    }

    public static List<Account> fromJsonArray (String payload) {
        return (List<Account>) JSON.deserialize (payload, List<Account>.class);
    }


}