public with sharing class ContactSearch {
    public static Contact[] searchForContacts(String LastName, String PostalCode) {
          Contact[] ListOfCon =[Select ID,Name From Contact Where LastName=:LastName AND MailingPostalCode=:PostalCode];
          return ListOfCon;
    }
}