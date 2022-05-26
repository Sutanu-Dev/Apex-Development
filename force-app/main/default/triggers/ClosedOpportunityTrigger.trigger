trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {

    Task[] taskList = new List<Task>();
       for(Opportunity o : [Select Id,Name From Opportunity Where StageName ='Closed Won']){

         taskList.add(New Task(Subject = 'Follow Up Test Task', WhatId = o.Id));   
       }
       if(taskList.size()>0){
           insert taskList;
       }
}