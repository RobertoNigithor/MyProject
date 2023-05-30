/**
 * Created by RChinnici on 28/04/2023.
 */

public with sharing class ApexFundamentals {

    public static void updateStatus(String str){

        if(str == 'myTest'){
            List<Lead> leadList = [SELECT id, Status, CleanStatus
                                FROM Lead
                                WHERE Status = 'Working - Contacted' AND CleanStatus = 'Pending'];

            for (Lead lead : leadList){
                if (lead.Status == 'Working - Contacted') {
                    lead.Status = 'Different';
                }

            }
            //Quindi utilizzare una lista in un for e aggiornare un campo lo modifica!!!!
            System.debug('leadList '+leadList);

            update  leadList;

            updateRelTask(leadList);

        }
    }

    public static void updateRelTask(List<Lead> leadsRelated){

        List<Task> tasksList = [SELECT id, WhoId, Status
                                FROM Task
                                WHERE WhoId in : leadsRelated];

        System.debug('tasksList '+ tasksList);

        Task ts = tasksList[0];
        Lead ld = leadsRelated[0];

        List<Lead> leadsToUp = new List<Lead>();
        List<Task> taskToUp = new List<Task>();

        for(Integer i = 0; i<9999; i++){ // il limite di righe che si possono inserire è 10.000
            Task task;
            if(ts.Status == 'Working - Contacted'){
                task = new Task(WhoId = ld.Id);
                taskToUp.add(task);

            }

        }

        System.debug('taskToUp '+taskToUp);

        insert taskToUp;

    }

}