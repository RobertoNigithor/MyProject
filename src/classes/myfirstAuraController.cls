public with sharing class myfirstAuraController {
    

    @AuraEnabled    //Questa funz serve per stamparci i record che sono stati creati negli ultimi 4 giorni 
                     //sarà quella che si avvierà prima di tutte,grazie al nostro init
    public static List<Contact> getContact(){  //Il tipo di ritorno è una lista di contatti
        List<Contact> contacts = [SELECT FirstName,LastName, Email,Phone
                        FROM Contact      
                        WHERE CreatedDate >= LAST_N_DAYS:4];//La data di creazione maggiore degli ultimi 4 giorni 
        return contacts;  //Ritorna la lista di contatti che ci interessa dopo la query
    }

    @AuraEnabled  //si mette di standard,per attivare gli aura
    public static void updateContact(List<Contact> contactsUpdate){
        update contactsUpdate;  //Aggiorna la lista che gli stiamo dando,tutto quello che serve 
    }

}