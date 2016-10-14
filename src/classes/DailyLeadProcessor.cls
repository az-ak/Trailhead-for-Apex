global class DailyLeadProcessor implements Schedulable {
    global void execute (SchedulableContext ctx) {
        List<Lead> LLL = new List<Lead>([SELECT Id, LeadSource FROM Lead Where LeadSource = '' LIMIT 200]);
        for (Lead L: LLL) {
            L.LeadSource = 'Dreamforce';
        }
        update LLL;
    }
}