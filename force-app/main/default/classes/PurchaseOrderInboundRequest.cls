/**
 * @author eduardo.bisso - dev-builder
 */
global class PurchaseOrderInboundRequest {

    public String purchaseOrderNumber;

    public Date orderDate;

    public String accountCode;
    
    public Address shippingAddress;

    public Address billingAddress;

    public String paymentTerm;

    public String paymentMethod;

    public List<PurchaseItem> items;

    public class PurchaseItem {
    
        public Integer itemNumber;
        public String productCode;
        public Decimal quantity;
        public Decimal unitPrice;
        public String unitOfMeasure;

        public List<PurchaseSubItem> subItems;

        public PurchaseItem () {
            this.subItems = new List<PurchaseSubItem>();
        }    
    
    }

    public class PurchaseSubItem {
    
        public String productCode;
        public Decimal quantity;
        public Decimal unitPrice;
    
    }

    public class Address {
        public String street;
        public String streetNumber;
        public String streetComplement;
        public String city;
        public String state;
        public String postalCode;
    }
} 