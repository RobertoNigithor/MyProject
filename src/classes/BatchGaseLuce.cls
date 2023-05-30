global class BatchGaseLuce implements 
    Database.Batchable<sObject>, Database.Stateful {
    
        String str;
     global BatchGaseLuce(String typeBill) {
        this.str = typeBill;
    }   
        
    // instance member to retain state across transactions
    global Integer recordsProcessed = 0;
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Id,name FROM Account WHERE Id NOT In (SELECT Account__c FROM Bolletta__c)'
        );
    }
    global void execute(Database.BatchableContext bc, List<Account> scope){
        // process each batch of records
        List<Bolletta__c> bills = new List<Bolletta__c>();
        for (Account bl : scope) {
				Bolletta__c blt = new Bolletta__c(Account__c=bl.Id,name='Gianni',TypeGasLuce__c=str,price__c=666);
				// add contact to list to be updated
                bills.add(blt);
                // increment the instance member counter
                recordsProcessed = recordsProcessed + 1;   
        }
        insert bills;
    }    
    global void finish(Database.BatchableContext bc){
       
    }    
}