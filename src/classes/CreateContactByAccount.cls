/**
 * Created by rober on 24/12/2020.
 */
// Classe Invocata da un Trigger su Account, che crea dei contatti correlati se determinati parametri di picklist
// sono segnati, quando l'account viene cancellato, cancella pure i relativi contatti
public with sharing class CreateContactByAccount {

    /*
    //Questo metodo inserisce dei contatti relazionati ad un determinato Account
    public static void CreateContacts(List<Account> act) {
        List<Contact> ctList = new List<Contact>();
        for (Account a : act) {
            Integer i = 0;
            if (a.Rating == 'Hot' && a.Ownership == 'Public') {
                Contact ct = new Contact(Salutation = 'Mr', LastName = 'CreatedByTrigger' + i, AccountId = a.id);
                ctList.add(ct);

            }
        }
        insert ctList;

    }
    // Questo metodo cancella i contatti di un account parent che ha determinati campi
    public static void AfterDelete(List<Account> act) {
        List<Id> actId = new List<Id>();
        for (Account a : act) {
            if (a.Rating == 'Hot' && a.Ownership == 'Public') {
                actId.add(a.Id);
            }
        }
        List<Contact> ctList = [SELECT Id FROM Contact WHERE AccountId = :actId];
        delete ctList;
    }
    *
     */

    public static void updateOwnerAct(List<Account> newAccs){

        System.debug(' newAccs '+newAccs);

        List<User> users = new List<User>();

        users = [SELECT id, name FROM User Where name = 'Damiano Strano' OR name = 'Prova'];

        System.debug('users - > '+users);

        Map<String, User> ownersMap = new Map<String, User>();

        for (User usr : users){

            ownersMap.put(usr.Name, usr);

        }

        System.debug(' ownersMap '+ownersMap);


        for (Account act : newAccs){
            if(ownersMap.containsKey(act.OwnerName__c) &&
                    ownersMap.get(act.OwnerName__c).Name == 'Damiano Strano'  ){
                act.OwnerId = ownersMap.get('Prova').Id;
            } else{
                act.OwnerId = ownersMap.get('Damiano Strano').Id;
            }

        }

    }
}