global with sharing class LeadProcessor Implements Database.Batchable<SObject> {
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select Id,Name from Lead');
    }

    global void execute(Database.BatchableContext bc, List<Lead> scope){
        List<Lead> leads = new List<Lead>();
        for(Lead lead :scope){
            lead.LeadSource = 'Dreamforce';
            leads.add(lead);
        }
        update leads;
    }

    global void finish(Database.BatchableContext bc){

    }
}
