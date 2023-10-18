/**
 * @author eduardo.bisso 
 */
@isTest
public class GetLeadAddressOutboundServiceTest {

    @isTest
    static void givenLeanWithPostalCodeWhenFindOutboundAddressThenReturnLeadWithAddress() {

        Lead lead = LeadFixtureFactory.newLead('Teste Lead', 'Company Teste');

        lead.PostalCode = '01001000';

        String payload = GetAddressOutboundFixtureFactory.defaultSuccessPayload();

        ViaCepAddressResponse expectedAddress =  GetAddressOutboundFixtureFactory.fromJson ( payload );
                    
        Test.setMock ( HttpCalloutMock.class, new GetAddressOutboundServiceMock( payload ));

        GetLeadAddressOutboundService service = new GetLeadAddressOutboundService();

        Test.startTest();

        service.findAddressByZipCode (lead);   

        Test.stopTest();

        Assert.areEqual ( expectedAddress.logradouro, lead.Street);    
    }

}