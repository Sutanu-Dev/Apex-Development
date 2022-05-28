public with sharing class ContactAndLeadSearch{
    public static List<List<sObject>> searchContactsAndLeads(String FirstOrLastName) {

        List<List<sObject>> LOrC = [Find :FirstOrLastName in all fields returning 
                                   Contact(Name),Lead(Name)];

        Contact[] conL = (Contact[])LOrC[0];
        Lead[] LeadL = (Lead[])LOrC[1];

        For(Contact c : conL){
            system.debug(c.Name);
        }
        For(Lead l : LeadL){
            system.debug(l.Name);
        }
        
        return LOrC;
    }
}