public class DailyLeadProcessor implements Schedulable{
       
    public void execute(SchedulableContext ctx){
        List<Lead> leadList = [Select Id,Name from Lead Where LeadSource = '' Limit 200];
        List<Lead> lList = new List<Lead>();
        for(Lead l:leadList){
            l.LeadSource = 'Dreamforce';
            lList.add(l);
        }
        update lList;
    }
}