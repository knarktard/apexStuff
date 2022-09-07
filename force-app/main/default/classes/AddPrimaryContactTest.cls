/**
 * @description       : 
 * @author            : Rodrigo Braun
 * @group             : 
 * @last modified on  : 09-07-2022
 * @last modified by  : Rodrigo Braun
**/
@isTest
public with sharing class AddPrimaryContactTest {
    @isTest
    public static void testQueableClass() {
        List<Account> accounts = new List<Account>();
        for(Integer i=0; i<500;i++){
            Account acc = new Account(Name = 'Test Account');
            if( i < 250){
                acc.BillingState = 'NY';
            }else{
                acc.BillingState = 'CA';
            }
            accounts.add(acc);
        }
        insert accounts;

        Contact contact = new Contact(FirstName = 'Donald', LastName= 'Duck');
        insert contact;

        Test.startTest();
        Id jobId = System.enqueueJob(new AddPrimaryContact(contact, 'CA'));
        Test.stopTest();

        List<Contact> contacts = [SELECT Id FROM Contact WHERE Contact.Account.Billingstate = 'CA'];
        System.assertEquals(200, contacts.size(), 'ERROR: Incorrect number of Contact records found');
    }
}
