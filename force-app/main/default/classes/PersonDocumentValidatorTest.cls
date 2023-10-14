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

}