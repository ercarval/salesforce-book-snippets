public class CompanyDocumentValidator extends DocumentValidator {

    public boolean isCNPJ( String cnpj ) {

        if (String.isEmpty(cnpj)) return false;

        cnpj = keepNumeric(cnpj);
        
        if ( isNotNumeric (cnpj) 
            || isGratherThanMaxSize (cnpj)
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

    override
    public Integer getMaxSize() {
        return 14;
    }

}