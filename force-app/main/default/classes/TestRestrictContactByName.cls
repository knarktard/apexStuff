/**
 * @description       : 
 * @author            : Rodrigo Braun
 * @group             : 
 * @last modified on  : 09-04-2022
 * @last modified by  : Rodrigo Braun
**/
@isTest
private class TestRestrictContactByName {

    @isTest static void TestCheckName() 
    {
    
        List<Contact> listContact= new List<Contact>();
        Contact c1 = new Contact(FirstName='Donald', LastName='Duck' , email='Test@test.com');
        Contact c2 = new Contact(FirstName='Donald1', LastName = 'INVALIDNAME',email='Test@test.com');
        listContact.add(c1);
        listContact.add(c2);
        
        Test.startTest();
            try
            {
                insert listContact;
            }
            catch(Exception ee)
            {
            }
        
        Test.stopTest(); 
        
    }
    
}