/**
 * Created by rober on 05/01/2021.
 */

public class yourController {

    public Account acc {get;set;}


    public yourController (ApexPages.StandardController stdController)
    {
        this.acc = (Account)stdController.getRecord();
    }

    public PageReference customSave()
    {
        PageReference pr;
        try{
            database.upsert(acc);
            pr = new PageReference('/'+acc.Id );
        }catch( Exception e ){
            ApexPages.addMessages(e);
        }
        return pr;
    }

}