/**
 * @author eduardo.bisso 
 */
@isTest
public class LeadFixtureFactory {
    
    public static Lead newLead (String name, String companyName) {
    
        return new Lead (LastName = name
                    , Company = companyName);   
    
    }

}