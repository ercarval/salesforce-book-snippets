/**
 * @author eduardo.bisso - dev-builder
 */
@isTest
public class LeadControllerTest {
    

    @isTest
    static void givenValidLeanWhenCreateThenReturnLeadWithId() {
        
        // given valid lead    
        Lead lead = new Lead ( LastName = 'John');// LeadFixtureFactory.newLead ( 'John', 'SForceCompany');

        Test.startTest();    
        
        // when create
        lead = LeadController.create(lead);
            
        Test.stopTest();
        
        // then return lead with id
        System.assert(lead.Id != null);

    }

    @isTest
    static void givenStoredLeadIdWhenFindThenReturnStoredLead () {
        
        // given stored lead
        Lead expectedLead = LeadFixtureFactory.create ( 'John', 'SForceCompany');
            
        RestContext.request = new RestRequest();
        RestContext.request.params.put ('id', expectedLead.Id);
        
        Test.startTest();
    
        // when find
        Lead storedLead = LeadController.findById();
        
        Test.stopTest();
        
        // then return stored lead
        System.assertEquals(expectedLead.Id, storedLead.Id);
    
    }

}