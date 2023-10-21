/**
 * @author eduardo.bisso - dev-builder
 */
public class OrderFilter {

    public List<Order> byNotCreditCardAndBoleto ( List<Order> orders ) {
        return orders;
    }

    public List<Order> byChangedStatus ( List<Order> newOrders
                                        , Map<Id, Order> oldOrders
                                        , String status ) {
        return newOrders;
    }

}