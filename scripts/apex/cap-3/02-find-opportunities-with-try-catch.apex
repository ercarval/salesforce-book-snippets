try { 
    
    Opportunity opportunity;    

    opportunity = [ SELECT Id
                        , LastModifiedDate 
                    FROM Opportunity 
                    WHERE StageName = 'Closed Lost' 
                    ORDER BY LastModifiedDate DESC
                    LIMIT 1 ];

    Account account = new Account ( Id = opportunity.Id );
 
    account.LastClosedLostOpportunityDate__c 
                = opportunity.LastModifiedDate;

} catch (QueryException e) {
    System.debug (e.getMessage ());
}    