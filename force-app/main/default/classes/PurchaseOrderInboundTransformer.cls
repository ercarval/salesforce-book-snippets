/**
 * @author eduardo.bisso - dev-builder
 */
public virtual class PurchaseOrderInboundTransformer {
        
    public Order toOrder ( PurchaseOrderInboundRequest purchaseOrder ) {
        
        Order order = new Order();

        order.Account = new Account ( ErpCode__c = purchaseOrder.accountCode);

        order.PaymentTerm__r = new PaymentTerm__c (ExternalId__c = purchaseOrder.paymentTerm);

        order.PaymentMethod__r = new PaymentMethod__c ( ExternalId__c = purchaseOrder.paymentMethod);

        order.ErpCode__c = purchaseOrder.purchaseOrderNumber; 
        
        order.PoNumber = purchaseOrder.purchaseOrderNumber;
        order.PoDate = purchaseOrder.orderDate;
        
        PurchaseOrderInboundRequest.Address billingAddress = purchaseOrder.billingAddress;

        if (billingAddress != null) {

            order.BillingStreet = billingAddress.street;
            order.BillingCity = billingAddress.city;
            order.BillingState = billingAddress.state;
            order.BillingPostalCode = billingAddress.postalCode;
    
        }

        
        PurchaseOrderInboundRequest.Address shippingAddress = purchaseOrder.shippingAddress;

        if (shippingAddress != null) { 

            order.ShippingStreet = shippingAddress.street;
            order.ShippingCity = shippingAddress.city;
            order.ShippingState = shippingAddress.state;
            order.ShippingPostalCode = shippingAddress.postalCode;
        }
        
        return order;
    }

    public List<OrderItem> toOrderItems (PurchaseOrderInboundRequest purchaseOrder) {

        List<OrderItem> items = new List<OrderItem>();

        if ( purchaseOrder.items == null ) return items;

        for (PurchaseOrderInboundRequest.PurchaseItem item : purchaseOrder.items ) {

            OrderItem orderItem = new OrderItem ();

            orderItem.Order = new Order (
                ErpCode__c = purchaseOrder.purchaseOrderNumber
            );

            // parte do código foi omitida
            items.add (orderItem);

        }

        return items;
    }


    public List<OrderSubItem__c> toOrderSubItems (PurchaseOrderInboundRequest purchaseOrder) {

        List<OrderSubItem__c> items = new List<OrderSubItem__c>();

        if ( purchaseOrder.items == null ) return items;

        for (PurchaseOrderInboundRequest.PurchaseItem item : purchaseOrder.items ) {

            items.addAll ( toOrderSubItems (purchaseOrder, item) );

        }

        return items;
    }

    public List<OrderSubItem__c> toOrderSubItems ( PurchaseOrderInboundRequest purchaseOrder
                                                    , PurchaseOrderInboundRequest.PurchaseItem item ) {

        List<OrderSubItem__c> items = new List<OrderSubItem__c>();

        for (PurchaseOrderInboundRequest.PurchaseSubItem sub : item.subItems) {

            OrderSubItem__c subItem = new OrderSubItem__c ();

            subItem.Order__r = new Order (
                ErpCode__c = purchaseOrder.purchaseOrderNumber
            );

            subItem.OrderItemExternalId__c = purchaseOrder.purchaseOrderNumber + '_' + item.itemNumber;

            items.add (subItem);

        }
        
        return items;
        
    }

    public IntegrationLog__c toLog ( PurchaseOrderInboundRequest purchaseOrder  ) {

        return new IntegrationLog__c (
            Event__c = 'PURCHASE_ORDER_INBOUND',
            InternalId__c = purchaseOrder.purchaseOrderNumber,
            Status__c = 'SUCCESS'
        );
    }

    public IntegrationLog__c toLog ( PurchaseOrderInboundRequest purchaseOrder 
                                    , DmlException dmlException ) {

        return new IntegrationLog__c (
            Event__c = 'PURCHASE_ORDER_INBOUND',
            InternalId__c = purchaseOrder.purchaseOrderNumber,
            Status__c = 'ERROR',
            StatusMessage__c = getDmlExceptionMessage ( dmlException ), 
            Message__c = dmlException.getStackTraceString()
        );
    }


    public IntegrationLog__c toLog ( PurchaseOrderInboundRequest purchaseOrder 
                                    , Exception ex ) {

        return new IntegrationLog__c (
            Event__c = 'PURCHASE_ORDER_INBOUND',
            InternalId__c = purchaseOrder.purchaseOrderNumber,
            Status__c = 'ERROR',
            StatusMessage__c = ex.getMessage(), 
            Message__c = ex.getStackTraceString()
        );
    }

    virtual
    public String getDmlExceptionMessage ( DmlException dmlException ) {
        return dmlException.getDmlMessage(0);
    }

}