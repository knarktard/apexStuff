/**
 * @description       : 
 * @author            : Rodrigo Braun
 * @group             : 
 * @last modified on  : 09-07-2022
 * @last modified by  : Rodrigo Braun
**/
public with sharing class DailyLeadProcessor implements Schedulable {
    public void execute(SchedulableContext ctx) {

        List<Lead> leads =[SELECT Id, LeadSource FROM Lead WHERE LeadSource = null LIMIT 200];
        for(Lead l : leads){
            l.LeadSource = 'Dreamforce';
        }
        update leads;

    }
}
