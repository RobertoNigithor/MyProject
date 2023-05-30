public class PersonalFunctionApex {      
    public static void InsertNAccount(Integer n){		//Inserisce N Account ,inserendogli pure dei contatti
        for(Integer i=0;i<n;i++){
            Account act=new Account(name='Goku '+i);             //Creazione new Act
            insert act;                                         //Inserimento dell'Act
            ID actID = act.Id;                               //mi prendo l'id dell'act e lo metto in una var ID
            Contact con=new Contact(FirstName='super '+i,LastName='sayan '+i,AccountId=actID);//Creo new contact con ID dell'account
            insert con;
        }
    } 
    
   public static void AssignContactFirstTenAccount(){   //Seleziona i primi 10 account e gli mette dei contact
		List<Account> act = [SELECT id FROM Account LIMIT 10];     //Assegna i primi 10 Id con la query
     
       List<Contact> listToUpdate = new List<Contact>();  //E' una lista in cui metterò i miei contact
       Integer i=0;
       for (Account a : act){    //un bel for-each  
		   ID conID = a.Id;        //Prendo l'id dell'account ciclato 
           Contact con= new Contact(FirstName='Michey '+i,LastName='Mouse '+i,AccountId=conID); //E ci collego nuovi contatti 
           i++;   //La i serve solo per cambiare il nome in modo numerato
           listToUpdate.add(con);

           //System.debug('ciao '+a);
        }
       upsert listToUpdate;    //In realtà sarebbe un Insert ma vabbè
    }

}