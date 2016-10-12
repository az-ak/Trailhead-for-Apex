public class AccountProcessor {
    @future
    public static void countContacts(List<Id> accts1) {
    	for (List<Account> accts2 : [SELECT Id, (SELECT Id FROM Contacts) FROM Account WHERE Id in :accts1]) {
    		accts2.Number_of_Contacts__c = accts2.Contact.size();
    	}
    	try {
    		update accts2;
    		System.debug(accts2);
    	} catch (DmlException e) {
    		System.debug('A DML exception has occurred: ' + e.getMessage());
    	}
    }
}