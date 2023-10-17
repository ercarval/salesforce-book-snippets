/**
 * @author eduardo.bisso 
 */
@isTest
public class GetAddressOutboundServiceTest {

    @isTest
    static void givenValidZipCodeWhenFindAddressThenReturnCompleteAddress () {
        
        GetAddressOutboundService service = new GetAddressOutboundService();

        ViaCepAddressResponse addressResponse = service.findAddressByZipCode ('01001000');   
        
        //Methods defined as TestMethod do not support Web service callouts

        System.assert( addressResponse != null, 'Esperado um endereço válido');

        System.assertEquals ( 'Praça da Sé', addressResponse.logradouro );
        
        

    }

}