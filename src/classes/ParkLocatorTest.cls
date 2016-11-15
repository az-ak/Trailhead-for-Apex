@isTest
public class ParkLocatorTest {
    @isTest static void testCallout() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String[] result = ParkLocator.country('Japan');
        System.assertEquals(new String[] {'Mock Response1','Mock Response2'} ,result);
    }
}