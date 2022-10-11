/**
 * @author: ercarval - topi
 */
@isTest
private class BrazilianDocumentValidatorTest {

    @isTest
    static void shouldValidateCnpj() {

        String cnpj = '93320424000114';

        System.assert(new BrazilianDocumentValidator().isCnpj (cnpj));

        System.assertEquals( false, new BrazilianDocumentValidator().isCnpj ('123456789'));

        System.assertEquals( false, new BrazilianDocumentValidator().isCnpj ('11111111111111'));
        System.assertEquals( false, new BrazilianDocumentValidator().isCnpj ('22222222222222'));

    }

    @isTest
    static void shouldValidateCpf() {

        String cpf = '22976056099';

        System.assert(new BrazilianDocumentValidator().isCpf (cpf), 'Should be a valid brazilian cpf number');

        System.assertEquals( false, new BrazilianDocumentValidator().isCpf ('123245678'));

    }

}