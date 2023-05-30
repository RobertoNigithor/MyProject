global class Scheduler_BatchGaseLuce implements Schedulable {
    global void execute(SchedulableContext ctx) {
       Database.executeBatch(new BatchGaseLuce('Luce'), 200);  // Questo è il Batch che verrà eseguito
        
        // System.schedule('Hourly', '0 0 * * * ?', new Scheduler_BatchGaseLuce() );   per eseguirlo
    }
    
}