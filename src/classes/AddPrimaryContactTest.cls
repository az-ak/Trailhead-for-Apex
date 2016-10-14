@isTest
public class AddPrimaryContactTest {
    @testSetup
    static void setup() {
        List<Account> acct = new List<Account>();
        for (Integer i=0; i<50; i++) {
            acct.add(new Account(Name='NY'+i, BillingState = 'NY'));
            acct.add(new Account(Name='CA'+i, BillingState = 'CA'));
        }
        insert acct;
    }
    
    @isTest
    static void testQueueable() {
        Contact con = new Contact(LastName='DUMMY');
        AddPrimaryContact q = new AddPrimaryContact(con,'CA');
        Test.startTest();
        System.enqueueJob(q);
        Test.stopTest();
        System.assertEquals(50, [SELECT count() FROM Contact WHERE AccountId in :[SELECT Id FROM Account WHERE BillingState = 'CA']]);
    }

}