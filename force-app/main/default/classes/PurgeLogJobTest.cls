/**
 * @author eduardo.bisso - dev-builder
 */
@isTest
public class PurgeLogJobTest {

    @isTest
    static void givenTimeReachedWhenScheduleThenExecutePurgeLog () {

        String cronExpression = '0 0 0 * * ?';

        DateTime oldDateLog = DateTime.now().addDays(-11);
        
        Log__c logToPurge = LogFixtureFactory.createLog();

        Test.setCreatedDate( logToPurge.Id , oldDateLog );

        Log__c logToKeep = LogFixtureFactory.createLog();

        Test.startTest();
        
        System.schedule ( 'PurgeJobTest' 
                        , cronExpression 
                        , new PurgeLogJob () );    

        Test.stopTest();

        List<Log__c> logs = [ SELECT Id FROM Log__c  ];

        System.assertEquals ( 1, logs.size() );

        System.assertEquals ( logToKeep.Id , logs.get(0).Id );

        
    }

}