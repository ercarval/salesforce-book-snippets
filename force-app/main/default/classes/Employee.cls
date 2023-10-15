/**
 * @author eduardo.bisso - dev-builder
 */
public abstract class Employee {

    public String code;

    public String name;

    public String documentId;

    public Decimal salary;

    public Employee () {

    }

    public Employee (Decimal salary) {
        this();
        this.salary = salary;
    }

    abstract
    public Decimal getBonus ();

}