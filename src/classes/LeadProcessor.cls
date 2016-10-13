global class LeadProcessor implements Database.Batchable<sObject> {

    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator( 'select LeadSource from Lead' );
    }

    global void execute(Database.BatchableContext bc, List<Lead> allLeads){
        for (Lead LLL : allLeads) {
            LLL.LeadSource = 'Dreamforce';
        }
        update allLeads;
    }    

    global void finish(Database.BatchableContext bc){
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, 
                            TotalJobItems, CreatedBy.Email FROM AsyncApexJob 
                            WHERE Id = :bc.getJobId()];
        System.debug(job);
    }    
    
}