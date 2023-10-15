/**
 * @author eduardo.bisso - dev-builder
 */
public class BillingAddress {

    public String street;
    public String addressNumber;
    public String addressAdditionalInfo;
    public String city;
    public String zipCode;
    public String state;
    public String country;

    public BillingAddress () {
    }

    public BillingAddress withStreet (String street) {
        this.street = street;
        return this;
    }

    public BillingAddress withAddressNumber (String addressNumber) {
        this.addressNumber = addressNumber;
        return this;
    }

    public BillingAddress withAddressAdditionalInfo (String addressAdditionalInfo) {
        this.addressAdditionalInfo = addressAdditionalInfo;
        return this;
    }

    public BillingAddress withCity (String city) {
        this.city = city;
        return this;
    }

    public BillingAddress withZipCode (String zipCode) {
        this.zipCode = zipCode;
        return this;
    }

    public BillingAddress withState (String state) {
        this.state = state;
        return this;
    }

    public BillingAddress withcountry (String country) {
        this.country = country;
        return this;
    }



}