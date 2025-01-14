
Account result = [SELECT Id, Name, AccountNumber,Description
FROM Account
WHERE AccountNumber LIKE :'12323452'
LIMIT 1];

result.Description=result.Description+'test';
update result;
/**
 * Contact contact=new Contact();
contact.LastName='melnik';
contact.AccountId=result.Id;
insert contact;
 * 
 * 
 */


    

