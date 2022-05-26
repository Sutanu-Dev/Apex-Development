trigger ExampleTrigger on Contact (before insert) {

    if(trigger.isInsert){
        Integer recordCount = trigger.new.size();

    //calling a method from another class
    EmailManager.sendMail('sutanudebnath5@gmail.com','Trailhead Trigger Tutorial', recordCount + 'Contact(s) were inserted');
    
    } else{
        if(trigger.isDelete){
            //process after delete
        }
    }

}