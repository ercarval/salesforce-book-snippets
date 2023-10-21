/**
 * @author eduardo.bisso - dev-builder
 */
public class RestResponseError {

    public String error;

    public RestResponseError ( DmlException dmlException ) {
        this ( dmlException.getDmlMessage(0) );
    }

    public RestResponseError ( Exception ex ) {
        this ( ex.getMessage() );
    }

    public RestResponseError ( String error ) {
        this.error = error;
    }
    
}