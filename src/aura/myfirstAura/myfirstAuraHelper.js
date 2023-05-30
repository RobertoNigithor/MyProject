({
    searchDataHelper : function(component,event,helper){  //con questa funzione comunichiamo con l'apex
        var action = component.get("c.getContact");  //Prende la lista di contatti  
            action.setCallback(this, function(response) {
                var state = response.getState();  //In questo modo si controlla la risposta e il relativo state
                if (state === "SUCCESS") {  //Se la risposta è positiva allora fai...
                    component.set("v.con",response.getReturnValue());  //ritorna il valore alla nostra var con
                }else if (state === "INCOMPLETE") {
                    // do something
                }else if (state === "ERROR") {  //vabbè errore rip
                    var errors = response.getError();
                    if (errors) {
                        if (errors[0] && errors[0].message) {
                            console.log("Error message: " +
                                     errors[0].message);
                        }
                    } else {
                        console.log("Unknown error");
                    }
                }
            });
        $A.enqueueAction(action);   //mette in coda l'azione
    },
   
    updateHelper : function(component,event,helper){  //e con quest
        var action = component.get("c.updateContact");
        action.setParams({ "contactsUpdate" : component.get("v.con")});
            action.setCallback(this, function(response) {
                var state = response.getState();

                if (state === "SUCCESS") {
                   var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                       "type" : "success",
                        "title": state,
                        "message": "Records have been updated."
                    });
                    toastEvent.fire();

                }else if (state === "INCOMPLETE") {
                    // do something
                    console.log("incomplete");
                }else if (state === "ERROR") {
                    var errors = response.getError();
                    if (errors) {
                        if (errors[0] && errors[0].message) {
                            console.log("Error message: " +
                                     errors[0].message);
                        }
                    } else {
                        console.log("Unknown error");
                    }
                }
            });
        $A.enqueueAction(action);
    }

});