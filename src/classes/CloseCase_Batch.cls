global class CloseCase_Batch implements Database.Batchable<SObject> {
    global String query;
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        query = 'SELECT RecordTypeId, Status FROM Case WHERE Status!=\'Closed\' AND CreatedDate<LAST_N_DAYS:3';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Case> batchRecords) {

        Map<String, Schema.RecordTypeInfo> CAS_RECORD_TYPES = Schema.SObjectType.Case.getRecordTypeInfosByName();
        String CAS_RECORD_TYPES_ID = CAS_RECORD_TYPES.get('Closed Cases').getRecordTypeId();
        for(Case c : BatchRecords) {
            c.Status='Closed';
            c.RecordTypeId = CAS_RECORD_TYPES_ID;
            }
        Update BatchRecords;
	}
	global void finish(Database.BatchableContext BC) {
    }
}