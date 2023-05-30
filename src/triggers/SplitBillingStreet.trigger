trigger SplitBillingStreet on Account (before insert, before update) {
    // Si occupa di splittare il Billing Street

    /*if(Trigger.isInsert){
         SplitBillingStreetClass.Splitting(Trigger.New, null);
    }
     if(Trigger.isUpdate){
        SplitBillingStreetClass.Splitting(Trigger.New, Trigger.oldMap);
    }*/
}