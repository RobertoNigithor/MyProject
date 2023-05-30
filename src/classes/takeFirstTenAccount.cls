public class takeFirstTenAccount {
    
    List<Account> acc=[SELECT name FROM Account LIMIT 10];
   
    Contact[] techContacts = [SELECT FirstName,LastName 
                          		FROM Contact];
    
}