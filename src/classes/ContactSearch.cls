public class ContactSearch {
    public static List<Contact> searchForContacts(String cognome,String postalCode){
        List<Contact> con = [SELECT Id,Name 
                          FROM Contact WHERE lastname=:cognome and MailingPostalCode=:postalCode]; 
        System.debug(con);
        return con;
        
    }
}