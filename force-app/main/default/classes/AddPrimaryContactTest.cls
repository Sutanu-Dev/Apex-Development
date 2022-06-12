@isTest
private class AddPrimaryContactTest {
     @TestSetup
     static void setup(){
        
        List<Account> accList = new List<Account>();
        for(Integer i = 0; i < 50; i++){
            accList.add(new Account(Name = 'testNY' + i ,BillingState = 'NY')) ;
        }
        for(Integer j = 0; j < 50; j++){
            accList.add(new Account(Name = 'testCA' + j ,BillingState = 'CA')) ;
        }
        insert accList;

        Contact pCon = new Contact(FirstName = 'first', LastName = 'Last CA');
        insert pCon;

     }
     static testMethod void testQueueble(){
        
        Contact PriCon = [Select Id,FirstName,LastName From Contact Where LastName = 'Last CA'];
        AddPrimaryContact newCon = new AddPrimaryContact(PriCon, 'CA');
        Test.startTest();
        System.enqueueJob(newCon);
        Test.stopTest();
        
        system.assertEquals(50, [Select COUNT() From Contact Where AccountId in 
                            (Select Id from Account where BillingState= 'CA')]);
     }
}