CronTriggerRepository repository = new CronTriggerRepository();    

CronTrigger job = repository.findByName('PurgeLogJob');

System.abortJob ( job.Id );