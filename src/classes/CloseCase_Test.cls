@isTest 
public class CloseCase_Test 
{
    static testMethod void testMethod1() 
    {

         Case cas = new Case();
         cas.Status ='New';
		 insert cas;
         Test.setCreatedDate(cas.Id, datetime.now().addDays(-5));
        
        Test.startTest();

            CloseCase_Batch obj = new CloseCase_Batch();
            DataBase.executeBatch(obj); 
            
        Test.stopTest();
    }
}