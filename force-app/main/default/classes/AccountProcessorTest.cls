@isTest
private class AccountProcessorTest {
    @isTest
    private static void TestAccountField(){
        Account newAcc = new Account(Name = 'Test Account');
        insert newAcc;
        
        Contact newCon1 = new Contact(LastName= 'Test Con 1', AccountId= newAcc.Id);
        insert newCon1;
        
        Contact newCon2 = new Contact(LastName= 'Test Con 2', AccountId= newAcc.Id);
        insert newCon2;
        
        List<Id> accountIds = new List<Id>();
        accountIds.add(newAcc.Id);
        
        
        
        test.startTest();
        AccountProcessor.countContacts(accountIds);
        test.stopTest();
        
        system.assertEquals(2, newAcc.Number_Of_Contacts__c);
    }

}