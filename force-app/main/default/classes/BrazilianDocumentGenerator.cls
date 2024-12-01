
/**
 * Based on https://receitasdecodigo.com.br/java/classe-java-completa-para-gerar-e-validar-cpf-e-cnpj
 */
@isTest
public class BrazilianDocumentGenerator {

    public static String buildCpf () {
		Integer n = 9;

		Integer n1 = random(n);
		Integer n2 = random(n);
		Integer n3 = random(n);
		Integer n4 = random(n);
		Integer n5 = random(n);
		Integer n6 = random(n);
		Integer n7 = random(n);
		Integer n8 = random(n);
		Integer n9 = random(n);
		Integer d1 = n9 * 2 + n8 * 3 + n7 * 4 + n6 * 5 + n5 * 6 + n4 * 7 + n3 * 8 + n2 * 9 + n1 * 10;

		d1 = 11 - (Math.mod(d1, 11));

		if (d1 >= 10) {
            d1 = 0;
        }
		
		Integer d2 = d1 * 2 + n9 * 3 + n8 * 4 + n7 * 5 + n6 * 6 + n5 * 7 + n4 * 8 + n3 * 9 + n2 * 10 + n1 * 11;

		d2 = 11 - (Math.mod(d2, 11));

		if (d2 >= 10) d2 = 0;
		
		return '' + n1 + n2 + n3 + n4 + n5 + n6 + n7 + n8 + n9 + d1 + d2;
	}

    public static String buildCnpj () {

        Integer n = 9;
		Integer n1 = random(n);
		Integer n2 = random(n);
		Integer n3 = random(n);
		Integer n4 = random(n);
		Integer n5 = random(n);
		Integer n6 = random(n);
		Integer n7 = random(n);
		Integer n8 = random(n);
		Integer n9 = 0;
		Integer n10 = 0;
		Integer n11 = 0;
		Integer n12 = 1;
		Integer d1 = n12 * 2 + n11 * 3 + n10 * 4 + n9 * 5 + n8 * 6 + n7 * 7 + n6 * 8 + n5 * 9 + n4 * 2 + n3 * 3 + n2 * 4 + n1 * 5;

		d1 = 11 - (Math.mod(d1, 11));

		if (d1 >= 10) d1 = 0;

		Integer d2 = d1 * 2 + n12 * 3 + n11 * 4 + n10 * 5 + n9 * 6 + n8 * 7 + n7 * 8 + n6 * 9 + n5 * 2 + n4 * 3 + n3 * 4 + n2 * 5 + n1 * 6;

		d2 = 11 - (Math.mod(d2, 11));

		if (d2 >= 10) d2 = 0;

		return '' + n1 + n2 + n3 + n4 + n5 + n6 + n7 + n8 + n9 + n10 + n11 + n12 + d1 + d2;
    }
    
    private static Integer random (Integer n) {
        return (Integer) (Math.random() * n);
    }

    @isTest
    public static void buildCnpjTest() {

        Set<String> documents = new Set<String>();

        for (Integer i = 0; i < 5; i++) {
            documents.add( buildCnpj() );
        }

        System.assert( documents.size() == 5 );

        BrazilianDocumentValidator validator = new BrazilianDocumentValidator();

        for ( String document : documents ) {
            System.assert( validator.isCNPJ(document) );
        }

    }

    @isTest
    public static void buildCpfTest() {

        Set<String> documents = new Set<String>();

        for (Integer i = 0; i < 5; i++) {
            documents.add( buildCpf() );
        }

        Assert.areEqual(5, documents.size());

        BrazilianDocumentValidator validator = new BrazilianDocumentValidator();

        for ( String document : documents ) {
            Assert.isTrue( validator.isCPF(document) );
        }

    }

}