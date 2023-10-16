/**
 * @author eduardo.bisso - dev-builder
 */
public inherited sharing virtual class OrderApprovalService {          

    public void sendToApproval ( List<Order> orders ) {
        
        List<Approval.ProcessSubmitRequest> requests = new List<Approval.ProcessSubmitRequest>();

        for (Order order : orders ) {
            requests.add ( buildRequest (order) );            
        }
        
        Approval.process(requests);
    }

    private Approval.ProcessSubmitRequest buildRequest (Order order) {
        
        Approval.ProcessSubmitRequest approvalRequest = new Approval.ProcessSubmitRequest();
        
        approvalRequest.setObjectId(order.Id);

        return approvalRequest;
		
    }

}