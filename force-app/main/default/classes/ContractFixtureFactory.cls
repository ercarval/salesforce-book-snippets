/**
 * @author eduardo.bisso - dev-builder
 */
@isTest
public class ContractFixtureFactory {

    public static List<Contract> newDraftContracts ( List<Opportunity> opportunities ) { 

        return new List<Contract>();
    }

    public static Contract createContract() {
        return  createContract ( 'Test' );
    }

    public static Contract createContract(String name) {
        return  createContract ( newContract( name ) );
    }

    public static Contract newContract(String name) {
        return new Contract ( Name = name ); 
    }

    public static Contract newContract() {
        return newContract( 'Test' );
    }

    public static Contract createContract(Contract contract) {

        insert contract;
        return contract;

    }

    public static Contract fromJson (String payload) {
        return (Contract) JSON.deserialize(payload, Contract.class);
    }
    
    public static List<Contract> fromJsonArray (String payload) {
        return (List<Contract>) JSON.deserialize(payload, List<Contract>.class);
    }

}
