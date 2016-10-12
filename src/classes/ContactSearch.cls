public class ContactSearch {
	public static List<Contact> searchForContacts (String arg1, String arg2) {
		List<Contact> ccc = [SELECT Id, Name FROM Contact WHERE LastName = :arg1 AND MailingPostalCode = :arg2];
		System.debug(ccc);
		return ccc;
	}
}