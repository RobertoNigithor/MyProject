
trigger RestrictContactByName on Contact (before insert, before update) {
/*
// Questo trigger permette di evitare che un contact con un determinato campo non venga inserito
// quasi come fosse una validation rule

//check contacts prior to insert or update for invalid data
For (Contact c : Trigger.New) {
    if(c.LastName == 'INVALIDNAME') {   //invalidname is invalid
        c.AddError('The Last Name "'+c.LastName+'" is not allowed for DML');  // Questo sarà l'errore che verrà visualizzato
    }
}*/
}