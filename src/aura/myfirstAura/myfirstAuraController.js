({
    doInit : function(component,event,helper){      //E' una funzione che viene richiamata dall'aura handler
        helper.searchDataHelper(component,event,helper);  //Con questo chiamo la funzione helper
        console.log("Funziono ;) ");
    },

    update : function(component,event,helper){
        helper.updateHelper(component,event,helper); //Con questo chiamo la funzione helper
    }

});