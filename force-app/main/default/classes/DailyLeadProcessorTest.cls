@isTest
private class DailyLeadProcessorTest {
    
    public static String CRON_EXP = '0 0 0 14 8 ? 2022';
    static testmethod void testScheduledJob() {
       
        List<Lead> leads = new List<Lead>();
        
        for (Integer i=0; i<200; i++) {
            Lead l = new Lead(LastName = 'lead test ' + i,Company = 'Test Company' );
            leads.add(l);
        }
        insert leads;
        
        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP,
            new DailyLeadProcessor());
        // Verify the scheduled job has not run yet.
        List<Lead> ld = [SELECT Id
            FROM Lead
            WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(0, ld.size(), 'Tasks exist before job has run');
        // Stopping the test will run the job synchronously
        Test.stopTest();
       List<Lead> ld2 = [SELECT Id
            FROM Lead
            WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(leads.size(),ld2.size(),'Tasks were not created');
    }
}