/**
 * @author eduardo.bisso
 */
@isTest
public class PersonDocumentValidatorTest {

    @isTest                     
    public static void shouldReturnFalseForNullOrEmptyCpf () {
        
        PersonDocumentValidator validator
                         = new PersonDocumentValidator();                   
    
        System.assert (!validator.isCpf(null) 
                    , 'CPF Nulo NAO é valido' );

        Assert.isFalse ( validator.isCpf(null) 
                    , 'CPF Nulo NAO é valido');
        
        System.assert ( !validator.isCpf('') 
                    , 'CPF Nulo Vazio é valido' );
    
        Assert.isFalse ( validator.isCpf('') 
                    , 'CPF Vazio NAO é valido');
        

    }
}