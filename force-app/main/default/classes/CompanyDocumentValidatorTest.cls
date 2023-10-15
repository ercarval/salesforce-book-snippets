@isTest
public class CompanyDocumentValidatorTest {

    @isTest
    static void shouldValidateCnpj() {

        String cnpj = '93320424000114';

        System.assert(new BrazilianDocumentValidator().isCnpj (cnpj));

        System.assertEquals( false, new BrazilianDocumentValidator().isCnpj ('123456789'));

        System.assertEquals( false, new BrazilianDocumentValidator().isCnpj ('11111111111111'));
        System.assertEquals( false, new BrazilianDocumentValidator().isCnpj ('22222222222222'));

    }

}