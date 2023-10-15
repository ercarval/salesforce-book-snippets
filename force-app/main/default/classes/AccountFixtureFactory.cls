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

    public static Account newAccount (String name, String documentNumber) {
        return new Account (Name = name
                , DocumentNumber__c = documentNumber
                , BillingStreet = 'Rua Teste'
                , BillingCity = 'Teste'
                , BillingState = 'SP');
    }

    public static Account fromJson (String payload) {
        return (Account) JSON.deserialize (payload, Account.class);
    }

    public static List<Account> fromJsonArray (String payload) {
        return (List<Account>) JSON.deserialize (payload, List<Account>.class);
    }

}