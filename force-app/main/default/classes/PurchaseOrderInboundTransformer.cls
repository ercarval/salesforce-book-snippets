/**
 * @author eduardo.bisso - dev-builder
 */
public class PurchaseOrderInboundTransformer {
        
    public Order toOrder ( PurchaseOrderInboundRequest purchaseOrder ) {
        
        Order order = new Order();

        order.Account = new Account ( ErpCode__c = purchaseOrder.accountCode);

        order.PaymentTerm__r = new PaymentTerm__c (ExternalId__c = purchaseOrder.paymentTerm);

        order.PaymentMethod__r = new PaymentMethod__c ( ExternalId__c = purchaseOrder.paymentMethod);

        order.ErpCode__c = purchaseOrder.purchaseOrderNumber; 
        
        order.PoNumber = purchaseOrder.purchaseOrderNumber;
        order.PoDate = purchaseOrder.orderDate;
        
        PurchaseOrderInboundRequest.Address billingAddress = purchaseOrder.billingAddress;

        order.BillingStreet = billingAddress.street;
        order.BillingCity = billingAddress.city;
        order.BillingState = billingAddress.state;
        order.BillingPostalCode = billingAddress.postalCode;

        PurchaseOrderInboundRequest.Address shippingAddress = purchaseOrder.shippingAddress;

        order.ShippingStreet = shippingAddress.street;
        order.ShippingCity = shippingAddress.city;
        order.ShippingState = shippingAddress.state;
        order.ShippingPostalCode = shippingAddress.postalCode;

        return order;
    }

    public List<OrderItem> toOrderItems (PurchaseOrderInboundRequest purchaseOrder) {

        List<OrderItem> items = new List<OrderItem>();

        return items;
    }

}