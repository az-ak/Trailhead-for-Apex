/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class TestVerifyDate {

    static testMethod void testPositive() {
        // TO DO: implement unit test
        Date d1 = date.newInstance(2016,1,1);
        Date d2 = date.newInstance(2016,1,2);
        Date aa = VerifyDate.CheckDates(d1, d2);
        System.assertEquals(d2,aa);
    }

    static testMethod void testNegative1() {
        Date d1 = date.newInstance(2016,3,1);
        Date d2 = date.newInstance(2016,1,2);
        Date d3 = date.newInstance(2016,3,31);
        Date aa = VerifyDate.CheckDates(d1, d2);
        System.assertEquals(d3,aa);
    }
    
    static testMethod void testNegative2() {
        Date d1 = date.newInstance(2016,1,1);
        Date d2 = date.newInstance(2016,9,2);
        Date d3 = date.newInstance(2016,1,31);
        Date aa = VerifyDate.CheckDates(d1, d2);
        System.assertEquals(d3,aa);
    }
}