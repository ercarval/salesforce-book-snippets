/**
 * @author eduardo.bisso - dev-builder
 */
@isTest
public class PurgeLogsBatchTest {
    
    @TestSetup
    static void setup () {
    
        DateTime oldDateLog = DateTime.now().addDays(-31);
          
        Log__c logToPurge = LogFixtureFactory.createLog();
    
        Test.setCreatedDate( logToPurge.Id , oldDateLog );
    
        Log__c logToKeep = LogFixtureFactory.createLog();
    
    }
        
    @isTest
    static void givenOldLogsWhenRunPurgeJobThenKeepOnlyLastMonth(){
       
        Test.startTest();
        
        Database.executeBatch( new PurgeLogsBatch() );
    
        Test.stopTest();
      
        Integer totalOfLogs = Database.countQuery (
                                'SELECT COUNT(Id) FROM Log__c');
    
        System.assertEquals ( 1, totalOfLogs ); 
    
    }


}