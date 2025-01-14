public class TaskTriggerHelper {
    public static void handleBeforeInsert(List<Task> newTasks) {
        
    }

    public static void handleBeforeUpdate(List<Task> oldTasks, List<Task> newTasks) {

        /**
         *  for (Task task : newTasks) {
            if(task.Subject.equals('Test UI Name')){
                task.addError('This subject cannot be changed');
            }
            task.Subject = 'Test Name'; 
        }
         */
       
    }

    public static void handleBeforeDelete(List<Task> oldTasks) {
        
    }

    public static void handleAfterInsert(List<Task> newTasks) {
        
    }

    public static void handleAfterUpdate(List<Task> oldTasks, List<Task> newTasks) {
        
    }

    public static void handleAfterDelete(List<Task> oldTasks) {
       
    }

    public static void handleAfterUndelete(List<Task> restoredTasks) {
       
    }
}