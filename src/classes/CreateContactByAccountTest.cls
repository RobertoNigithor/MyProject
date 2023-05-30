/**
 * Created by rober on 28/12/2020.
 */
// Inserisce degli Account con i campi richiesti, coprendo la parte relativa all'inserimento
// E poi effettua la cancellazione, la copertura finale è al 100%
@IsTest
public class CreateContactByAccountTest {
    @IsTest static void testInsertAccount(){

            List<Account> act=new List<Account>();
            for(Integer i=0;i<200;i++){
                Account a=new Account(Name='TestCreateAccount'+i,Rating='Hot',Ownership='Public');
                act.add(a);
        }
        Test.startTest();
        insert act;
        Test.stopTest();

    }
    @IsTest static void testDeleteAccount(){
        List<Account> act=new List<Account>();
        for(Integer i=0;i<200;i++){
            Account a=new Account(Name='TestCreateAccount'+i,Rating='Hot',Ownership='Public');
            act.add(a);
        }
        insert act;  //Ricorda : viene creato un nuovo context all'inizio di start, e cioè il governor limit viene resettato
        System.debug('------------------------ Inizio messaggi limits --------------------------------------');
        Limits.getCallouts();
        Limits.getDmlStatements();
        Limits.getLimitDmlStatements();
        Test.startTest();
        delete act;
        Test.stopTest(); //Per poi tornare come prima alla fine, e cioè allo stop
    }
}