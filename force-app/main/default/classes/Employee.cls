/**
 * @author eduardo.bisso - dev-builder
 */
public virtual class Employee {

    public String code;

    public String name;

    public String documentId;

    public Decimal salary;

    virtual
    public Decimal getBonus () {
        return 0;
    }

}