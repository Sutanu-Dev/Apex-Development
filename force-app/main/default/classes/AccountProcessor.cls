public class AccountProcessor {
    @future
    public static void countContacts(List<Id> AccountIds){
        List<Account> accountsToUpdate = new List<Account>();
        List<Account> accounts = [Select Id,Name,(Select Id from Contacts) From Account Where Id In :AccountIds];
        For(Account a :accounts){
            List<Contact> contactList = a.Contacts;
            a.Number_Of_Contacts__c = contactList.size();
            accountsToUpdate.add(a);
        }
        update accountsToUpdate;
    }

}