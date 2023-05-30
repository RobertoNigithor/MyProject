@RestResource(urlMapping='/Accounts/*')
global with sharing class AccountSetPhone {
    
    @HttpGet
    global static List<Account> getAccountsById() {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL

        List<Account> result =  [SELECT  Id,Name FROM Account where Phone=null];
        
        return result;
    }
    
    @HttpPut
    global static List<Account> upsertAccount() {
        List<Account> accounts = new List<Account>();
        RestRequest req = RestContext.request;
        List<jsonWrap> jsonWrapList = (List<jsonWrap>)JSON.deserialize(req.requestbody.tostring(),List<jsonWrap>.class);
        for(jsonWrap json : jsonWrapList){
            Account acc=new Account();
            acc.id=json.id;
            acc.Phone=json.phone;
            accounts.add(acc);
        }
        upsert accounts;
        return accounts;
    }
    
	 @HttpPost
    webService static List<Account> createAccount() {
        List<Account> accounts = new List<Account>();
        RestRequest req = RestContext.request;
        List<jsonWrap> jsonWrapList = (List<jsonWrap>)JSON.deserialize(req.requestbody.tostring(),List<jsonWrap>.class);
        for(jsonWrap json : jsonWrapList){ //jsonWrapList è un object e non può essere inserito per questo si mette in una lista 
            Account acc=new Account();
            acc.Name=json.name;
            acc.Phone=json.phone;
            accounts.add(acc);
        }
        insert accounts;
        return accounts;
    }
    //Inserimento
    /*[ { "name": "test1", "phone": "12312" }, { "name": "test2", "phone": "12312"}, { "name": "test2", "phone": "12312"} ]*/

    public class jsonWrap{
        String name;
        String phone;
        String id;
    }

    
    @HttpDelete
    global static void deleteCase() {
        RestRequest request = RestContext.request;
        List<Account> thisAccount = [SELECT Id FROM Account WHERE CreatedDate = Today];
        delete thisAccount;
    }  
    
    
    
     /* @HttpPut
    global static ID upsertAccount(String phone,String id ) {
        Account thisAccount = new Account(
           		Phone=phone,
            	id=id
        );
        // Match case by Id, if present.
        // Otherwise, create new case.
        upsert thisAccount;
        // Return the case ID.
        return thisAccount.Id;
    }
    inserimento ---> [ { "id": "0015I000005l6ApQAI", "phone": "666" }, { "id": "0015I000005l6AqQAI", "phone": "666"}, { "id": "0015I000005l6ArQAI", "phone": "12312"} ]
     
    @HttpPost
   global static ID createAccount(String name,String phone) {
        Account thisAccount = new Account(
            Name=name,
            Phone=phone
        );
        insert thisAccount;
        return thisAccount.Id;
    } */
    
    
}