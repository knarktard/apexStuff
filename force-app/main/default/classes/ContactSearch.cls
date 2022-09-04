/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-31-2022
 * @last modified by  : Rodrigo Braun
**/
public with sharing class ContactSearch {
    public static List<Contact> searchForContacts(String lastname, String postalcode) {
        List<Contact> cont = [Select Id, Name FROM Contact WHERE LastName = :lastname AND MailingPostalCode = :postalcode];
        return cont ;

    }
}
