/**
 * @author eduardo.bisso - dev-builder
 */
@isTest
public class DraftContractEnricherTest {
    

    @isTest
    static void givenSomeAccountWith() {
        
        Mocker mocker = Mocker.startStubbing();

        OpportunityRepository opportunityRepository = (OpportunityRepository) mocker.mock(OpportunityRepository.class);

        Integer numberOfAccounts = 9;
        
        List<Account> accounts = AccountFixtureFactory.newAccountsWithFakeId (numberOfAccounts);
        
        Integer numberOfOpportunities = 20;
        
        List<Opportunity> openOpportunities =  OpportunityFixtureFactory.newOpenOppotunities ( accounts , numberOfOpportunities );
        
        mocker.when ( opportunityRepository.findOpenOpportunities ( Lists.toSetIds(accounts) ) )
                        .thenReturn( openOpportunities)
                        .shouldBeCalledOnce();
        
        List<Contract> expectedContracts = ContractFixtureFactory.newDraftContracts (openOpportunities);
        
        ContractRepository contractRepository = (ContractRepository) mocker.mock (ContractRepository.class);

        mocker.when ( contractRepository.save ( new List<Contract> ()) ) 
                            .withAnyValues()
                            .thenReturn( expectedContracts )
                            .shouldBeCalledOnce();

        mocker.stopStubbing(); 

        DraftContractEnricher enricher = new DraftContractEnricher();
        enricher.repository = contractRepository;
        enricher.opportunityRepository = opportunityRepository;

        List<Contract> storedContracts;

        storedContracts = enricher.createDraftContacts (accounts);

        mocker.assert(); // -- aqui esta o pulo do gato

        Assert.isFalse ( storedContracts.isEmpty() );

    }

    @isTest
    public static void givenInvalidContractWhenSaveThenThrowException () {
        
        Mocker mocker = Mocker.startStubbing();

        List<Account> accounts = AccountFixtureFactory.newAccountsWithFakeId (5);

        DraftContractEnricher mockedEnricher = (DraftContractEnricher) 
                                mocker.mock(DraftContractEnricher.class); 

        // outros mocks omitidos

        mocker.when ( mockedEnricher.save ( new List<Contract>() ) )
                    .thenThrow ( 
                        new DmlException ('UNABLE TO LOCK ROW')
                    );

        mocker.stopStubbing(); 

        try {
            // vai gerar um erro 
            mockedEnricher.createDraftContacts (accounts);

            Assert.fail();

        } catch ( DmlException e ) {
        
            Assert.isTrue ( e != null );

        }  
    }

}