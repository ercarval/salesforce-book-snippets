/**
 * @author eduardo.bisso - dev-builder
 */
public class Manager extends Employee {

    public List<Advisor> advisors;

    public Manager () {
    }
    
    public Manager (Decimal salary) {
        super(salary);
    }

    override
    public Decimal getBonus() {
        return this.salary * 2;
    }

}