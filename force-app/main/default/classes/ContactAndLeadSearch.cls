/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-31-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String tofind) {
        List<List<sObject>> bla = [FIND :tofind IN ALL FIELDS RETURNING Contact(LastName), Lead(LastName)];
        return bla;

    }
}
