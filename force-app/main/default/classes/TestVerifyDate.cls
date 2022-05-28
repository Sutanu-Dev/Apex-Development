@isTest
private class TestVerifyDate {
    
    @isTest
    static void TestCheckDates(){
        date d = VerifyDate.CheckDates(date.parse('05/28/2022'),date.parse('06/15/2022'));
        system.assertEquals(date.parse('06/15/2022'), d);
    }
     @isTest
    static void TestCheckDates1(){
        date d = VerifyDate.CheckDates(date.parse('05/28/2022'),date.parse('06/30/2022'));
        system.assertEquals(date.parse('05/31/2022'), d);
    }
    @isTest
    static void TestCheckDates2(){
      Boolean d =  VerifyDate.DateWithin30Days(date.parse('05/28/2022'), date.parse('05/27/2022'));
        system.assertEquals(false, d);
    }
     @isTest
    static void TestCheckDates3(){
      Boolean d =  VerifyDate.DateWithin30Days(date.parse('05/28/2022'), date.parse('06/30/2022'));
        system.assertEquals(false, d);
    }
     @isTest
    static void TestCheckDates4(){
      Boolean d =  VerifyDate.DateWithin30Days(date.parse('05/28/2022'), date.parse('05/28/2022'));
        system.assertEquals(false, d);
    }
     @isTest
    static void TestCheckDates5(){
      Boolean d =  VerifyDate.DateWithin30Days(date.parse('05/28/2022'), date.parse('05/29/2022'));
        system.assertEquals(true, d);
    }
    @isTest
    static void TestCheckDates6(){
        date d = VerifyDate.SetEndOfMonthDate(date.parse('05/28/2022'));
        system.assertEquals(date.parse('05/31/2022'), d);
    }
    
}