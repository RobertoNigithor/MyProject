({
    insertHelper : function(component,event,helper){
        var action = component.get("c.insertCont");
        
        action.setParams({ Firstname : component.find("FirstName").get("v.value"),
                            Lastname :component.find("LastName").get("v.value"),
                            Email : component.find("Email").get("v.value")});
                        
            action.setCallback(this, function(response) {
                var state = response.getState();

                if (state === "SUCCESS") {
                    console.log("bravo clap clap");
                }
                
                else if (state === "INCOMPLETE") {
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