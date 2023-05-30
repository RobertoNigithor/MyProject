public class Search {
     @AuraEnabled
    public static List <Contact> getContacts() {
        return [SELECT Id, Name, MobilePhone FROM Contact ORDER BY createdDate ASC];
    }    
   @AuraEnabled
    public static List<Contact> findByName(String searchKey) {
        String name =  + '%' + searchKey + '%';
        return [SELECT Id, Name, MobilePhone FROM Contact WHERE name LIKE :name];
    }
}