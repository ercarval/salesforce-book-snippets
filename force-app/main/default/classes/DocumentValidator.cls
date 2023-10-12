public abstract class DocumentValidator {

    protected String replaceMaskChars (String value) {
        return value.replaceAll ( '\\.|-', '' );
    }

    protected Boolean isNotNumeric ( String value ) {
        return !value.isNumeric();
    }
    
    protected Boolean isGratherThanMaxSize ( String value ) {
        return value.length() > getMaxSize ();
    }

    protected Boolean isSameDigits ( String value ) {
        return Pattern.matches('^(\\d)\\1*$', value);
    }

    protected String paddingLeftWithZero (String value) {
        return value.leftPad(getMaxSize (), '0');
    }

    protected Integer toInt (List<String> values, Integer position ) {

        return Integer.valueOf( values.get(position) );
        
    }

    public String keepNumeric (String text) {        

        if (String.isEmpty(text)) return text;

        return text.replaceAll('[^0-9]', '');
    }

    public abstract Integer getMaxSize ();

}