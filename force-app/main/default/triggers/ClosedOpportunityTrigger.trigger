/**
 * @description       : 
 * @author            : Rodrigo Braun
 * @group             : 
 * @last modified on  : 08-31-2022
 * @last modified by  : Rodrigo Braun
**/
trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {

    List<Task> taskList = new List<Task>();

    for (Opportunity opp : [Select Id, StageName FROM Opportunity WHERE StageName = 'Closed Won' AND Id IN :Trigger.new]){

    taskList.add(new Task(Subject='Follow Up Test Task', WhatId=opp.Id));
    }

    if (taskList.size()>0){

        insert taskList;
    }

}