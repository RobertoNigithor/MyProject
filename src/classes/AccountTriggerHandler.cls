public class AccountTriggerHandler {
    public static void CreateAccounts(List<Account> acctList) {
        for(Account a:acctList) {
            if(a.ShippingState != a.BillingState) {
                a.ShippingState = a.BillingState;
            }
        }
    }
    
     public static void updateOwnerAct(List<Account> newAccs){
         
        System.debug(' newAccs '+newAccs);

        List<User> users = new List<User>();

        users = [SELECT id FROM User Where name = 'Roberto Chinnici' OR name = 'Giovanni Napoli'];

        System.debug('users - > '+users);

        Map<String, User> ownersMap = new Map<String, User>();

        for (User usr : users){

            ownersMap.put(usr.Name, usr);

        }

        System.debug(' ownersMap '+ownersMap);

        for (Account act : newAccs){
            if(ownersMap.get(act.owner.Name).Name == 'Roberto Chinnici'){
               act.Name =  'Giovanni Napoli';

            } else{
                act.Name =  'Roberto Chinnici';

            }

        }

    }
}