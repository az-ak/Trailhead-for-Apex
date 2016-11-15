@isTest
public class AnimalLocatorTest {
    @isTest
    static void testPostCallout () {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        System.assertEquals('chicken', AnimalLocator.getAnimalNameById(1));
    }
}