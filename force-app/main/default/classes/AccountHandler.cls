public with sharing class AccountHandler {
    public static Account insertNewAccount(String AccountName) {
        try{
            Account newAccount = new Account(Name=AccountName);
            insert newAccount;
            return newAccount;
         } catch( DmlException err){
            system.debug('A DML Exception Has Occured : ' + err.getMessage());
            return null;
        
        }
    }
}