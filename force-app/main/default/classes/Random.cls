@isTest
public class Random {

    public Enum CharacterSet  {
        NUMERIC, LOWER_ALPHA, UPPER_ALPHA,ALPHA, LOWER_ALPHA_NUMERIC, UPPER_ALPHA_NUMERIC, ALPHA_NUMERIC
    }

    public static final Map<CharacterSet, String> CHARSET_TABLE = new Map<CharacterSet, String> {

        CharacterSet.NUMERIC => '0123456789',
        CharacterSet.LOWER_ALPHA => 'abcdefghijklmnopqrstuvwxyz',
        CharacterSet.UPPER_ALPHA => 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
        CharacterSet.ALPHA => 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz',
        CharacterSet.LOWER_ALPHA_NUMERIC => '0123456789abcdefghijklmnopqrstuvwxyz',
        CharacterSet.UPPER_ALPHA_NUMERIC => 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',
        CharacterSet.ALPHA_NUMERIC => 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz'

    };

    public class RandomException extends Exception {
    }

    public static String generateText(Integer length)  {
        return generateString (length, CharacterSet.ALPHA);
    }

    public static String generateAlphaNumeric (Integer length) {
        return generateString (length, CharacterSet.ALPHA_NUMERIC);
    }

    public static Integer generateInteger(Integer length) {

        return Integer.valueOf(generateString(length, CharacterSet.NUMERIC));
    }

    public static Decimal generateDecimal(Integer length, Integer decimalPlaces) {

        if ((decimalPlaces == null) || (decimalPlaces < 0)) {

            decimalPlaces = 0;
        }

        if (decimalPlaces >= length) {

            throw new RandomException('Parameter "decimalPlaces" must be smaller than parameter "length".');
        }

        String decimalPlacesValue = (decimalPlaces == 0) ? '0' : generateString(decimalPlaces, CharacterSet.NUMERIC);
        String integerValue = generateString(length - decimalPlaces, CharacterSet.NUMERIC);

        return Decimal.valueOf(integerValue + '.' + decimalPlacesValue);
    }

    public static String generateString(Integer length, CharacterSet charSet) {

        if ((length == null) || (length < 1)) {

            throw new RandomException('Parameter "length" must be greater than zero.');
        }

        String chars = getCharacters(charSet);
        String[] result = new String[length];
        Integer index = 0;

        while (index < length) {

            Integer chr = Math.mod(Math.abs(Crypto.getRandomInteger()), chars.length());
            result[index++] = chars.substring(chr, chr + 1);
        }

        return String.join(result, '');
    }

    private static String getCharacters(CharacterSet charSet) {

        return CHARSET_TABLE.containsKey(charSet) 
                            ? CHARSET_TABLE.get(charSet)
                            : CHARSET_TABLE.get(CharacterSet.ALPHA_NUMERIC);
       
    }



}