@istest
class BatchScheduleTest {
 
   static testmethod void test() {
   Test.startTest();
       String cron='0 0 * * * ?';
 
      String jobId = System.schedule('scheduled_job',cron,new CloseCase_Scheduled());
 
   Test.stopTest();
 
   }
}