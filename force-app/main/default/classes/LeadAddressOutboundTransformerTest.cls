/**
 * @author eduardo.bisso 
 */
@isTest
public class LeadAddressOutboundTransformerTest {

    @isTest
    static void givenLeadWhenTransformThenMapAddressToLead() {

    
        Lead lead = LeadFixtureFactory.newLead('Teste Lead', 'Company Teste');


        String payload = GetAddressOutboundFixtureFactory.defaultSuccessPayload();

        ViaCepAddressResponse response = GetAddressOutboundFixtureFactory.fromJson ( payload );
        
        LeadAddressOutboundTransformer transformer = new LeadAddressOutboundTransformer ();
        
        Test.startTest();
        
        transformer.toLead (response, lead);

        Test.stopTest();

        System.assertEquals ( response.logradouro, lead.Street);
        System.assertEquals ( response.localidade, lead.City);
        System.assertEquals ( response.uf, lead.State );
        System.assertEquals ( response.cep, lead.PostalCode );

    }

}