/**
 * @author eduardo.bisso - dev-builder
 */
public without sharing class OrderTriggerHandler extends TriggerHandler {
    
    List<Order> newOrders;

    Map<Id,Order> oldOrders;
    
    OrderFilter filter;

    OrderApprovalService approvalService;
    
    OrderApprovalEnricher orderApprovalEnricher;
    

    public OrderTriggerHandler() {
        this (  (List<Order> ) Trigger.new
            , (Map<Id, Order>) Trigger.oldMap );
    }

    public OrderTriggerHandler ( List<Order> newOrders, Map<Id, Order> oldOrders ) {

        this.newOrders = newOrders;
        this.oldOrders = oldOrders;         

        this.filter = new OrderFilter ();

        this.approvalService = new OrderApprovalService();

        this.orderApprovalEnricher = new OrderApprovalEnricher ();
                                   
    }


    override 
    public void beforeInsert () {

        this.enrichWithApprovers();

    } 

    override
    public void afterInsert () {

        this.sendToApproval ();

    }
    
    private void enrichWithApprovers () {

        List<Order> orders = this.filter.byNotCreditCardAndBoleto ( newOrders);

        orderApprovalEnricher.enrichWithApprovers ( orders ); 

    }

    private void sendToApproval () {
        
        List<Order> orders = this.filter.byNotCreditCardAndBoleto ( newOrders);

        approvalService.sendToApproval ( orders ); 
    
    }

}