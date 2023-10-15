/**
 * @author eduardo.bisso - dev-builder
 */
@isTest
public class EmployeeTest {

    @isTest
    public static void testEmployees () {

        Advisor advisor = new Advisor();
        advisor.salary = 5000;
        Decimal advisorBonus = advisor.getBonus();    

        Assert.areEqual ( 10000, advisorBonus );

        Manager manager = new Manager();
        manager.salary = 15000;
        Decimal managerBonus = manager.getBonus();    
        
        Assert.areEqual ( 30000, managerBonus );

        Analyst analyst = new Analyst();
        analyst.salary = 10000;
        Decimal analystBonus = analyst.getBonus();    

        Assert.areEqual ( 17500, analystBonus );


        Director director = new Director();
        director.salary = 30000;
        Decimal directorBonus = director.getBonus();  
        
        Assert.areEqual ( 80000, directorBonus );

    }

}