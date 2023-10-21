/**
 * @author eduardo.bisso - dev-builder
 */
public with sharing class AccountTriggerHandler extends TriggerHandler {

    List<Account> newAccounts;
    Map<Id, Account> oldAccounts;

    AccountValidator validator;
    AccountEventEnricher enricher;

    public AccountTriggerHandler () {
        this ( (List<Account>) Trigger.new,
               (Map<Id, Account>) Trigger.oldMap );
    }

    public AccountTriggerHandler (List<Account> newAccounts
                            ,  Map<Id, Account> oldAccounts) {

        this.newAccounts = newAccounts;
        this.oldAccounts = oldAccounts;

        this.validator = new AccountValidator ();

        this.enricher = new AccountEventEnricher();

    }
    
    override
    public void beforeInsert () {
        validate();
    }
    
    override
    public void beforeUpdate() {
        validate();
    }

    override
    public void afterInsert() {
        scheduleFirstAdvisorMeeting();
        log ('Account Trigger after insert assíncrono');    
    }
    
    override
    public void afterUpdate() {
        log ('Account Trigger after Update assíncrono');    
    }

    private void validate () {
        this.validator.validate (this.newAccounts);    
    }

    private void scheduleFirstAdvisorMeeting () {
        this.enricher
            .scheduleFirstAdvisorMeeting (
                                    this.newAccounts);
    }
    
    void log (String message) {

        AsyncLogger.log ( message
                   , JSON.serialize ( this.newAccounts ) );

    }

}