List<Opportunity> opportunities;

opportunities = [ SELECT Id
                    , LastModifiedDate 
                FROM Opportunity 
                WHERE StageName = 'Closed Lost' 
                ORDER BY LastModifiedDate DESC 
                LIMIT 1];

if ( !opportunities.isEmpty ()) {

    Opportunity opportunity = opportunities.get(0);

    Account account = new Account ( Id = opportunity.Id );
    
    account.LastClosedLostOpportunityDate__c = opportunity.LastModifiedDate;

    update account;
    
}