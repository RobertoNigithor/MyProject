public class AccountUtils {

    public static List<Account> accountsByState(String abbreviation) {
        List<Account> act = new List<Account>();
        act= [select Id,Name from Account where BillingState=:abbreviation];
        System.debug('Result : ' + act);  
        return act;

    }
}