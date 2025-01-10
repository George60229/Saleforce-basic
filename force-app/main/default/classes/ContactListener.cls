public with sharing class ContactListener
 {
    @InvocableMethod(label='Create Task for New Contact')
    public static List<Task> createTaskForNewContact(List<Contact> contacts) {
        List<Task> tasksToCreate = new List<Task>();
        for (Contact contact : contacts) {
                tasksToCreate.add(new Task(
                    Subject = 'Negotiations with ' + contact.LastName,
                    WhatId=contact.AccountId
                ));
        }
       
        insert tasksToCreate;
        
        return tasksToCreate;
    }
}
