/**
 * @description       : 
 * @author            : Rodrigo Braun
 * @group             : 
 * @last modified on  : 09-10-2022
 * @last modified by  : Rodrigo Braun
**/
@isTest
private class AnimalLocatorTest {
    @isTest static void AnimalLocatorMock() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String actual = AnimalLocator.getAnimalNameById(1);
        String expected = 'chicken';
        System.assertEquals(actual, expected);
    }
}