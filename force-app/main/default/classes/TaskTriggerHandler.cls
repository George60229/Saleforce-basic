public class TaskTriggerHandler {
    public void beforeInsert(List<Task> newTasks) {
        TaskTriggerHelper.handleBeforeInsert(newTasks);
    }

    public void beforeUpdate(List<Task> oldTasks, List<Task> newTasks) {
        TaskTriggerHelper.handleBeforeUpdate(oldTasks, newTasks);
    }

    public void beforeDelete(List<Task> oldTasks) {
        TaskTriggerHelper.handleBeforeDelete(oldTasks);
    }

    public void afterInsert(List<Task> newTasks) {
        TaskTriggerHelper.handleAfterInsert(newTasks);
    }

    public void afterUpdate(List<Task> oldTasks, List<Task> newTasks) {
        TaskTriggerHelper.handleAfterUpdate(oldTasks, newTasks);
    }

    public void afterDelete(List<Task> oldTasks) {
        TaskTriggerHelper.handleAfterDelete(oldTasks);
    }

    public void afterUndelete(List<Task> restoredTasks) {
        TaskTriggerHelper.handleAfterUndelete(restoredTasks);
    }
}