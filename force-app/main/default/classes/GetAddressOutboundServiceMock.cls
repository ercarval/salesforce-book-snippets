/**
 * @author eduardo.bisso - dev-builder
 */
@isTest
public class GetAddressOutboundServiceMock implements HttpCalloutMock {

    String payload;
    Integer statusCode;    
 
    public GetAddressOutboundServiceMock (String payload) {
        this (payload, 200);
    }

    public GetAddressOutboundServiceMock (String payload, Integer statusCode ) {
        this.payload = payload;
        this.statusCode = statusCode;
    }

    public HttpResponse respond ( HttpRequest request ) {
                                
        HttpResponse response = new HttpResponse ();
        response.setStatusCode (this.statusCode);
        response.setBody (this.payload);

        return response;

    }
}