@isTest
public class ProductFixtureFactory {

    public static Product2 create (String productName) {
        return create ( newProduct(productName) );
    }

    public static Product2 create(Product2 product) {
        insert product;
        return product;
    }

    public static Product2 newProduct(String productName) {
        return new Product2(
            Name = productName,
            Family = 'Teste'
        );
    }

}