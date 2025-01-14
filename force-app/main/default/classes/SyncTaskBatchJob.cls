global class SyncTaskBatchJob implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator([
            SELECT Id, Account.Owner.Name, Account_Owner__c, Is_Synced__c, AccountId
            FROM Task
            WHERE Is_Synced__c = false
            AND AccountId != null
        ]);
    }

    global void execute(Database.BatchableContext BC, List<Task> tasks) {
        Set<Id> accountIds = new Set<Id>();
        for(Task t : tasks) {
            t.Is_Synced__c = true;
            accountIds.add(t.AccountId);
        }
        update tasks;
        List<Account> accountsToUpdate = [SELECT Id, Updated_By_Contact__c FROM Account WHERE Id IN :accountIds];
        for(Account a : accountsToUpdate) {
            a.Updated_By_Task__c = true;
            a.Support_Tier__c='Bronze';
        }
        update accountsToUpdate;
    }

    public void finish(Database.BatchableContext BC) {
    }
}