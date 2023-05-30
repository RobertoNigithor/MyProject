public class CMD_CaseTriggerClass {
    
    public void assignmentCase(List<Case> cts){
        
        List<CMD_Case__mdt> cmds = [SELECT CMD_Set__c, UserName__c FROM CMD_Case__mdt];  
        Map<Id,CMD_Case__mdt> casemap = new Map<ID,CMD_Case__mdt>(cmds);
        System.debug('casemap.values --- >>>> '+casemap.values());
        SET<ID> keys = casemap.keyset();
        List<User> usr = [SELECT Name, id FROM user ];
        System.debug('set<id> - - - - - - > '+keys);
        //String s = 
        
        for(Case c : cts){
            for(CMD_Case__mdt cmd : casemap.values()){
                if(c.SetDiValori__c == cmd.CMD_Set__c){
                    for(User u : usr){
                        if(u.Name == cmd.UserName__c){ 
                            c.User__c = u.Id;
                        } 
                        /*else{ 
                       c.addError('User ' + cmd.UserName__c + ' does not exist');
                     } */
                    }
                  }
                         
            }            
        }         
    }  
}