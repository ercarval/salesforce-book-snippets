/**
 * @author eduardo.bisso - dev-builder
 */
@isTest
public class InactivateOriginalContractEnricherTest {

    @isTest
    public static void givenAmendmentContractsWhenAssignedThenInactivateOriginalContracts() {

        //given
        Mocker mocker = Mocker.startStubbing();

        ContractRepository contractRepositoryMock = (ContractRepository) mocker.mock( ContractRepository.class );     

        String originalContractsPayload =  '[{ "Id": "8008c000001dSGIAA2", "Status": "Assinado", "AccountId": "0018c000028ktwCAAQ" }]';

        List<Contract> originalContracts = ContractFixtureFactory.fromJsonArray (originalContractsPayload);

        // gravando o comportamento do mock
        mocker.when( contractRepositoryMock.findByIds( new List<String>{''}))
                                .withAnyValues()
                                .thenReturn(originalContracts)
                                .shouldBeCalledOnce();

        String expectedContractsPayload  =  '[{ "Id": "8008c000001dSGIAA2", "Status": "Inative", "AccountId": "0018c000028ktwCAAQ" }]';

        List<Contract> expectedContracts = ContractFixtureFactory.fromJsonArray (expectedContractsPayload);
                        

        mocker.when( contractRepositoryMock.save( expectedContracts ))
                                .thenReturn(expectedContracts)
                                .shouldBeCalledOnce();

        mocker.stopStubbing();

        // redeterminando o comportamento original
        InactivateOriginalContractEnricher enricher = new InactivateOriginalContractEnricher();
        enricher.setRepository(contractRepositoryMock);

        String assignedContractsPayload = '[{ "Id": "8008c000001dSGNAA2", "Status": "Assinado", "AccountId": "0018c000028ktwCAAQ", "OriginalContract__c": "8008c000001dSGIAA2"}]';
        
        List<Contract> assignedContracts = ContractFixtureFactory.fromJsonArray (assignedContractsPayload);

        
        //when

        List<Contract> inactivatedContracts = enricher.inactivatedBy(assignedContracts);

        //then
        mocker.assert();

        Assert.isFalse ( inactivatedContracts.isEmpty() );       

        Assert.areEqual ( 'Inativo', inactivatedContracts.get(0).Status );

        
    }

}