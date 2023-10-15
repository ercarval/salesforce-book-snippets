
public class CompanyDocumentValidator {

    public Boolean isCNPJ( String cnpj ) {

        if (String.isEmpty(cnpj)) return false;

        cnpj = keepNumeric(cnpj);
        
        if ( isNotNumeric (cnpj) 
            || isGreaterThanMaxSize (cnpj)
            || isSameDigits (cnpj)) {

            return false;
        
        } 
        
        cnpj = paddingLeftWithZero(cnpj);
        
        List<String> cnpjString = cnpj.split('');

        Integer digit13 = calculateDigitCNPJ( cnpjString, 5, 12 );
        Integer digit14 = calculateDigitCNPJ( cnpjString, 6, 13 );

        if ( digit13 != toInt( cnpjString, 12)  
                || digit14 != toInt( cnpjString, 13 ) ) {
            
            return false;
                
        } 

        return true;

    }

    private Integer calculateDigitCNPJ( List<String> cnpj, Integer weight, Integer iteration ) {

        Integer sum = 0;
        Integer rest;
        Integer num;

        for ( Integer i = 0; i < iteration; i++) {

            num = Integer.valueOf( cnpj.get(i) );
            sum += (num * weight);
            weight--;

            if ( weight < 2 ) weight = 9;

        }

        rest = Math.mod( sum, 11 );

        if ( rest < 2 ) return 0;

        return Integer.valueOf( 11 - rest );

    }

    public Integer getMaxSize() {
        return 14;
    }


    Boolean isNotNumeric ( String value ) {
        return !value.isNumeric();
    }

    Boolean isGreaterThanMaxSize ( String value ) {
        return value.length() > getMaxSize();
    }

    Boolean isSameDigits ( String value ) {
        return Pattern.matches('^(\\d)\\1*$', value);
    }

    String paddingLeftWithZero (String value) {
        return value.leftPad(getMaxSize(), '0');
    }


    Integer toInt (List<String> values, Integer position ) {
        return Integer.valueOf( values.get(position) );
    }    

    private String keepNumeric (String value) {

        if (String.isEmpty(value)) return value;

        return value.replaceAll('[^0-9]', '');
    }

}