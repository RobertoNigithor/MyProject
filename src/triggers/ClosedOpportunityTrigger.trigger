// Crea una Task per le opportunity create con lo stagename indicato, è un
// buon esempio di creazione di oggetto correlato con trigger
trigger ClosedOpportunityTrigger on Opportunity (before insert) {
    List<Task> listTask=new List<Task>();
    for(Opportunity o : Trigger.new){  // Sono i valori che inseriamo nuovi
        if(o.StageName.equals('Closed Won')){  // Se queste op inserite hanno questo StageName
            Task t=new Task(Subject='Follow Up Test Task', WhatId=o.Id);  // Crea una nuova Task conl'ID collegato all'op
            listTask.add(t);  // La aggiunge alla lista delle task
        }
    }
     insert listTask;  // Operazione DML per inserire tutte le Task nuove


}