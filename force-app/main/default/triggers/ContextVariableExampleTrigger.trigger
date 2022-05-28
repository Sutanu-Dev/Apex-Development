trigger ContextVariableExampleTrigger on Account (before insert, after insert, after delete ) {
       if (trigger.isInsert){
           if(trigger.isBefore){
               //run this code before creating the record
           }
           if(trigger.isAfter){
               //run this code after creating the record
           }
        if(trigger.isDelete){
                //run this code after deleting the record
            }

       }
}