public class StringArrayTest {
    public static list<string> generateStringArray(integer n){
        list<string> listToReturn = new list<string>();
        
        for(integer i =0; i<n; i++){
            listToReturn.add('Test ' + i);
        }
        return listToReturn;
    }
}