/**
 * @author eduardo.bisso - dev-builder
 */
public virtual class LatamVicePresident extends Employee {

    public List<Director> directors;

    override
    public Decimal getBonus () {
        return this.salary * 10; // Nuooó!
    }

}