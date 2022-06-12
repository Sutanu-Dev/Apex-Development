public with sharing class AddPrimaryContact implements Queueable{
    
    private Contact con;
    private String state;

    public addPrimaryContact(Contact cont, String abState){
       this.con = cont;
       this.state = abState;

    }
    public void execute(QueueableContext context){
        List<Account> accounts = [Select Id,Name,(Select Id,FirstName,LastName From Contacts)
                                From Account Where BillingState = :state Limit 200];
        List<Contact> PrimaryContacts = new List<Contact>();
        for(Account acc : accounts){
            Contact c = con.clone();
            c.AccountId = acc.Id;
            primaryContacts.add(c);
        }
        if (PrimaryContacts.size() > 0){
            insert PrimaryContacts;
        }

        
    }
}
