public with sharing class SplitBillingStreetClass {
    public static void Splitting(List<Account> AccountList, Map<Id, Account> mappa){
        
              List<String>  X = new List<String>();
              List<String> gastani= new List<String>();
              String tipovia=' ';
              String contenitore= ' ';
              Set<String> tipi = new Set<String> {
                      'Corso',
                    'Largo',
                    'Parco',
                   'Piazza',
                    'Piazzale',
                    'Piazzetta',
                    'Porta',
                    'Strada',
                    'Via',
                   'Viale',
                   'Vicolo'
            };
                   
                if(mappa==null){
                    for (Account a: AccountList){
                        Pattern p = Pattern.compile('[0-9](.*)');
                        Matcher m = p.matcher(a.BillingStreet);
                              X = a.BillingStreet.split(' ');  
                              tipovia= X.get(0);
                             for(Integer i=0;i<X.size();i++){
                             if (i==0 && tipi.contains(tipovia)){
                                  a.Type__c= X.get(0);
                             }
                             if (i==X.size()-1 && m.find()){
                                 a.Civic_Number__c=X.get(i);
                             }
                             else{
                                  gastani.add(X.get(i));
                              }
                        }                
                             for(Integer j=0;j<gastani.size();j++){
                                 contenitore+=gastani.get(j)+' ';
                             }
                             a.Address__c = contenitore;
                    }
               }
        else{
              for (Account a: AccountList){
                     if (a.BillingStreet!=mappa.get(a.Id).BillingStreet){
                           Pattern p = Pattern.compile('[0-9](.*)');
                           Matcher m = p.matcher(a.BillingStreet);
                           X = a.BillingStreet.split(' ');  
                           tipovia= X.get(0);
                        for(Integer i=0;i<X.size();i++){
                          if (i==0 && tipi.contains(tipovia)){
                               a.Type__c= X.get(0);
                          }
                         else if (i==X.size()-1 && m.find()){
                              a.Civic_Number__c=X.get(i);
                          }
                          else{
                               gastani.add(X.get(i));
                           }
                     }                
                          for(Integer j=0;j<gastani.size();j++){
                              contenitore+=gastani.get(j)+' ';
                          }
                          a.Address__c = contenitore;
                 }
               }
    }
 
 }
}