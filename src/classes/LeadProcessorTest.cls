@isTest
public class LeadProcessorTest {
    @testSetup
    static void setup () {
        Lead[] LLL = new List<Lead>();
        for (Integer i=0; i<200; i++) {
            LLL.add(new Lead(LastName='Name '+i,Company='Corp '+i));
        }
        insert LLL;
    }
    
    @isTest
    static void test() {
        Test.startTest();
        LeadProcessor LP = new LeadProcessor();
        Id batchId = Database.executeBatch(LP);
        Test.stopTest();
        System.assertEquals(200,[SELECT count() FROM Lead WHERE LeadSource = 'Dreamforce']);
    }

}