trigger HelloWorldTrigger on Account (before insert) {
       
      for(account a : trigger.new){
         a.Description = 'trigger check description';
      }
}