/**
 * @author eduardo.bisso - dev-builder
 */
@isTest
public class PurchaseOrderInboundFixtureFactory {
    
    private static final String DEFAULT_REQUEST_PAYLOAD = '{"purchaseOrderNumber":"232112321","orderDate":"20023-10-26","accountCode":"2323234","shippingAddress":{"street":"Rua X","streetNumber":"1312","streetComplement":"cond 1","city":"São Paulo","state":"SP","postalCode":"0932722"},"billingAddress":{"street":"Rua X","streetNumber":"1312","streetComplement":"cond 1","city":"São Paulo","state":"SP","postalCode":"0932722"},"paymentTerm":"23423","paymentMethod":"4432","items":[{"itemNumber":1,"productCode":"12321123","quantity":12,"unitPrice":345.0,"unitOfMeasure":"EA","subItems":[{"productCode":"9238373","quantity":2,"unitPrice":10.14}]}]}';
    
    public static PurchaseOrderInboundRequest newPurchaseOrderInboundRequest () {

        return fromJson(DEFAULT_REQUEST_PAYLOAD);

    }

    public static PurchaseOrderInboundRequest fromJson (String payload) {
        return (PurchaseOrderInboundRequest) JSON.deserialize(payload, PurchaseOrderInboundRequest.class);
    }

}