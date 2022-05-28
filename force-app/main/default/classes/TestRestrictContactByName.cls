@isTest
private class TestRestrictContactByName {
    @isTest
    static void TestContact(){
        Contact con = new Contact(LastName = 'INVALIDNAME');
        insert con;
        
        test.startTest();
        database.SaveResult result = database.insert(con,false);
        test.stopTest();
        
        system.assert(!result.isSuccess());
        system.assert(result.getErrors().Size() > 0);
        system.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML', result.getErrors()[0].getMessage());

    }
    
    
}