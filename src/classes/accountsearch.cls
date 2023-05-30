/**
 * Created by rober on 07/01/2021.
 */

public with sharing class accountsearch{
    public List <Case> cas {get;set;}
    public  String searchstring {get;set;}
    public accountsearch(ApexPages.StandardController controller) {
    }
    public void search(){
        System.debug(searchstring);
        string searchquery='select CaseNumber,createddate__c from case where createddate__c ='+ searchString;
        cas= Database.query(searchquery);
        System.debug(cas);
    }
    public void clear(){
        cas.clear();
    }
}