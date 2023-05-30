public class CasesRelAccCon2 {
    public Contact con {
        get;set;
    }  
    public CasesRelAccCon2 (ApexPages.StandardController stdController) {
        this.con = (Contact)stdController.getRecord();
        getCases();
    }

    public List<Case> getCases() {
        Id currentRecordId = con.Id;
        Id RelAcc = [SELECT AccountId FROM Contact Where Id= :currentRecordId].AccountId;
        List<Case> cases =[SELECT AccountId,CaseNumber,Subject,Status,Priority,Contact.Name,Comments__c,CommentsCheck__c FROM Case WHERE AccountId= :RelAcc AND ContactId!= :con.Id AND Status='New'];
        return cases;
    }

}