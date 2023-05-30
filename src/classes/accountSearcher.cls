public class accountSearcher{

public static Date startDate{get;set;}
public static Date endDate{get;set;}
public static List<Account> accList{get;set;}
public boolean showResult{get;set;}
public boolean blnNoResultFound{get;set;}

public accountSearcher(){
    showResult = false;
    blnNoResultFound = false;
    accList = new List<Account>();
}
public PageReference searchAccount(){
    if(startDate != NULL && endDate != NULL){
        accList = [SELECT Id,Name FROM Account WHERE createdDate >= : startDate AND createdDate <: endDate];
    } 
    if(accList.size() > 0){
         showResult = true;
         blnNoResultFound = false;
    }
    else{
         blnNoResultFound = true;
         showResult = false;
    }
    return null;        
      }
   }