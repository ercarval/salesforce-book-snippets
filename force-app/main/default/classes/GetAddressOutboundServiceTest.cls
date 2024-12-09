/**
 * @author eduardo.bisso 
 */
@isTest
public class GetAddressOutboundServiceTest {

    @isTest
    static void givenValidZipCodeWhenFindAddressThenReturnCompleteAddress () {
        
        String expectedPayload = GetAddressOutboundFixtureFactory.defaultSuccessPayload();

        Test.setMock ( HttpCalloutMock.class, new GetAddressOutboundServiceMock (expectedPayload) );

        GetAddressOutboundService service = new GetAddressOutboundService();

        ViaCepAddressResponse addressResponse = service.findAddressByZipCode ('01001000');   
                
        System.assert( addressResponse != null, 'Esperado um endereço válido');

        System.assertEquals ( 'Praça da Sé', addressResponse.logradouro );

    }

    @isTest 
    static void givenInvalidZipCodeWhenFindAddressThenReturnNull () {

        String expectedPayload = '{}';
            
        Test.setMock ( HttpCalloutMock.class , new GetAddressOutboundServiceMock (expectedPayload, 404) );

        GetAddressOutboundService service = new GetAddressOutboundService();

        ViaCepAddressResponse addressResponse = service.findAddressByZipCode ('10010');   

        System.assert( addressResponse == null, 'Esperado um endereço nulo');

    }

}