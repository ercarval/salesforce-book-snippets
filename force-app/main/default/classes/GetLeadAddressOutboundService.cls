/**
 * @author eduardo.bisso 
 */
public class GetLeadAddressOutboundService {
    
    GetAddressOutboundService outboundService;
    LeadAddressOutboundTransformer transformer;

    public GetLeadAddressOutboundService () {
        this.outboundService = new GetAddressOutboundService();
        this.transformer = new LeadAddressOutboundTransformer();
    }

    public Lead findAddressByZipCode ( Lead lead ) {
        
        ViaCepAddressResponse addressResponse = outboundService.findAddressByZipCode (lead.PostalCode);          
        
        return transformer.toLead (addressResponse, lead);;
    }

}