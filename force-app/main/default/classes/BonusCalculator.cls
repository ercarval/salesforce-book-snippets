/**
 * @author eduardo.bisso - dev-builder
 */
public class BonusCalculator {

    Decimal totalBonus;

    public BonusCalculator () {
        this.totalBonus = 0;
    }

    public Decimal calculateBonus ( Advisor advisor ) {
        return this.totalBonus += advisor.getBonus();
    }

    public Decimal calculateBonus ( Manager manager ) {
        return this.totalBonus += manager.getBonus();
    }

    public Decimal calculateBonus ( Director director ) {
        return this.totalBonus += director.getBonus();
    }

    public Decimal calculateBonus ( Analyst analyst ) {
        return this.totalBonus += analyst.getBonus();
    }

    public Decimal calculateBonus ( LatamVicePresident vpLatam ) {
        return this.totalBonus += vpLatam.getBonus();
    }

    public Decimal getTotalBonus () {
        return this.totalBonus;
    } 

}