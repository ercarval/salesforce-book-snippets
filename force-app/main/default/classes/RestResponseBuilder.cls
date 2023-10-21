/**
 * @author eduardo.bisso - dev-builder
 */
public class RestResponseBuilder {

    RestResponse response;

    public RestResponseBuilder (RestResponse response) {
        this.response = response;
        this.response.statusCode = 200;
        this.response.headers.put('Content-Type'
                                    , 'application/json');
    }

    public void withBody ( Object body ) {
        this.response.responseBody = Blob.valueOf( 
                                        JSON.serialize(body) );        
    }

    public void withError ( DmlException dmlException ) {
        this.response.statusCode = 400;
        withBody ( new RestResponseError ( dmlException ) );
    }
    
    public void withError ( Exception ex ) {
        this.response.statusCode = 400;
        withBody ( new RestResponseError ( ex ) );
    }

}