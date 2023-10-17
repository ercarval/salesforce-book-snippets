/**
 * @author eduardo.bisso 
 */
@isTest
public class GetAddressOutboundServiceTest {

    @isTest
    static void givenValidZipCodeWhenFindAddressThenReturnCompleteAddress () {
        
        String expectedPayload = '{ "cep": "01001-000", '
                                + ' "logradouro": "Praça da Sé",'
                                + ' "complemento": "lado ímpar",'
                                + ' "bairro": "Sé",'
                                + ' "localidade": "São Paulo",'
                                + ' "uf": "SP",'
                                + ' "ibge": "3550308",'
                                + ' "gia": "1004",'
                                + ' "ddd": "11",'
                                + ' "siafi": "7107"}';

        Test.setMock ( HttpCalloutMock.class, new GetAddressOutboundServiceMock (expectedPayload) );

        GetAddressOutboundService service = new GetAddressOutboundService();

        ViaCepAddressResponse addressResponse = service.findAddressByZipCode ('01001000');   
                
        System.assert( addressResponse != null, 'Esperado um endereço válido');

        System.assertEquals ( 'Praça da Sé', addressResponse.logradouro );

    }

}