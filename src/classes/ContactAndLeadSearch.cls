public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String arg){
    	List<List<sObject>> searchList = [FIND :arg IN ALL FIELDS 
    	RETURNING Contact(FirstName,LastName), Lead(FirstName,LastName) ];
    	System.debug(SearchList);
    	return searchList;
    }
}