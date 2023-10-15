/**
 * @author eduardo.bisso - dev-builder
 */
public class Analyst extends Employee {

    public List<Asset> assets;

    override
    public Decimal getBonus() {
        return super.getBonus() + 7000;
    }

}