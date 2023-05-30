/*// Invia un'email al mio indirizzo dopo che ho inserito un nuovo contatto
// E' un buon esempio di trigger che invia E-mail, e distinzione di come gestire diversi tipi di modi
// che hanno fatto scatenare un trigger tramite l'utilizzo di isInsert*/
trigger ExampleTrigger on Contact (after insert, after delete) {
/*if (Trigger.isInsert) {
    Integer recordCount = Trigger.New.size();    //dicci quanti contatti abbiamo inserito
    // Call a utility method from another class
    EmailManager.sendMail('robertochinnici96@gmail.com', 'Trailhead Trigger Tutorial',
                recordCount + ' contact(s) were inserted.');
}
    //Se invece il contact è stato cancellato
else if (Trigger.isDelete) {
    // Process after delete
}*/
}