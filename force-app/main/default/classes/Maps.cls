public class Maps {

    public static Map<String, SObject> indexBy ( String fieldName
                                                , List<SObject> records  ) {
                                                                    
        if ( Lists.isEmpty(records) ) return new Map<String, SObject>();
        
        Map<String, SObject> values = SObjectFactory.newEmptyMap(records);
        
        for ( SObject record : records  ) {
        
            String value = (String) Lists.getValue(record, fieldName);
            
            if ( value == null ) continue;
            
            values.put ( value, record );
        }
        
        return values;
    }

    public static Map<String, List<SObject>> grouppBy ( String fieldName
                                                     , List<SObject> records  ) {
                                                                
        if ( Lists.isEmpty(records) ) return new Map<String, List<SObject>>();

        Map<String, List<SObject>> groupedRecords = SObjectFactory.newEmptyGroupedMap (records);
        
        String objectName = SObjectFactory.getObjectName(records);                                                        

        for ( SObject record : records  ) {
        
            String value = (String) Lists.getValue(record, fieldName);
            
            if ( String.isEmpty(value)) continue;
            
            if ( groupedRecords.get ( value ) == null ) groupedRecords.put ( value, SObjectFactory.newEmptyList(objectName) );
            
            groupedRecords.get ( value ).add ( record );
        }
        
        return groupedRecords;
    }

}