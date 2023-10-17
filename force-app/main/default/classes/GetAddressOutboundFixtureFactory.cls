/**
 * @author eduardo.bisso 
 */
@isTest
public class GetAddressOutboundFixtureFactory {
    
    public static String defaultSuccessPayload () {
        return  '{ "cep": "01001-000", "logradouro": "Praça da Sé", "complemento": "lado ímpar", "bairro": "Sé", "localidade": "São Paulo", "uf": "SP", "ibge": "3550308", "gia": "1004", "ddd": "11", "siafi": "7107"}';
    }

    public static ViaCepAddressResponse fromJson (String payload) {        
        return (ViaCepAddressResponse) JSON.deserialize( payload, ViaCepAddressResponse.class);
    }
 
}