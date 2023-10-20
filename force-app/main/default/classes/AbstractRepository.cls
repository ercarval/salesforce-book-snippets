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
    public  SObject save ( SObject record, Schema.SObjectField field ) {

        save(new List<SObject> {record}, field);

        return record;
    }

    virtual 
    public  List<SObject> save ( List<SObject> records, Schema.SObjectField field ) {

        if (records == null || records.isEmpty()) { 
            return new List<SObject>();
        }

        Database.upsert(records, field);

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