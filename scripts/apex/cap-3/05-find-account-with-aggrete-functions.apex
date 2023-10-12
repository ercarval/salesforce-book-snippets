List<AggregateResult> averageOfSales;

averageOfSales = [ SELECT AccountId
                    , AVG(Amount) average
                FROM Opportunity
                GROUP BY AccountId ];

for ( AggregateResult result : averageOfSales ) {

    System.debug (  result.get('AccountId') 
                    + '---' 
                    + result.get('average') );

}