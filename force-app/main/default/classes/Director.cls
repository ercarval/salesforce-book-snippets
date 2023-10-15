/**
 * @author eduardo.bisso - dev-builder
 */
public class Director extends Employee {

    public Director () {
    }

    public Director (Decimal salary) {
        super(salary);
    }

    override
    public Decimal getBonus() {
        return this.salary * 2 + 20000;
    }

}