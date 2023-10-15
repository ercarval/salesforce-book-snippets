/**
 * @author ercarval
 */
public class PurchaseOrder {
    
    public String customerOrder;

    public Account account;

    public Address billingAddress;

    List<Item> items;

    public PurchaseOrder () {
        this.billingAddress = new Address();
        this.items = new List<Item>();
    }


    public PurchaseOrder (Account account) {
        this();
        this.account = account;
    }

    public PurchaseOrder (Account account, Address billingAddress) {
        this(account);
        this.billingAddress = billingAddress;
    }

    public PurchaseOrder (Account account,
                            String street,
                            String city,
                            String state,
                            String zipCode) {

        this();
        this.account = account;

        this.billingAddress = new Address(street, city, state, zipCode);
    }

    public class Address {
        public String street;
        public String addressNumber;
        public String addressAdditionalInfo;
        public String city;
        public String zipCode;
        public String state;
        public String country;

        public Address () {

        }

        public Address ( String street,
                        String city,
                        String state,
                        String zipCode ) {
            this();

            this.street = street;
            this.city = city;
            this.state = state;
            this.zipCode = zipCode;
        }

    }

    public class Item {
        
        public Decimal quantity;

        public Decimal price;
    
        public Decimal netPrice;

    }

}