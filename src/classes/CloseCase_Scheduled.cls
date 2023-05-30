global class CloseCase_Scheduled implements Schedulable {
    global void execute(SchedulableContext ctx) {
       Database.executeBatch(new CloseCase_Batch(), 200);  // Questo è il Batch che verrà eseguito
        
        // System.schedule('Hourly', '0 0 * * * ?', new CloseCase_Scheduled());   per eseguirlo
    }
}