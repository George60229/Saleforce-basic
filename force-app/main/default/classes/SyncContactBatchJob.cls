global class SyncContactBatchJob  implements Database.Batchable<sObject> {

   
    global Iterable<sObject> start(Database.BatchableContext BC) {
        List<Contact> contactList = [
            SELECT Id, AccountId, Account.BillingStreet, Account.BillingCity, 
                   Account.BillingState, Account.BillingPostalCode, Account.BillingCountry, 
                   MailingStreet, MailingCity, MailingState, MailingPostalCode, MailingCountry,
                   Is_Synced__c 
            FROM Contact 
            WHERE Is_Synced__c = false 
              AND AccountId != null
        ];
        return contactList;
    }

    global void execute(Database.BatchableContext BC, List<Contact> contacts) {
        Set<Id> accountIds = new Set<Id>();
        for (Contact c : contacts) {
            c.MailingStreet = c.Account.BillingStreet;
            c.MailingCity = c.Account.BillingCity;
            c.MailingState = c.Account.BillingState;
            c.MailingPostalCode = c.Account.BillingPostalCode;
            c.MailingCountry = c.Account.BillingCountry;
            c.Is_Synced__c = true;
            accountIds.add(c.AccountId);
        }
        update contacts;
        List<Account> accountsToUpdate = [SELECT Id, Updated_By_Contact__c FROM Account WHERE Id IN :accountIds];
        for (Account acc : accountsToUpdate) {
            acc.Updated_By_Contact__c = true;
            acc.Support_Tier__c='Bronze';
        }
        update accountsToUpdate;
    }

    public void finish(Database.BatchableContext BC) {
    }
}