/**
 * @author eduardo.bisso - dev-builder
 */
public class Manager extends Employee {

    public List<Advisor> advisors;

    override
    public Decimal getBonus() {
        return this.salary * 2;
    }

}