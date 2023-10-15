@isTest
public class PriceBookFixtureFactory {

    public static PriceBook2 getStandardPricebook() {
        return new Pricebook2 ( 
            Id = Test.getStandardPricebookId(),
            IsActive = true );
    }

}