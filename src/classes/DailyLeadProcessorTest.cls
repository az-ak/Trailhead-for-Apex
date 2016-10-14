@isTest
public class DailyLeadProcessorTest {
    
    @isTest
    static void testSchedulable() {
        List<Lead> LLL = new List<Lead>();
        for (Integer i=0; i<200; i++) {
            LLL.add(new Lead(Company = 'DUMMY', LastName = 'DUMMY_LastName'));
        }
        insert LLL;
        Map<Id, Lead> leadMap = new Map<Id, Lead>(LLL);
        List<Id> leadIds = new List<Id>(leadMap.keySet());

        Test.startTest();
        String jobId = System.schedule('ScheduledApexTest', '0 0 0 15 3 ? 2022', new DailyLeadProcessor());
        Test.stopTest();
        
        List<Lead> leadList = [SELECT Id FROM Lead WHERE Id IN :leadIds];
        System.assertEquals(200, leadList.size());
    }
}