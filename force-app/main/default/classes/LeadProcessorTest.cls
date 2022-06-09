@isTest
public with sharing class LeadProcessorTest {
    @TestSetup
    static void setup(){
        
        List<Lead> leads = new List<Lead>();
        for(integer i = 0; i < 200; i++){
            leads.add(new Lead(LastName = 'Lead' + i,Company='Wipro'));
        }
        insert leads;
    }

    static testMethod void test(){
        
        Test.startTest();
        LeadProcessor myleads = new LeadProcessor();
        Id batchId = Database.executeBatch(myleads);
        Test.stopTest();
        
        system.assertEquals(200, [Select COUNT() From Lead Where LeadSource = 'Dreamforce']);
    }
}
