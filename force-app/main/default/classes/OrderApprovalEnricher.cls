/**
 * @author eduardo.bisso - dev-builder
 */
public inherited sharing virtual class OrderApprovalEnricher { 

    OrderApproverRepository repository;

    public OrderApprovalEnricher() {
        this.repository = new OrderApproverRepository();
    }

    public void enrichWithApprovers ( List<Order> orders ) {

        List<OrderApprover__c> approvers = findApprovers ( orders );
                
        enrich ( orders, approvers );

    }

    private List<OrderApprover__c> findApprovers ( List<Order> orders ) {
        
        List<String> accountIds = Lists.pullField(orders, 'AccountId');

        return repository.findByAccounts ( accountIds ); 
    
    }
    
    private void enrich ( List<Order> orders, List<OrderApprover__c> approvers ) {
        
     
        Map<String, OrderApprover__c> approversByAccount;

        
        for (Order order : orders ) {
        
            enrich ( order , approversByAccount.get (order.AccountId) );

        }

    }

    private void enrich ( Order order, OrderApprover__c approver ) {
        
        order.CarrierApprover__c = approver.Carrier__c;
        order.FinancialApprover__c = approver.Financial__c;       
        order.CommercialApprover__c = approver.Commercial__c;
        
    }

}