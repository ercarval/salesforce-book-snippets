/**
 * @author eduardo.bisso - dev-builder
 */
public class Analyst extends Employee {

    public List<Asset> assets;

    public Analyst() {
    }
    
    public Analyst(Decimal salary) {
        super(salary);
    }

    override
    public Decimal getBonus() {
        return this.salary * 1.05 + 7000;
    }

}