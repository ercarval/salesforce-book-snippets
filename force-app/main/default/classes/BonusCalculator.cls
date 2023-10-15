/**
 * @author eduardo.bisso - dev-builder
 */
public class BonusCalculator {

    Decimal totalBonus;

    public BonusCalculator () {
        this.totalBonus = 0;
    }

    public Decimal calculateBonus ( Employee employee ) {
        return this.totalBonus += employee.getBonus();
    }

    public Decimal getTotalBonus () {
        return this.totalBonus;
    } 

}