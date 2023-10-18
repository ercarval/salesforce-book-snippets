/**
 * @author eduardo.bisso - dev-builder
 */
@isTest
public class LeadControllerTest {
    

    @isTest
    static void givenValidLeanWhenCreateThenReturnLeadWithId() {

        // given valid lead    
        Lead lead = LeadFixtureFactory.newLead ( 'John', 'SForceCompany');
            
        Test.startTest();    
        
        // when create
        lead = LeadController.create(lead);
            
        Test.stopTest();
        
        // then return lead with id
        System.assert(lead.Id != null);

    }

}