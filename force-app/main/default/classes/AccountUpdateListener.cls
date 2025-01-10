public with sharing class AccountUpdateListener {
    @InvocableMethod(label='Add some task')
    public static void changeTaskOwner(List<Id> accountIds) {
        List<Account> accounts = [
            SELECT Id, (SELECT Id,Subject FROM Tasks)
            FROM Account
            WHERE Id IN :accountIds
        ];
        
        List<Task> tasksToUpdate = new List<Task>();
        for (Account account : accounts) {
           
            if (account.Tasks.size() >= 3) {
      
                for (Task t : account.Tasks) {
                    tasksToUpdate.add(t);
                }
            }
        }

        if(tasksToUpdate.size()>0){
            User randomUser = getRandomActiveUser();
            updateTaskDetails(tasksToUpdate, randomUser.Id);
            sendTaskDetailsByEmail(randomUser.Id,tasksToUpdate);
            update tasksToUpdate;
        }
        
    }

    private static void updateTaskDetails(List<Task> tasks,String ownerId) {

        for (Task t : tasks) {
        t.OwnerId = ownerId;
    }
}
    
    private static User getRandomActiveUser() {
        List<User> activeUsers = [SELECT AccountId, Name FROM User LIMIT 100];
        if (!activeUsers.isEmpty()) {
            Integer randomIndex = Math.floor(Math.random() * activeUsers.size()).intValue();
            return activeUsers[randomIndex];
        } else {
            return null;
        }
    }

    private static void sendTaskDetailsByEmail(String userId,List<Task> tasks) {
        String tasksList = '';
        for (Task t : tasks) {
            tasksList += String.valueOf(t.Id) + ' - ' + t.Subject + ',';
        }
        String emailBody = 'Here are your tasks:\n'+tasksList;
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSubject('Your Task Details');
        mail.setPlainTextBody(emailBody);
        mail.setTargetObjectId(userId);
        mail.setTreatTargetObjectAsRecipient(true);
        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}