/**
 * @author eduardo.bisso - dev-builder
 */
public class SObjectFactory {
    
    public static SObject newInstance ( String objectName ) {
        Type objectType = Type.forName (objectName);
        return (SObject) objectType.newInstance();
    }

    public static List<SObject> newEmptyList ( String objectName ) {
        if (objectName == null) return new List<SObject>();
        Type listType = Type.forName ('List<'+ objectName +'>');
        return (List<SObject>) listType.newInstance();
    }

    //deprecated see newEmptyList
    public static List<SObject> newListInstance ( String objectName ) {
        return newEmptyList(objectName);
    }

    public static String getObjectName (List<SObject> records) {
        if (records == null || records.isEmpty()) return null;
        return getObjectName(records.get(0));
    }
    
    public static List<SObject> newEmptyList (List<SObject> records) {
        
        if (records == null || records.isEmpty()) return records;

        String objectName = getObjectName(records);
        
        if (objectName == null) return null;

        return newListInstance(objectName);
    }

    public static String getObjectName (SObject record) {

        if (record == null) return null;

        Schema.DescribeSObjectResult describer = record.getSObjectType().getDescribe();
        
        return describer.getName();
    }

    public static Map<String,SObject> newEmptyMap (List<SObject> records) {

        String objectName = getObjectName(records);

        if ( objectName == null ) return null;
              
        return newEmptyMap ( records , Type.forName(objectName) );       

    }

    public static Map<String,SObject> newEmptyMap (List<SObject> records, Type objecType) {
    
        Type sObjectType = Type.forName ( 'Map<String,' + objecType.getName() + '>' );
        
        return ( Map<String, SObject> ) sObjectType.newInstance();        

    }


    public static Map<String,List<SObject>> newEmptyGroupedMap (List<SObject> records) {

        String objectName = getObjectName(records);

        if ( objectName == null ) return null;
      
        Type sObjectType = Type.forName ( 'Map<String, List<' + objectName + '>>' );
        
        return ( Map<String, List<SObject>> ) sObjectType.newInstance();        

    }



}