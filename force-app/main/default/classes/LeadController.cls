/**
 * @author: eduardo.bisso
 */
@RestResource (urlMapping='/api/lead/*')
global class LeadController {
    
    @HttpPost
    global static Lead create (Lead lead) {
        LeadRepository repository = new LeadRepository();
        return (Lead) repository.save(lead);
    }

    @HttpPut
    global static Lead store (Lead lead) {
        LeadRepository repository = new LeadRepository();
        return (Lead) repository.save(lead);
    }

    @HttpGet
    global static Lead findById () {

        String id = RestContext.request.params.get('id');        

        LeadRepository repository = new LeadRepository();

        return repository.findById(id);        

    }

    @HttpDelete
    global static void remove () {

        String id = RestContext.request.params.get('id');        

        LeadRepository repository = new LeadRepository();

        repository.remove( new Lead ( Id = id) );
        
    }

}