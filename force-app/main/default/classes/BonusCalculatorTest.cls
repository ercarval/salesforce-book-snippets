/**
 * @author eduardo.bisso - dev-builder
 */
@isTest
public class BonusCalculatorTest {
    
    @isTest
    public static void testTotalOfBonus () {
        
        BonusCalculator calculator = new BonusCalculator();
            
        calculator.calculateBonus ( new Advisor (10) );
        calculator.calculateBonus ( new Manager (10) );
        calculator.calculateBonus ( new Director (10));
        calculator.calculateBonus ( new Analyst (10));
        calculator.calculateBonus ( new LatamVicePresident (10));
        
        System.assertEquals (27170.50, calculator.getTotalBonus());
        
    }
}