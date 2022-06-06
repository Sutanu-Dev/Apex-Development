public class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts(Integer noOfCon, String LName){
        
        List<Contact> conList = New List<Contact>();
        
        for(integer i=0; i<noOfCon; i++){
            Contact c = New Contact(FirstName = 'Test '+i , LastName = LName);
            conList.add(c);
            
        }
        return conList;
    }

}