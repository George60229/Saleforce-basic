public class AccountTriggerHelper {
    private static Boolean isInUpdateProcess = false;

 private static Boolean isInUpdateProcessBefore = false;
   
 public static void handleBeforeInsert(List<Account> newAccounts) {
        
 }
 
    public static void handleBeforeUpdate(List<Account> oldAccounts, List<Account> newAccounts) {
        
        //12. triggers and order execution 
            Integer counter=0;
            
            for (Account account:newAccounts){
                account.Description='Test'+counter;
                counter++;
            }
            

            /**
             * 
             * Integer counter=0;
            List<Account> accs=new List<Account>();
            for (Account account:newAccounts){
                account.Description='Test'+counter;
                accs.add(new Account(
                    Id=account.Id,
                    Name=account.Name+' update'));
                counter++;
            }
                update accs;
             * 
             */
        }
        

    public static void handleBeforeDelete(List<Account> oldAccounts) {
        
    }

    public static void handleAfterInsert(List<Account> newAccounts) {
        
    }

    public static void handleAfterUpdate(List<Account> oldAccounts, List<Account> newAccounts) {
        if (!isInUpdateProcess) {
            List<Task> tasks = new List<Task>();
            List<Account> accountsToUpdate = new List<Account>();
            isInUpdateProcess = true;

            String ids = '';
            for (Account account : newAccounts) {
                if (account.Id != null) {
                    
                    accountsToUpdate.add(account);
                    ids += account.Id + '\n';
                }
            }
            update accountsToUpdate;
            
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(new String[] {'pashnev.mega@gmail.com'});
            mail.setSubject('List of id');
            mail.setPlainTextBody(ids);
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            isInUpdateProcess = false;
        }
    }

    public static void handleAfterDelete(List<Account> oldAccounts) {
        
    }

    public static void handleAfterUndelete(List<Account> restoredAccounts) {
        
    }

    @Future
    private static void addTask(String accountId){
        Task t = new Task();
        t.WhatId = accountId;
        t.Subject = 'Test Subject on Account Update';
        t.Is_Synced__c= false;
        insert t;
    }

    @Future
    private static void workWithContacts(String accountId){
        List<Contact> contacts=[SELECT Is_Synced__c,Processed_By_Queueble__c FROM Contact WHERE AccountId = :accountId];
        for (Contact contact : contacts) {
            contact.Is_Synced__c= false;
            contact.Processed_By_Queueble__c= true;
        }
    }




}