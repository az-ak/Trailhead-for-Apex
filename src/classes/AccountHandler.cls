public class AccountHandler {
	public static Account insertNewAccount(String aname) {
		Account a = new Account();
		a.Name = aname;
		try {
			insert a;
			// System.debug('New Account ' + a.Name + ' created.');
			System.debug(a);
			return a;
		} catch (DmlException e) {
			System.debug('A DML exception occurred: ' + e.getMessage());
			return null;
		}
	}
}