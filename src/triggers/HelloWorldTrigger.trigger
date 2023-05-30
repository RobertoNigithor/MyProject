// Semplicissimo esempio di un trigger su Account che aggiunge una descrizione
trigger HelloWorldTrigger on Account (before insert) {
    /*for(Account a : Trigger.New) {
        a.Description = 'New description2';//Anche se non c'è alcuna operazione DML il field viene lo stesso modificato
    }*/
}