/**
 * @author eduardo.bisso - dev-builder
 */
public class Advisor extends Employee {

    public List<Account> accounts;

    override
    public Decimal getBonus() {
        return this.salary * 2;
    }

}