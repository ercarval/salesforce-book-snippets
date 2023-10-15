/**
 * @author eduardo.bisso - dev-builder
 */
public class Advisor extends Employee {

    public List<Account> accounts;

    public Advisor () {
    }

    public Advisor (Decimal salary) {
        super(salary);
    }

    override
    public Decimal getBonus() {
        return this.salary * 2;
    }

}