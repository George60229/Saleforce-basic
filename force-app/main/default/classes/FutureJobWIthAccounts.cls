public with sharing class FutureJobWIthAccounts {

    @Future
    public static void FutureJobWIthAccounts() {

        List<Contact> updatedContacts = new List<Contact>();
        List<Account> acounts=[select BillingCity,BillingCountry,BillingPostalCode,BillingState,BillingStreet,BillingLatitude,BillingLongitude  from Account Limit 150 ];
        for(Account acc:acounts){
           if(acc.BillingAddress!=null){
                List<Contact> contacts=acc.Contacts;
                for(Contact con:contacts){
                    con.Is_Synced__c=false;
                    con.Processed_By_Future__c = true;
                    updatedContacts.add(con);
            }
        }


        }
        update updatedContacts;
   
    }
}
    