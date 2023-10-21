/**
 * @author eduardo.bisso - dev-builder
 */
public class OrderRepository extends AbstractRepository {

    public Order findById (String id) {
        return [SELECT Id FROM Order WHERE Id =:id];
    }
    

}