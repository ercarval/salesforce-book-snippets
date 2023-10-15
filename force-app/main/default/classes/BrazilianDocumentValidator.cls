public class BrazilianDocumentValidator {

    public Boolean isValid ( String documentNumber ) {

        return isCPF(documentNumber) 
                || isCNPJ(documentNumber);

    }

    public Boolean isCNPJ( String cnpj ) {
        return new CompanyDocumentValidator().isCNPJ(cnpj);        
    }

    public Boolean isCPF( String cpf ) {
        return new PersonDocumentValidator().isCPF(cpf);
    }

}