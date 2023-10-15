/**
 * @author eduardo.bisso - dev-builder
 */
public class Director extends Employee {

    override
    public Decimal getBonus() {
        return this.salary * 2 + 20000;
    }

}