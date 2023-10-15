/**
 * @author eduardo.bisso - dev-builder
 */
@isTest
public class OpportunityLineItemFixtureFactory {

    public static OpportunityLineItem newOpportunityLineItem ( Opportunity opportunity, Product2 product ) {
        
        return new OpportunityLineItem ( OpportunityId = opportunity.Id,
            Product2Id = product.Id,
            Quantity = 10,
            UnitPrice = 10
        );
    }

    public static OpportunityLineItem create ( Opportunity opportunity, Product2 product ) {

        return create ( newOpportunityLineItem( opportunity, product));
    }

    public static OpportunityLineItem create ( OpportunityLineItem item ) {
        insert item;
        return item;
    }

}