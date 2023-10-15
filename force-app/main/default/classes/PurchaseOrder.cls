/**
 * @author ercarval
 */
public class PurchaseOrder {
    
    public String customerOrder;

    public Account account;

    public BillingAddress billingAddress;

    List<Item> items;

    public PurchaseOrder () {
        this.billingAddress = new BillingAddress();
        this.items = new List<Item>();
    }


    public PurchaseOrder (Account account) {
        this();
        this.account = account;
    }

    public PurchaseOrder (Account account, BillingAddress billingAddress) {
        this(account);
        this.billingAddress = billingAddress;
    }

    public class Item {
        
        public Decimal quantity;

        public Decimal price;
    
        public Decimal netPrice;

    }

}