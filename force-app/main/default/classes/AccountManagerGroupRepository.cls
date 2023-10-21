/**
 * @author eduardo.bisso - dev-builder
 */
public virtual class AccountManagerGroupRepository extends AbstractRepository {

    virtual
    public Database.QueryLocator findLastModifiedGroups ( DateTime startDate
                                                        , DateTime endDate ) {

        return Database.getQueryLocator(
                    [ SELECT Account__c, AccountManager__r.OwnerId
                      FROM AccountManagerGroup__c 
                      WHERE LastModifiedDate >= :startDate
                        AND LastModifiedDate >= :endDate  ]);


    }   

}