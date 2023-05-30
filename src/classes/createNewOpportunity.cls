@RestResource(urlMapping='/Opportunities/*')  //Si mette il plurale anche se potrebbe funzionare anche il singolare in teoria 
global with sharing class createNewOpportunity {
      @HttpPost
   global static ID createOpportunity(String accountid,String name,String stagename,Date closedate) {
        Opportunity thisOpportunity = new Opportunity(
            AccountId=accountid,         //Crea una nuova opportunity con un Account correllato
            Name=name,
            StageName=stagename,   //Ho messo tutti i valori che erano obbligatori di Opportunity
            CloseDate=closedate
        );
        insert thisOpportunity;
        return thisOpportunity.Id;//Ricorda per l'inserimento che le var del json devono avere lo stesso nome dei parametri in ingresso nella funzione
    } 
   //Questo è l'Header : /services/apexrest/Opportunities/
    //Inserimento : {"accountid" : "0015I000004VSWIQA4" , "name" : "OpportunityCreateByPostMethod2" , "stagename" : "Qualification" , "closedate" : "2020-02-27"}
     @HttpGet
    global static List<Opportunity> getOpportunitiesById() {
        RestRequest request = RestContext.request;
        String oppId = request.requestURI.substring(
          request.requestURI.lastIndexOf('/')+1);
        // grab the caseId from the end of the URL

        List<Opportunity> result =  [SELECT  AccountId,Name FROM Opportunity WHERE Id = :oppId];
        
        return result;
    }
    
    @HttpPut
	global static ID upsertOpportunity(String name,String stagename,Date closedate,String id) {
    Opportunity thisOpp = new Opportunity(
        Id=id,
        Name=name,
        StageName=stagename,
        CloseDate=closedate
    );
    upsert thisOpp;
    return thisOpp.Id;
	}
    //Aggiornamento{"id" : "0065I000003dcv3QAA" , "name" : "OpportunityCreateByPostMethod2" , "stagename" : "Prospecting" , "closedate" : "2020-02-27"}
	//Semplicemente cambio il campo Prospecting
	 
    @HttpDelete
    global static void deleteOpportunity() {
        RestRequest request = RestContext.request;//Faccio la query per prendere l'id e cancellare l'opportunity con quel nome che gli dico io
        List<Opportunity> thisOpportunity = [SELECT Id FROM Opportunity WHERE Name = 'OpportunityCreateByPostMethod'];
        delete thisOpportunity;
    }  
    
}