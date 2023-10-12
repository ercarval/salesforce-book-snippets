String stage = 'Closed Lost' ;

List<Opportunity> opportunities;

opportunities = [ SELECT Id, LastModifiedDate 
                    FROM Opportunity 
                    WHERE 
                        StageName = :stage
                    ORDER BY 
                        LastModifiedDate DESC 
                LIMIT 1];