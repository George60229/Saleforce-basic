global with sharing class ScheduableBatchJobs implements Schedulable {
    global void execute(SchedulableContext SC) {
        SyncContactBatchJob jobContact = new SyncContactBatchJob(); 
        Id first = Database.executeBatch(jobContact);


        SyncTaskBatchJob jobTask=new SyncTaskBatchJob();

        Id second = Database.executeBatch(jobTask);
    }
}