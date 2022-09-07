/**
 * @description       : 
 * @author            : Rodrigo Braun
 * @group             : 
 * @last modified on  : 09-07-2022
 * @last modified by  : Rodrigo Braun
**/
@isTest
public with sharing class DailyLeadProcessorTest {
    private static String cronExp = '0 0 0 ? * *';
    @isTest
    public static void testSchedulableClass() {
        List<Lead> leads = new List<Lead>();
        for(Integer i=0; i<500; i++){
            if(i<250){
                leads.add(new Lead(LastName='Duck', Company='Blobb'));
            }else{
                leads.add(new Lead(LastName='Duck', Company='Blopp'));
            }
        }
        insert leads;

        Test.startTest();
        String jobId = System.schedule('Process Leads', cronExp, new DailyLeadProcessor());
        Test.stopTest();

        List<Lead> updatedLeads = [SELECT Id, Leadsource FROM Lead WHERE Leadsource = 'Dreamforce'];
        system.assertEquals(200, updatedLeads.size(), 'ERROR: At least 1 record not updated correctly');

        List<CronTrigger> cts = [SELECT Id, TimesTriggered, NextFireTime FROM CronTrigger WHERE Id = :jobId];
        System.Debug('Next fire at ' + cts[0].NextFireTime);
    }
}
