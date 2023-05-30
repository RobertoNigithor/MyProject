public class CreatedAccount {
    public static List<Account> createAccount(Integer n,String nameee){
		 List<Account> accountList =new List<Account>();
        for(Integer i;i<n;i++)
        {
            Account acc=new Account(Name=nameee);
          accountList.add(acc);
            insert accountList;
        }
        return accountList;
    }
    public static List<Contact> createContact(Integer n,String nameee){
        List<Contact> contactList= new List<Contact>();
        for(Integer i;i<n;i++){
            List<Account> acc=new List <Account>();
            acc=createAccount(n,nameee);
            Contact cont =new Contact(LastName=nameee);
            cont.AccountId=acc[i].Id;
            insert cont;
            contactList.add(cont);
        }
        return contactList;
    }
}