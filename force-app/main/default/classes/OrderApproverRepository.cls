/**
 * @author eduardo.bisso - dev-builder
 */
public inherited sharing virtual class OrderApproverRepository extends AbstractRepository {

    virtual
    public List<OrderApprover__c> findByAccounts (List<String> accountIds) {

        return [ SELECT Id, Account__c, Carrier__c, Financial__c, Commercial__c
                FROM OrderApprover__c
                WHERE Account__c IN :accountIds ];

    }
}