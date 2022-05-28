trigger AddRelatedRecord2 on Account (after insert, after update) {
       List<Opportunity> oppList = new List<Opportunity>();

      //adding an opportunity for each account if it doesn't already have one
      //iterate over accounts that are in this list but also which don't have opp
      For(Account a : [Select Id,Name From Account Where Id IN :Trigger.new AND Id NOT IN (Select AccountId From Opportunity)]){

        //adding a default opportunity for these account
        oppList.add(new Opportunity(Name=a.Name + 'Opportunity', StageName = 'Prospecting', CloseDate = system.today().addMonths(1), AccountId = a.Id));
      }
      if(oppList.size() > 0){
          insert oppList;
      }
}