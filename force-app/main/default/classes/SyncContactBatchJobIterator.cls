global class SyncContactsBatchJobIterator implements Database.Batchable<sObject> {
    
    global Iterable<sObject> start(Database.BatchableContext BC) {
        return new ContactIterable();
    }
    
    global void execute(Database.BatchableContext BC, List<Contact> contacts) {
        List<Account> accountsToUpdate = new List<Account>();

        for (Contact con : contacts) {
            con.MailingStreet = con.Account.BillingStreet;
            con.Is_Synced__c = true;

            Account acc = new Account(Id = con.AccountId, UpdatedByContact__c = true);
            accountsToUpdate.add(acc);
        }

        update contacts;
        update accountsToUpdate;
    }
    
    global void finish(Database.BatchableContext BC) {
        
    }
}