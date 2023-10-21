/**
 * @author eduardo.bisso - dev-builder
 */
public class AccountManagerGroupFilter {

    
    public Map<String, AccountManagerGroup__c> indexByAccount (List<AccountManagerGroup__c> managerGroups) {
        
        Map<String, AccountManagerGroup__c> indexedGroups = new Map<String, AccountManagerGroup__c> ();
        
        for (AccountManagerGroup__c managerGroup : managerGroups  ) {
            indexedGroups.put(managerGroup.Account__c, managerGroup);
        }
        
        return indexedGroups;
        
    }
    
    public List<String> pullAccountIds (List<AccountManagerGroup__c> managerGroups) {
        
        return new List <String> ( indexByAccount (managerGroups).keySet()  );

    }
}