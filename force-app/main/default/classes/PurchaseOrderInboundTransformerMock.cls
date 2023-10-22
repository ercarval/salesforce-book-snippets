@isTest
public class PurchaseOrderInboundTransformerMock extends PurchaseOrderInboundTransformer {
    
    override
    public String getDmlExceptionMessage ( DmlException dmlException ) {
        return dmlException.getMessage();
    }

}