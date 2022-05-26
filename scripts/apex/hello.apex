// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'Enter_your_name_here';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);

//My code starts from here

List<Account> AccList = [select id,name,Industry from account where Industry = 'Banking'];
List<Account> ListToUpdate = new List<Account>();
    for (Account Acc : AccList){
        if(Acc.Industry == 'Banking'){
            Acc.Phone = '8282869614';
            ListToUpdate.add(Acc);
        }
    }
Update ListToUpdate;

//next code

Contact josh = new Contact(FirstName='Josh', LastName='Kaplan',Department='Finance');
insert josh;
josh.Description = 'Josh\'s record has been updated by upsert operation';
Contact kathy = new Contact(FirstName='Kathy', LastName='Brown',Department='Technology');

List<Contact> contacts = new List<Contact> { josh, kathy};

upsert contacts;

Account[] AccountsDel = [Select id from Account where Phone = '8282869614'];
delete AccountsDel;

try{
    Account Acc = new Account(Phone = '8282869614');
    insert Acc;
}
catch (DmlException ErrorMessage){
    system.debug('A DML Exception Has Occured: ' + ErrorMessage.getMessage());
}