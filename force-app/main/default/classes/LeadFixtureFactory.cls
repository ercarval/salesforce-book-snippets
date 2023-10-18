/**
 * @author eduardo.bisso 
 */
@isTest
public class LeadFixtureFactory {
    

    public static Lead create (String name, String companyName) {
        return create( newLead(name, companyName) );
    }

    public static Lead newLead (String name, String companyName) {
    
        return new Lead (LastName = name
                    , Company = companyName);   
    
    }

    public static Lead create (Lead lead) {
        upsert lead;
        return lead;
    }

}