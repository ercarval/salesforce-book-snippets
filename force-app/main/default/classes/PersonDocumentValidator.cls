/**
 * @author eduardo.bisso
 */
public class PersonDocumentValidator {

    private Integer MAX_SIZE = 11;

    public Boolean isCPF ( String cpf ) {

        if (String.isEmpty(cpf)) return false;        
            
        cpf = removeMaskChars (cpf);

        if ( isNotNumeric (cpf) 
                || isGreaterThanMaxSize (cpf)
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
    String removeMaskChars (String value) {
        return value.replaceAll ( '\\.|-', '' );
    }

    Boolean isNotNumeric ( String value ) {
        return !value.isNumeric();
    }

    Boolean isGreaterThanMaxSize ( String value ) {
        return value.length() > MAX_SIZE;
    }

    Boolean isSameDigits ( String value ) {
        return Pattern.matches('^(\\d)\\1*$', value);
    }

    String paddingLeftWithZero (String value) {
        return value.leftPad(11, '0');
    }


    Integer toInt (List<String> values, Integer position ) {
        return Integer.valueOf( values.get(position) );
    }

    @TestVisible
    Integer calculateDigit( List<String> cpf, Integer weight, Integer iteration ) {
        
        Integer sum = 0;
        Integer rest;
        Integer num;
        
        for ( Integer i = 0; i < iteration; i++ ) {

            num = toInt ( cpf , i ); 
            sum += ( num * weight );
            weight--;

        }

        rest = 11 - ( Math.mod( sum, 11 ) );

        if ( rest == 10 || rest == 11 ) {
            return 0;
        } 
        
        return rest;
        
    }

}