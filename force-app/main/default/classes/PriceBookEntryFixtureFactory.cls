@isTest
public class PriceBookEntryFixtureFactory {

    public static PricebookEntry create (Pricebook2 pricebook
                                        , Product2 product ) {

        return create ( newPricebookEntry (pricebook , product));

    }

    public static PricebookEntry create (
                                PricebookEntry pricebookEntry) {
        insert pricebookEntry;
        return pricebookEntry;
    }

    public static PriceBookEntry newPricebookEntry(    
                Pricebook2 pricebook, Product2 product) {

        return new PricebookEntry(
            Pricebook2Id = pricebook.Id,
            Product2Id = product.Id,
            UnitPrice = 1.0,
            IsActive = true
        );

    }

    public static Map<String,SObject> createIntegratedScenario() {

        Map<String,SObject> records = new Map<String,SObject>();
    
        Product2 product = ProductFixtureFactory.create('Test Product');
        
        records.put('product', product);
    
        Pricebook2 pricebook = PriceBookFixtureFactory.getStandardPricebook();
    
        records.put('pricebook', pricebook);
    
    
        PricebookEntry pricebookEntry = create (pricebook
                                                , product);
    
        records.put('pricebookEntry', pricebookEntry);
    
        return records;
    
    }

}