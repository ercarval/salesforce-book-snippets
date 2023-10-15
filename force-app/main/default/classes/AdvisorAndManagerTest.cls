/**
 * @author eduardo.bisso - dev-builder
 */
@isTest
public class AdvisorAndManagerTest {

    @isTest
    public static void testAdvisorAndManager () {

        Advisor advisor = new Advisor();
        advisor.code = '123';
        advisor.name = 'Bisso';
        advisor.documentId = '123456789';
        advisor.salary = 5000;
        advisor.accounts = new List<Account>();

        System.debug ( JSON.serialize ( advisor ) );

        Manager manager = new Manager();
        manager.code = '344';
        manager.name = 'Super Manager';
        manager.documentId = '982338233';
        manager.salary = 15000;
        manager.advisors = new List<Advisor>();

        System.debug ( JSON.serialize ( manager ) );

    }

}