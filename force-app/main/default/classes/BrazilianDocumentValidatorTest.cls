@isTest
private class BrazilianDocumentValidatorTest {

    @isTest
    static void shouldValidateCnpj() {

        String cnpj = '93.320.424/0001-14';

        BrazilianDocumentValidator validator = new BrazilianDocumentValidator();

        System.assert(validator.isCnpj (cnpj));
        
        System.assert(validator.isCnpj ('08857729000190'));
        System.assert(validator.isCnpj ('8857729000190'));

        System.assertEquals( false, validator.isCnpj ('123456789'));
                                                      
        System.assertEquals( false, validator.isCnpj ('11111111111111'));
        System.assertEquals( false, validator.isCnpj ('22222222222222'));

    }

    @isTest
    static void shouldValidateCpf() {

        String cpf = '229.760.560-99';

        System.assert(new BrazilianDocumentValidator().isCpf (cpf), 'Should be a valid brazilian cpf number');
        
        System.assert(new BrazilianDocumentValidator().isCpf ('86989551003'), 'Should be a valid brazilian cpf number');

        System.assertEquals( false, new BrazilianDocumentValidator().isCpf ('123245678'));

    }



    @isTest
    static void shouldValidateDocument() {
        
        BrazilianDocumentValidator validator = new BrazilianDocumentValidator();

        System.assert(validator.isValid('86989551003'), 'Should be a valid brazilian cpf number');
        System.assert(validator.isValid('8857729000190'), 'Should be a valid brazilian cnpj number');

    }

}