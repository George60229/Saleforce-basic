global class SyncContactsBatchJob implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator([
            SELECT Id, MailingAddress, AccountId, Account.BillingAddress
            FROM Contact 
            WHERE IsSynced__c = false
            AND AccountId != null
        ]);
    }
    
    global void execute(Database.BatchableContext BC, List<Contact> contacts) {
        List<Account> accountsToUpdate = new List<Account>();
        for (Contact cont : contacts) {
           
            cont.MailingAddress = con.Account.BillingAddress;
        
            cont.IsSynced__c = true;
            Account acc = new Account(Id = con.AccountId, UpdatedByContact__c = true);
            accountsToUpdate.add(acc);
        }

        update scope;
        update accountsToUpdate;
    }
    
    global void finish(Database.BatchableContext BC) {
       
    }
}