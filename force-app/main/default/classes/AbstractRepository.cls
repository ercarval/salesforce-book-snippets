/**
 * @author eduardo.bisso - dev-builder
 */
public abstract class AbstractRepository {

    virtual
    public SObject save ( SObject record ) {

        save ( new List<SObject> { record } );    
    
        return record;
    }
    
    virtual
    public List<SObject> save (List<SObject> records) {

        if ( records == null || records.isEmpty()) {
            return records;
        }
        
        upsert records;
        return records;
    }

    virtual
    public void remove ( SObject record ) {

        remove ( new List<SObject> { record } );    
    
    }

    virtual
    public void remove ( List<SObject> records ) {

        delete records;    
    
    }


}