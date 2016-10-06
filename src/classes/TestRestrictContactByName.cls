@isTest
private class TestRestrictContactByName {
	@isTest static void TestInsertIntoContact() {
		Contact ccc = new Contact(LastName = 'INVALIDNAME');
		try {
			insert ccc;
		} catch (System.DmlException e) {
			   System.debug(e.getMessage());
			   System.assert(e.getMessage().contains('The Last Name "INVALIDNAME" is not allowed for DML'),e.getMessage());
   			   System.debug(e.getDmlType(0));
               System.assertEquals(StatusCode.FIELD_CUSTOM_VALIDATION_EXCEPTION, e.getDmlType(0));
		}
	}
}