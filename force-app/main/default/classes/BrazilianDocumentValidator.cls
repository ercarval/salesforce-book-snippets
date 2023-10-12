public class BrazilianDocumentValidator {
   
    public Boolean isCNPJ( String cnpj ) {
        
        return new CompanyDocumentValidator().isCNPJ(cnpj);
   
    }

    public Boolean isCPF( String cpf ) {

        return new PersonDocumentValidator().isCPF(cpf);

    }

}