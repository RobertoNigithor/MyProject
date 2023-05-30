public class ContactsController {
    @AuraEnabled
   public static List <Contact> getContacts() {
       return [SELECT  Id,Name, MobilePhone,Email FROM Contact ORDER BY createdDate ASC];
   }    
  @AuraEnabled
   public static List<Contact> findByName(String searchKey) {
       String name =  + searchKey + '%';
       return [SELECT Name, MobilePhone,Email FROM Contact WHERE name LIKE :name];
   }

   @AuraEnabled
   public static void insertCont(String Firstname, String Lastname,String Email){
       Contact con = new Contact();
       con.FirstName = Firstname;
       con.LastName  = Lastname;
       con.Email = Email;
       insert con;
       
   }

}