/**
 * @author ercarval
 */
public class PersonDocumentValidator extends DocumentValidator {

    private Integer MAX_SIZE = 11;

    public Boolean isCPF( String cpf ) {

        if (String.isEmpty(cpf)) return false;        
               
        cpf = replaceMaskChars (cpf);

        if ( isNotNumeric (cpf) 
                || isGratherThanMaxSize (cpf)
                || isSameDigits (cpf)) {

            return false;
                
        } 
        
        cpf = paddingLeftWithZero(cpf);

        List<String> digits = cpf.split('');

        Integer digit10 = calculateDigit( digits, 10, 9 );
        Integer digit11 = calculateDigit( digits, 11, 10 );

        return ( digit10 == toInt( digits, 9 ) )
                 && ( digit11 == toInt( digits, 10 ) );
    }

    @TestVisible
    private Integer calculateDigit( List<String> cpf, Integer weight, Integer iteration ) {
        
        Integer sum = 0;
        Integer rest;
        Integer num;
        
        for ( Integer i = 0; i < iteration; i++ ) {

            num = Integer.valueOf( cpf.get(i) ); 
            sum += ( num * weight );
            weight--;

        }
    
        rest = 11 - ( Math.mod( sum, 11 ) );

        if ( rest == 10 || rest == 11 ) {
            return 0;
        } 
        
        return rest;
        
    }

    override
    public Integer getMaxSize() {
        return MAX_SIZE;
    }

}
