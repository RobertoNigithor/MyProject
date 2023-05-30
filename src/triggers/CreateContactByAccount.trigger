/**
 * Created by rober on 24/12/2020.
 */
// Trigger per creare dei contact relazionati e cancella dei contact relazionati
trigger CreateContactByAccount on Account (before insert, after insert, before delete) {
    /*if(Trigger.isInsert){
        CreateContactByAccount.CreateContacts(Trigger.new);

    }
    else if(Trigger.isDelete){
        CreateContactByAccount.CreateContacts(Trigger.old);
    }*/

/*if(Trigger.isBefore&& Trigger.isInsert) {
    System.debug(' newAccs ');
    CreateContactByAccount.updateOwnerAct(Trigger.new);

}*/

}