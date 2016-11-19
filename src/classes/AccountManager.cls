@RestResource(urlMapping='/Accounts/*/contacts')
// @RestResource(urlMapping='/AccountManager/*')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount (){
        RestRequest request = RestContext.request;
        String AccountId = request.requestURI.substringBetween('/Accounts/' , '/contacts'); 
        Account result = [SELECT Id,Name,(SELECT Id,Name FROM Contacts) FROM Account WHERE Id = :AccountId];
        return result;
    }
}