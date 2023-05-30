// Questa cls richiamata da un trigger dopo aggiornamento su un account, crea una task per un determinato act
// e tramite un determinato custom setting in cui vi sono l'email partirà una workflow rule che invia delle email ad degli
// indirizzi email, tra cui c'è anche il mio
public class EmailCustomSettingClass {
    public static void setup(List<Account> accountList, Map<Id, Account> accountMap){// Questi parametri son passati dal trigger
  		
        List<EmailCS__c> emailCSList=[Select Email__c from EmailCS__c]; // E' una lista con 3 email create tramite Custom setting
        List<Task> ts=new List<Task>();
        List<id> ids=new List<id>();
        
        for(Account ac : accountList){  // Scorre la lista di account inseriti
            ids.add(ac.id);  // Viene aggiunta alla lista di id gli id dei nuovi account
        }
        // In base all'account selezioniamo i contatti relazionati
        List<Contact> contactList=[Select Id, FirstName, LastName, Email FROM Contact Where AccountId =: ids];
        
        for(Account act : accountList){
        if(act.Type=='Customer - Direct' && act.Rating=='Hot' && accountMap.get(act.Id).Rating!='Hot'){
		  system.debug('Sono nel if ');
            for(Contact cl : contactList)
            {
                for(emailCS__c el : emailCSList){  
                    if(cl.Email==el.Email__c && act.Name == cl.FirstName+' '+cl.LastName){
                    	ts.add(createTask(act.id));  // Crea una task per il determinato account
                        act.flagEmail__c=true;
                	} 
                }
                
           }
        }
      } 
         insert ts;
    }
       public static Task createTask(Id myId ){
           Task t =new Task(Subject='Email',WhatId=myId,status='Not Started');
           system.debug('Sono nella createTask');
           return t;
       }
}
/*Trigger su Account. TRACCIA DEL TESTO ASSEGNATO
Quando è in before update controlla tutti gli account che hanno type Customer-Direct e Rating Hot.
Rating però prima della modifica non deve avere questo valore (!= Hot).
Per ogni Account che rispetta la condizione deve essere recuperato il suo relativo Contact.
Per ogni Contact andare a controllare il campo Email e verificare se quest’indirizzo si trova tra gli indirizzi
email consentiti all’interno di un Custom setting che andrete a creare(lo userete come contenitore di email
consentite e deve poter contenere più di un’email separata da virgola), inoltre verificare che il nome di ogni
Account corrisponda al FirstName + LastName del Contact.
Se le condizioni vengono rispettate a sua volta invocherete un metodo che si occuperà della creazione di un
corrispettivo task con valore WhatId(campo già esistente) riferito all’Id dell’Account(gli altri campi fate voi).
Inoltre aggiornerete un flag a true(create un campo di tipo checkbox sugli account) su ogni Account che
rispetta le condizioni.
Fatto ciò quando questo flag ha valore true partirà una Workflow Rule che notificherà con un’email alert un
indirizzo email a vostra scelta*/