/**
 * @author eduardo.bisso 
 */
public class GetLeadAddressOutboundService {
    
    GetAddressOutboundService outboundService;

    public GetLeadAddressOutboundService () {
        this.outboundService = new GetAddressOutboundService();
    }

    public Lead findAddressByZipCode ( Lead lead ) {
        
        ViaCepAddressResponse addressResponse = outboundService.findAddressByZipCode (lead.PostalCode);          
    
        lead.Street = addressResponse.logradouro;
        lead.City = addressResponse.localidade;
        lead.State = addressResponse.uf;
        lead.PostalCode = addressResponse.cep;
        
        return lead;
    }

}