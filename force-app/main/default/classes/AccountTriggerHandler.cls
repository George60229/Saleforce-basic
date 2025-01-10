public class AccountTriggerHandler {
    public void beforeInsert(List<Account> newAccounts) {
        AccountTriggerHelper.handleBeforeInsert(newAccounts);
    }

    public void beforeUpdate(List<Account> oldAccounts, List<Account> newAccounts) {
        AccountTriggerHelper.handleBeforeUpdate(oldAccounts, newAccounts);
    }

    public void beforeDelete(List<Account> oldAccounts) {
        AccountTriggerHelper.handleBeforeDelete(oldAccounts);
    }

    public void afterInsert(List<Account> newAccounts) {
        AccountTriggerHelper.handleAfterInsert(newAccounts);
    }

    public void afterUpdate(List<Account> oldAccounts, List<Account> newAccounts) {
        AccountTriggerHelper.handleAfterUpdate(oldAccounts, newAccounts);
    }

    public void afterDelete(List<Account> oldAccounts) {
        AccountTriggerHelper.handleAfterDelete(oldAccounts);
    }

    public void afterUndelete(List<Account> restoredAccounts) {
        AccountTriggerHelper.handleAfterUndelete(restoredAccounts);
    }

    
}