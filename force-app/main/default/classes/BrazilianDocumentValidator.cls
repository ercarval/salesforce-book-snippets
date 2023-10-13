public class BrazilianDocumentValidator {

    public Boolean isValid ( String documentNumber ) {

        return isCPF(documentNumber) || isCNPJ(documentNumber);

    }

    public Boolean isCNPJ( String cnpj ) {
        
        if ( !matchSameNumbersRule (cnpj) || ( cnpj.length() != 14 )) {
            return false;
        }
        
        List<String> cnpjString = cnpj.split('');

        Integer digit13 = calculateDigitCNPJ( cnpjString, 5, 12 );
        Integer digit14 = calculateDigitCNPJ( cnpjString, 6, 13 );

        if ( digit13 != Integer.valueOf( cnpjString.get(12) ) || digit14 != Integer.valueOf( cnpjString.get(13) ) ) return false;

        return true;

    }

    private Boolean matchSameNumbersRule (String cnpj) {

        for (Integer i = 0; i < 10; i++) {
            if ( cnpj.countMatches( '' + i ) == cnpj.length() ) {
                return false;
            }
        }

        return true;

    }

    /**
     * MOVE THIS METHOD TO another class.
     */
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

    public boolean isCPF( String cpf ) {

        if ( Pattern.matches('^(\\d)\\1*$', cpf) || cpf.length() != 11) {
            return false;
        }

        List<String> cpfString = cpf.split('');

        Integer digit10 = calculateDigitCPF( cpfString, 10, 9 );
        Integer digit11 = calculateDigitCPF( cpfString, 11, 10 );

        return ( digit10 == Integer.valueOf( cpfString.get(9) ) ) && ( digit11 == Integer.ValueOf( cpfString.get(10) ) );
    }

    private Integer calculateDigitCPF( List<String> cpf, Integer weight, Integer iteration ) {
        
        Integer sum = 0;
        Integer rest;
        Integer num;
        Integer digit;
        
        for ( Integer i = 0; i < iteration; i++ ) {

            num = Integer.valueOf( cpf.get(i) ); 
            sum += ( num * weight );
            weight--;

        }

        rest = 11 - ( Math.mod( sum, 11 ) );

        if ( rest == 10 || rest == 11 ) {
            digit = 0;
        } else {
            digit = rest;
        }

        return digit;
    }

}