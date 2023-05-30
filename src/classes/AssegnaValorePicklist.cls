public with sharing class AssegnaValorePicklist {

    public Account act { get;set; }
    
    String searchTextByName{get;set;}
    String searchTextByReason{get;set;}
    String searchTextBySetDiValori{get;set;}
    public List<Case> results;
    public static Date startDate{get;set;}
	public static Date endDate{get;set;}
    public boolean showResult{get;set;}
	public boolean blnNoResultFound{get;set;}

    public AssegnaValorePicklist (ApexPages.StandardController stdController) {
        showResult = false;
   		blnNoResultFound = false;
        this.act = (Account)stdController.getRecord();
        getCases();
    }
    public List<Case> getCases() {
        results = [SELECT Account.Name, CreatedDate, CreatedBy.Name, Reason, SetDiValori__c, CaseNumber, Status FROM Case WHERE AccountId= :act.Id];    
        return results;        

    }     
    public String getSearchTextByName() {
        return searchTextByName;
    }

    public void setSearchTextByName(String s) {
        searchTextByName = s;
    }
    
    public String getSearchTextByReason() {
        return searchTextByReason;
    }

    public void setSearchTextByReason(String s) {
        searchTextByReason = s;
    }
    
    public String getSearchTextBySetDiValori() {
        return searchTextBySetDiValori;
    }

    public void setSearchTextBySetDiValori(String s) {
        searchTextBySetDiValori = s;
    }

    public List<Case> getResults() {
        return results;
    }

    public PageReference doSearch() {
        String newSearchTextByName = '%'+searchTextByName+'%';
        String newSearchTextByReason = '%'+searchTextByReason+'%';
        String newSearchTextBySetDiValori = '%'+searchTextBySetDiValori+'%';
        String idstr=(string)act.Id;
        String resultStr;
        
        resultStr='SELECT Account.Name, CreatedDate, CreatedBy.Name, Reason, SetDiValori__c, CaseNumber, Status FROM Case WHERE (AccountId= :idstr AND Reason LIKE :newSearchTextByReason AND SetDiValori__c LIKE :newSearchTextBySetDiValori AND CreatedBy.Name LIKE :newSearchTextByName)';

               if(startDate != NULL && endDate != NULL){
                //accList = [SELECT Id,Name FROM Account WHERE createdDate >= : startDate AND createdDate <: endDate];
				resultStr+=' AND CreatedDate>= :startDate AND createdDate <: endDate';
            } 
            results=Database.Query(resultStr);
        
            if(results.size() > 0){
                 
                 showResult = true;
                 blnNoResultFound = false;
            }
            else{
                ApexPages.Message errormessage = new ApexPages.Message(ApexPages.Severity.ERROR,'No Records found');
    			ApexPages.addMessage(errormessage);
                 blnNoResultFound = true;
                 showResult = false;       
            }
               
     	            return null;        
              }
         //!NOT(ISNULL(results))      
    public PageReference save() {
        List<Case> updateResults=new List<Case>();
        List<Case> oldValueLst=results;
        for(Case c: results){
            if(c.Status!='Closed'){
                updateResults.add(c);
            }
        }try{
            update updateResults;
        }catch(Exception ex){
      ApexPages.addMessages(ex);
    }
            return null;
    }

}