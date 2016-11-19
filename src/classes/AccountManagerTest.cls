@isTest
private class AccountManagerTest {
    
    @isTest static void testGetAccount() {
        Id recordId = createTestRecord();
        RestRequest request = new RestRequest();
        request.requestUri = 
//            'https://unmk-dev-ed.my.salesforce.com/services/apexrest/AccountManager/'
           'https://unmk-dev-ed.my.salesforce.com/services/apexrest/Accounts/'
            + recordId + '/contacts';
		request.httpMethod = 'GET'; 
        RestContext.request = request; 
        Account dummyAccount = AccountManager.getAccount();
        System.assert(dummyAccount != null);
 		System.assertEquals('Dummy Company', dummyAccount.Name);
        System.debug(dummyAccount.Contacts[0].Name);
        System.assertEquals('Dummy Emp#1', dummyAccount.Contacts[0].Name);
    }
    
    static Id createTestRecord () {
        Account a = new Account (Name = 'Dummy Company');
        Insert a;
        Contact c1= new Contact (FirstName = 'Dummy', LastName = 'Emp#1', AccountId = a.Id);
        Contact c2= new Contact (FirstName = 'Dummy', LastName = 'Emp#2', AccountId = a.Id);
        insert c1;
        insert c2;
        return a.Id;
    }
}