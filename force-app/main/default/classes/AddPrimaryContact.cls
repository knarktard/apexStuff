/**
 * @description       : 
 * @author            : Rodrigo Braun
 * @group             : 
 * @last modified on  : 09-07-2022
 * @last modified by  : Rodrigo Braun
**/
public with sharing class AddPrimaryContact implements Queueable {
    private Contact contact;
    private String state;
    
    public AddPrimaryContact(Contact inputContact, String inputState) {
        this.Contact = inputContact;
        this.state = inputState;
    }
    public void execute(QueueableContext context) {
        List<Account> accounts = [SELECT Id FROM Account WHERE BillingState = :state LIMIT 200];
        List<Contact> contacts = new List<Contact>();

        for(Account acc : accounts){
            Contact contactClone = contact.clone();
            contactClone.AccountId = acc.Id;
            contacts.add(contactClone);

        }
        insert contacts;
    }
}
