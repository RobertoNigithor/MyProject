public class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String str)
    {
        List<List<sObject>> searchList = [FIND 'Smith' IN ALL FIELDS 
                   RETURNING Lead(LastName),Contact(LastName)];
        Lead[] searchLeads = (Lead[])searchList[0];
        Contact[] searchContacts = (Contact[])searchList[1];
        System.debug('Found the following accounts.');
        
        for (Lead a : searchLeads) {
            System.debug(a.LastName);
        }
        System.debug('Found the following contacts.');
        for (Contact c : searchContacts) {
            System.debug(c.LastName);
}
        return searchList;
    }
}