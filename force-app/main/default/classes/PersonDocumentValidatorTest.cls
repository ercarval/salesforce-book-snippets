/**
 * @author eduardo.bisso
 */
@isTest
public class PersonDocumentValidatorTest {

    // Deve retornar false para CPF null ou vazio
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

    // Deve remover caracteres de mascara (###.###.###-##)
    @isTest                     
    public static void shouldRemoveMaskChars () {

        PersonDocumentValidator validator = new PersonDocumentValidator();
                
        String result = validator.removeMaskChars('XXX.XXX-AAA');
        
        Assert.areEqual ( 'XXXXXXAAA' , result  );
        
        // Caractere "/" inválido não será removido
        result = validator.removeMaskChars('111/ZZZ-XX');    
        
        Assert.areEqual ( '111/ZZZXX' , result ); 

    }

    @isTest                     
    public static void shouldReturnFalseForCpfWithText () {

        PersonDocumentValidator validator 
                    = new PersonDocumentValidator();
        
        String cpf = '111.444.777-XX';
                
        Boolean result = validator.isCpf(cpf);
            
        Assert.isFalse( result 
                , 'CPF 111.444.777-XX NAO é valido' );
        
        cpf = '111.444/777-11';

        Assert.isFalse( validator.isCpf( cpf ) 
                , 'CPF 111.444/777-11 NAO é valido' );

    }    

    @isTest                     
    public static void shouldReturnInvalidLengthForCpf () {

        PersonDocumentValidator validator 
                    = new PersonDocumentValidator();
        
        String cpf = '111.444.777-111';
                
        Boolean result = validator.isCpf(cpf);
            
        Assert.isFalse( result 
                , 'CPF 111.444.777-111 NAO é valido' );
        
        cpf = '9111.444.777-11';

        Assert.isFalse( validator.isCpf( cpf ) 
                , 'CPF 9111.444.777-11 NAO é valido' );

    }

    @isTest                     
    public static void shouldRejectSameDigits () {

        PersonDocumentValidator validator 
                        = new PersonDocumentValidator();
        
        String cpf = '###.###.###-##';
                
        for (Integer i = 0; i < 10; i++) {
                                    
            Boolean result 
                    = validator.isCpf(
                            cpf.replaceAll('#', i + ''));
                    
            Assert.isFalse ( result 
                        , 'CPF é Inválido' ); 

        }     

    }        

    @isTest
    static void shouldCalculateFirstCPFDigit () {

        PersonDocumentValidator validator 
                        = new PersonDocumentValidator();
        
        String cpf = '11144477735';
                
        List<String> digits = cpf.split('');

        Integer digit = validator.calculateDigit( digits, 10, 9 ); 
        
        Assert.areEqual ( 3 , digit );

    }

    @isTest
    static void shouldCalculateSecondCPFDigit () {

        PersonDocumentValidator validator 
                        = new PersonDocumentValidator();
        
        String cpf = '11144477735';
                
        List<String> digits = cpf.split('');

        Integer digit = validator.calculateDigit( digits, 11, 10 ); 
        
        Assert.areEqual ( 5 , digit );

    }


    @isTest
    static void shouldCalculateCPFDigitWithZeroRest () {

        PersonDocumentValidator validator 
                        = new PersonDocumentValidator();
        
        String cpf = '86989551003';
                
        List<String> digits = cpf.split('');

        Integer digit = validator.calculateDigit( digits, 10, 9 ); 
        
        Assert.areEqual ( 0 , digit );

    }
}