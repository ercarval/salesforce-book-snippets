/**
 * @author eduardo.bisso - dev-builder
 */
@isTest
public class GetAddressOutboundServiceMock implements HttpCalloutMock {

    String payload;
    
    public GetAddressOutboundServiceMock (String payload) {
        this.payload = payload;
    }

    public HttpResponse respond ( HttpRequest request ) {
                                
        HttpResponse response = new HttpResponse ();
        response.setStatusCode(200);
        response.setBody(payload);

        return response;

    }
}