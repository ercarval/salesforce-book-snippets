/**
 * @author eduardo.bisso - dev-builder
 */
global class PurchaseOrderInboundResponse {

    public String id;

    public PurchaseOrderInboundResponse(String id) {
        this.id = id;
    }

    public String toJson () {
        return JSON.serialize(this);
    }
    
}