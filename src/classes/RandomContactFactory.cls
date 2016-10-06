public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numContacts, String s) {
        List<Contact> contacts = new List<Contact>();
        for (Integer i=0; i<numContacts; i++) {
            Contact c = new Contact(FirstName = 'FN' + i, LastName = s);
            contacts.add(c);
        }
        return contacts;
    }
}