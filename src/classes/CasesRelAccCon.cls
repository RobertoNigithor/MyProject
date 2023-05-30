public class CasesRelAccCon {
    String searchText;
    List<Case> cases;
    public boolean showResult{get;set;}
	public boolean blnNoResultFound{get;set;}


    public class WrapperCases{
        public Case c {get;set;}
        public String comm {get;set;}
        public WrapperCases(Case cas){
                c=cas;
        }
    }
    public List<WrapperCases> wrapCase {get;set;}

    public Contact con {
        get;set;
    }  

    public Boolean em{
        get;set;
    }
   
    public CasesRelAccCon (ApexPages.StandardController stdController) {
        this.con = (Contact)stdController.getRecord();
        doSearch();
    }

    public String getSearchText() {
        return searchText;
    }
      
    public void setSearchText(String s) {
        searchText = s;
    }

    public List<Case> getResults() {
        return cases;
    }

    public PageReference doSearch() {
        Id currentRecordId = con.Id;
        Id RelAcc = [SELECT AccountId FROM Contact WHERE Id= :currentRecordId].AccountId;
        wrapCase = new List<WrapperCases>();
        if(String.isBlank(searchText)){
            cases =[SELECT AccountId,CaseNumber,Subject,Status,Priority,Contact.Name,Comments__c,CommentsCheck__c 
                    FROM Case 
                    WHERE AccountId= :RelAcc AND ContactId!= :con.Id AND Status!='Closed'];
            for (Case ca : cases){
                ca.ContactId = con.Id;
                wrapCase.add(new WrapperCases(ca));
      }
            return null;
        }
        else{
        cases = [SELECT AccountId, CaseNumber,Subject,Status,Priority,ContactId,Contact.Name,CommentsCheck__c,Comments__c
        FROM Case
        WHERE AccountId= :RelAcc AND ContactId!= :con.Id AND Status!='Closed' AND (CaseNumber= :searchText OR Contact.Name= :searchText)];
            for (Case ca : cases){
                ca.ContactId = con.Id;
                wrapCase.add(new WrapperCases(ca));
            }
        return null;
        }
    }
    
    public PageReference saveCase(){
        List<Case> upCases = new List<Case>();
        for(WrapperCases wa : wrapCase){
            if(String.isBlank(wa.c.Comments__c)){
              wa.c.Comments__c = wa.comm +' '+ date.today();
            }
            else{
              wa.c.Comments__c +=' '+ wa.comm +' '+ date.today();
            }
            wa.c.CommentsCheck__c = false;
            upCases.add(wa.c);
        }
        update upCases;
        return null;
    }
}