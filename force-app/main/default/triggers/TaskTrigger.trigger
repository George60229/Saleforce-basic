trigger TaskTrigger on Task (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    TaskTriggerHandler handler = new TaskTriggerHandler();

    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            handler.beforeInsert(Trigger.new);
        } else if (Trigger.isUpdate) {
            handler.beforeUpdate(Trigger.old, Trigger.new);
        } else if (Trigger.isDelete) {
            handler.beforeDelete(Trigger.old);
        }
    } else if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            handler.afterInsert(Trigger.new);
        } else if (Trigger.isUpdate) {
            handler.afterUpdate(Trigger.old, Trigger.new);
        } else if (Trigger.isDelete) {
            handler.afterDelete(Trigger.old);
        } else if (Trigger.isUnDelete) {
            handler.afterUndelete(Trigger.new);
        }
    }
}