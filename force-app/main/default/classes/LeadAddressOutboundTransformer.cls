/**
 * @author eduardo.bisso 
 */
public class LeadAddressOutboundTransformer {

    public Lead toLead ( ViaCepAddressResponse response, Lead lead ) {

        lead.Street = response.logradouro;
        lead.City = response.localidade;
        lead.State = response.uf;
        lead.PostalCode = response.cep;

        return lead;
    }

}