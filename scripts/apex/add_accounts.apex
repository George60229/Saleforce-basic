List<Account> accts = new List<Account>();
for (Integer i = 0; i <1000; i++) {
    Account account=new Account();
    account.Name='Generated';
    account.AccountNumber=i.toString();
    account.Description='New Description';
    accts.add(account);
}
insert accts;