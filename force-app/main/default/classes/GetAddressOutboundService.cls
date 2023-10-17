/**
 * @author eduardo.bisso 
 */
public class GetAddressOutboundService {

    static final String ZIPCODE_ADDRESS_URL = 'https://viacep.com.br/ws/';

    public ViaCepAddressResponse findAddressByZipCode ( String zipCode) {

        Http http = new Http();

        HttpResponse response = http.send( buildRequest(zipCode) );

        return buildZipCodeAddressResponse (response);     
        
    }

    HttpRequest buildRequest (String zipCode) {

        HttpRequest request = new HttpRequest();

        request.setEndpoint( ZIPCODE_ADDRESS_URL + zipCode + '/json/');
        
        request.setMethod('GET');        
        
        request.setHeader('Content-Type', 'application/json; charset=utf-8');

        return request;
    }

    ViaCepAddressResponse buildZipCodeAddressResponse ( HttpResponse response ) {

        if (response.getStatusCode() != 200) return null;

        return  (ViaCepAddressResponse)  JSON.deserialize ( response.getBody(), ViaCepAddressResponse.class);

    }


}
