public class AccountProcessor {
    @future
    public static void countContacts(Set<Id> Ids) {
        // To call this method:
        // Set<Id> Ids =  new Set<id>(new Map<Id, sObject>([SELECT Id from Account]).keySet());
		// AccountProcessor.countContacts(Ids);
		// 
        List<Account> accts = [SELECT Id, Number_of_Contacts__c, (SELECT Id FROM Contacts) FROM Account WHERE Id in :Ids];
    	for (Account tmp  : accts) {
    		tmp.Number_of_Contacts__c = tmp.Contacts.size();
    	}
        update accts;
    	System.debug(accts);
    }
}