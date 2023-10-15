/**
 * @author eduardo.bisso - dev-builder
 */
public  class AccountEventEnricher {

    TaskRepository repository;

    public AccountEventEnricher() {
        this.repository = new TaskRepository();
    }

    public List<Task> scheduleFirstAdvisorMeeting (List<Account> accounts) {

        List<Task> tasks = new List<Task>();

        for (Account account : accounts) {
            tasks.add( buildTask (account) );
        }
        
        return this.repository.save (tasks);

    }

    private Task buildTask (Account account) {

        return new Task(
            Subject = 'Lembre-se de entrar em contato com o Cliente ' + account.Name
            , Description = 'Entrar em contato para agendar a primeira reunião'
            , ActivityDate = Date.today().addDays(1)
            , WhatId = account.Id );
    
    }


}