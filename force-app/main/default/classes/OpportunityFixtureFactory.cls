@isTest
public class OpportunityFixtureFactory {


    public static List<Opportunity> newOpenOppotunities ( List<Account> accounts, Integer numberOfOpportunities ) {

        List<Opportunity> opportunities = new List<Opportunity> ();

        for ( Account account : accounts  ) {
            for ( Integer i = 0; i < numberOfOpportunities; i++) {
                opportunities.add ( newOpportunity(account,  new Pricebook2 ( Id = Test.getStandardPricebookId())));
            }

        }

        return opportunities;
    }


    public static Opportunity newOpportunity(
                                Account account,
                                Pricebook2 pricebook ) {
        
        return new Opportunity(
            AccountId = account.Id,
            Name = 'Test Opportunity',
            Pricebook2Id = pricebook.Id,
            CloseDate = Date.today().addDays(1),
            StageName = 'Prospecting'
        );
    }

    public static Opportunity create( Account account,
                                      Pricebook2 pricebook ) {

        return create ( newOpportunity( account, pricebook));
    }

    public static Opportunity create ( Opportunity opportunity ) {
        insert opportunity;
        return opportunity;
    }

    public static Map<String,SObject> createIntegratedScenario() {
        
        //Aqui é o pulo do gato!
        Map<String,SObject> records = PricebookEntryFixtureFactory.createIntegratedScenario();

        Account account = AccountFixtureFactory.create('Test Account', '111.444.777-35');

        records.put('account', account);

        Pricebook2 priceBook = (Pricebook2) records.get('pricebook');

        Opportunity opportunity = create(account, priceBook);

        records.put('opportunity', opportunity);

        Product2 product = (Product2) records.get('product');

        OpportunityLineItem opportunityLineItem = OpportunityLineItemFixtureFactory.create ( opportunity, product );
        
        records.put('opportunityLineItem', opportunityLineItem);

        return records;

    }

}